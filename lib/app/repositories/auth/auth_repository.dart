import 'package:dw9delivery/app/dto/auth_model.dart';

abstract interface class AuthRepository {
  Future<void> register(String name, String email, String password);
  Future<AuthModel> login(String email, String password);
}
