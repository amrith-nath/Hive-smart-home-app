class AppExceptions implements Exception {
  final dynamic _message;
  final dynamic _prefix;

  AppExceptions([this._message, this._prefix]);

  @override
  String toString() {
    return '$_message : $_prefix';
  }
}

class NoInternetException extends AppExceptions {
  NoInternetException([String? message])
      : super(message, "No Internet Connection");
}

class UnauthorizedException extends AppExceptions {
  UnauthorizedException([String? message])
      : super(message, "You dont have access to this");
}

class RequestTimeOutException extends AppExceptions {
  RequestTimeOutException([String? message])
      : super(message, "request Time out");
}

class EmailAlreadyInUseException extends AppExceptions {
  EmailAlreadyInUseException([String? message])
      : super(message, "Email Already in use");
}

class WeakPasswordException extends AppExceptions {
  WeakPasswordException([String? message]) : super(message, "Weak password");
}
