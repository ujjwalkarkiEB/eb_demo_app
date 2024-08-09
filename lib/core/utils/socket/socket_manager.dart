import 'dart:developer';

import 'package:socket_io_client/socket_io_client.dart' as client;
import 'package:socket_io_client/socket_io_client.dart';

class SocketClientManager {
  late client.Socket _socket;

  // Initialize the Socket.IO connection
  void initializeSocket(String uri) {
    final url = Uri.parse(uri);
    _socket = client.io(
        url.toString(),
        OptionBuilder()
            .setTransports(['websocket'])
            .enableAutoConnect()
            .setExtraHeaders({
              'authorization':
                  "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MjMxNzc3OTQsImlzQWNjZXNzIjp0cnVlLCJkYXRhIjp7ImlkIjoiNjZhY2E4YzhkOWIzNjQ5ZDJkNGI3ZGUwIiwidXNlck5hbWUiOiJkb2xseWNoYWkxMjMiLCJlbWFpbCI6ImRvbGx5QGdtYWlsLmNvbSJ9LCJpYXQiOjE3MjMxNzU3OTR9.1DxnkjKr7cn63-MaWAV_-UZdTFneQ8oQAZzgjiA993U"
            })
            .build());

    _socket.connect();

    _socket.onConnect((_) {
      log('Socket Connection established');
    });

    _socket.onDisconnect((_) {
      log('Socket Connection disconnected');
    });

    _socket.onConnectError((err) {
      log('Connection error: $err');
    });

    _socket.onError((err) {
      print('Socket error: $err');
    });
  }

  // Send a message to the server
  void sendMessage(String event, Map<String, dynamic> data) {
    _socket.emit(event, data);
    print('Message sent: $data');
  }

  // Listen for messages from the server
  void onMessage(String event, void Function(dynamic) callback) {
    _socket.on(event, callback);
  }

  // Disconnect the socket
  void disconnect() {
    _socket.disconnect();
    _socket.dispose();
    print('Socket disconnected and disposed');
  }
}
