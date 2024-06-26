// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dw9delivery/app/core/exceptions/repository_exception.dart';
import 'package:dw9delivery/app/core/exceptions/unauthorized_exception.dart';
import 'package:dw9delivery/app/dto/auth_model.dart';

import '../../core/rest_client/custom_dio.dart';
import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustomDio dio;
  AuthRepositoryImpl({
    required this.dio,
  });
  @override
  Future<AuthModel> login(String email, String password) async {
    try {
      final result = await dio.unauth().post('/auth', data: {
        'email': email,
        'password': password,
      });
      return AuthModel.fromMap(result.data);
    } on DioException catch (e, s) {
      if (e.response?.statusCode == 403) {
        log('Permissão negada', error: e, stackTrace: s);
        throw UnauthorizedException();
      }
      log('Error ao realizar login', error: e, stackTrace: s);
      throw RepositoryException(message: 'Error ao realizar login');
    }
  }

  @override
  Future<void> register(String name, String email, String password) async {
    try {
      await dio.unauth().post('/users', data: {
        'name': name,
        'email': email,
        'password': password,
      });
    } on DioException catch (e, s) {
      log('Error ao registrar usuário', error: e, stackTrace: s);
      throw RepositoryException(message: 'Error ao registrar usuário');
    }
  }
}
