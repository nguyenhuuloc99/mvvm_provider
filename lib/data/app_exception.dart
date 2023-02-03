class AppException implements Exception {
  final _message;
  final _prefix;

  const AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix $_message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, "Error");
}

class BadRequesException extends AppException {
  BadRequesException([String? message]) : super(message, "Error");
}

class UnAuthException extends AppException {
  UnAuthException([String? message]) : super(message, "Error");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Error");
}
