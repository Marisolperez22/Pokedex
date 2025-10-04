abstract class AppException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  const AppException(this.message, [this.stackTrace]);
}

class NetworkException extends AppException {
  const NetworkException(super.message, [super.stackTrace]);
}

class CacheException extends AppException {
  const CacheException(super.message, [super.stackTrace]);
}

class MappingException extends AppException {
  const MappingException(super.message, [super.stackTrace]);
}