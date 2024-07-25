import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? failureMsg;

  const Failure({this.failureMsg});
  @override
  List<Object?> get props => [failureMsg];
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(failureMsg: message);
}

class UnAuthenticatedFailure extends Failure {
  const UnAuthenticatedFailure(String message) : super(failureMsg: message);
}

class LocalStorageFailure extends Failure {}
