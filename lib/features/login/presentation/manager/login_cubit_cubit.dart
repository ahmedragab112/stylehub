
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stylehub/core/utils/entity/singup_entitey.dart';
import 'package:stylehub/features/login/data/model/login_data.dart';
import 'package:stylehub/features/login/domain/usecases/login_usecase.dart';

part 'login_cubit_state.dart';
part 'login_cubit_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  var formKey = GlobalKey<FormState>();
  final LoginUseCase loginUseCase;
  bool isobscureText = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginCubit({required this.loginUseCase}) : super(const LoginState.initial());

  Future<void> login() async {
    emit(const LoginState.loading());
    var data = await loginUseCase.login(
        loginData: LoginData(
            email: emailController.text.trim(),
            password: passwordController.text.trim()));
    data.when(
        data: (userEntity) =>
            emit((LoginState.success(userEntity: userEntity))),
        error: (error) {
          emit(LoginState.fail(message: error.apiErrorModel.message!));
        });
  }

  void changeObscureText() {
    emit(const LoginState.loading());
    isobscureText = !isobscureText;
    emit(const LoginState.changeObsuerText());
  }
}
