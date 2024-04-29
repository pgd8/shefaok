part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class RegisterSuccess extends AuthState {
  final String? successMSG;

  RegisterSuccess(this.successMSG);
}

class RegisterLoading extends AuthState {}

class RegisterFailure extends AuthState {
  String? errorMsg;

  RegisterFailure({required errorMsg});
}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginFailure extends AuthState {
  String? errorMsg;

  LoginFailure({required errorMsg});
}
