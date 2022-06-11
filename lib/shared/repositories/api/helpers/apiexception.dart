class ApiException implements Exception {
  final String? message;
  final int? code;

  ApiException([this.code, this.message]);

  @override
  String toString() {
    return "$message";
  }
}

class FetchDataException extends ApiException {
  FetchDataException([int? code, String? message]) : super(code, message);
}

class BadRequestException extends ApiException {
  BadRequestException([int? code, String? message]) : super(code, message);
}

class UnauthorisedException extends ApiException {
  UnauthorisedException([int? code, String? message]) : super(code, message);
}

class InvalidInputException extends ApiException {
  InvalidInputException([int? code, String? message]) : super(code, message);
}

class TimeoutException extends ApiException {
  TimeoutException([int? code, String? message]) : super(code, message);
}
