import 'dart:async';
import 'dart:developer';
import 'package:eb_demo_app/core/utils/constants/strings.dart';
import 'package:eb_demo_app/core/utils/helpers/token_services.dart';
import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart' as client;

@lazySingleton
class SocketSetup {
  final TokenService _tokenService;
  late client.Socket _socket;
  bool _isConnectionOpen = false;

  SocketSetup(this._tokenService);

  /// Getter to check if the socket connection is open
  bool get isConnectionOpen => _isConnectionOpen;

  /// Getter to get the current socket instance
  client.Socket get socket => _socket;

  Future<void> openSocketConnection() async {
    final url = Uri.parse(socketConnectionuri);
    final authToken = await _tokenService.getAccessToken();
    if (authToken == null) {
      log('Socket: token missing!');
      return;
    }
    _socket = client.io(
      url.toString(),
      client.OptionBuilder()
          .setTransports(['websocket'])
          .enableAutoConnect()
          .setExtraHeaders({'authorization': "Bearer $authToken"})
          .build(),
    );

    _socket.connect();

    _socket.onConnect((_) {
      log('Socket Connection established');
    });

    _socket.onDisconnect((_) {
      log('Socket Connection disconnected');
      _isConnectionOpen = false;
    });

    _socket.onConnectError((err) {
      log('Connection error: $err');
    });

    _socket.onError((err) {
      log('Socket error: $err');
    });
  }

  Future<void> maintainSocketConnection(String newToken) async {
    if (_isConnectionOpen) {
      _socket.disconnect();
      _socket.dispose();

      _socket = client.io(
        Uri.parse(socketConnectionuri).toString(),
        client.OptionBuilder()
            .setTransports(['websocket'])
            .enableAutoConnect()
            .setExtraHeaders({'authorization': "Bearer $newToken"})
            .build(),
      );

      _socket.connect();

      _socket.onConnect((_) {
        _isConnectionOpen = true;
        log('Socket Connection re-established after token refreshing');
      });

      _socket.onDisconnect((_) {
        _isConnectionOpen = false;
        log('Socket Connection disconnected');
      });

      _socket.onConnectError((err) {
        log('Connection error: $err');
      });

      _socket.onError((err) {
        log('Socket error: $err');
      });
    }
  }

  void disconnect() {
    _socket.disconnect();
    _socket.dispose();
    log('Socket disconnected and disposed');
  }
}
