abstract class Failure {
  final String failureMsg;

  Failure({required this.failureMsg});
}

class ServerFailure extends Failure {
  ServerFailure({required super.failureMsg});
}

class LocalStorageFailure extends Failure {
  LocalStorageFailure({required super.failureMsg});
}
