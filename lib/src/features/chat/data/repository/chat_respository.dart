import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:eb_demo_app/core/utils/error/failure/failure.dart';
import 'package:eb_demo_app/core/utils/socket/socket_client_manager.dart';
import 'package:eb_demo_app/src/features/chat/data/model/chat.dart';
import 'package:eb_demo_app/src/features/chat/data/source/remote/chat_remote_source.dart';
import 'package:injectable/injectable.dart';

abstract class ChatRespository {
  Future<Either<Failure, List<Chat>>> getLastMsgWithUsers();
  Future<Either<Failure, List<Chat>>> getMessagesWithUser(
      {required String userID});
}

@LazySingleton(as: ChatRespository)
class ChatRespositoryImpl implements ChatRespository {
  final ChatRemoteSource _chatRemoteSource;

  ChatRespositoryImpl(this._chatRemoteSource);

  @override
  Future<Either<Failure, List<Chat>>> getLastMsgWithUsers() async {
    try {
      final chats = await _chatRemoteSource.getLastMsgWithUsers();
      return right(chats);
    } catch (e) {
      log('Last msg fetch error: ${e.toString()}');
      return left(const ServerFailure('Something'));
    }
  }

  @override
  Future<Either<Failure, List<Chat>>> getMessagesWithUser(
      {required String userID}) async {
    try {
      final chats = await _chatRemoteSource.getMesagesWithUser(userID: userID);
      return right(chats);
    } catch (e) {
      log('user all msg fetch error: ${e.toString()}');
      return left(const ServerFailure('Something'));
    }
  }
}
