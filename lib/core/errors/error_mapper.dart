import 'package:dio/dio.dart';

import '../exceptions/exceptions.dart';
import 'failure.dart';

Failure mapExceptionToFailure(Object error) {
  if (error is DioException) {
    return _handleDioException(error);
  } else if (error is FormatException) {
    return const CacheFailure('Error al formatear datos');
  } else {
    return UnknownFailure(error.toString());
  }
}

Failure _handleDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.sendTimeout:
      return const NetworkFailure('Tiempo de espera agotado');
    case DioExceptionType.connectionError:
      return const NetworkFailure('Sin conexión a Internet');
    case DioExceptionType.badResponse:
      final statusCode = e.response?.statusCode ?? 0;
      final message = e.response?.statusMessage ?? 'Error en la respuesta';
      return ServerFailure(message, code: statusCode);
    case DioExceptionType.badCertificate:
      return const ServerFailure('Certificado inválido');
    case DioExceptionType.cancel:
      return const ServerFailure('Solicitud cancelada');
    default:
      return ServerFailure(e.message ?? 'Error del servidor');
  }
}
