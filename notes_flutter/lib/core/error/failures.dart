class Failures {
  final String message;

  Failures(this.message);
}

class ServerException extends Failures {
  ServerException(super.message);
}


