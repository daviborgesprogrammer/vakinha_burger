import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dw9delivery/app/pages/auth/register/register_state.dart';
import 'package:dw9delivery/app/repositories/auth/auth_repository.dart';

class RegisterController extends Cubit<RegisterState> {
  final AuthRepository _authRepository;
  RegisterController(this._authRepository)
      : super(const RegisterState.initial());

  Future<void> register(String name, String email, String password) async {
    try {
      emit(state.copyWith(status: RegisterStatus.register));
      await _authRepository.register(name, email, password);
      emit(state.copyWith(status: RegisterStatus.success));
    } on Exception catch (e, s) {
      log('Erro ao registra usuário', error: e, stackTrace: s);
      emit(state.copyWith(status: RegisterStatus.error));
    }
  }
}
