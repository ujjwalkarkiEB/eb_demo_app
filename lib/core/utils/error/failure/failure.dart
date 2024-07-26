import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? failureMsg;

  const Failure({this.failureMsg});

  @override
  List<Object?> get props => [failureMsg];
}

class ServerFailure extends Failure {
  final String? errorData;

  const ServerFailure(String message, {this.errorData})
      : super(failureMsg: message);

  @override
  List<Object?> get props => [failureMsg, errorData];
}

class LocalStorageFailure extends Failure {
  const LocalStorageFailure(String message) : super(failureMsg: message);
}

class UnknownFailure extends Failure {
  const UnknownFailure(String message) : super(failureMsg: message);
}
