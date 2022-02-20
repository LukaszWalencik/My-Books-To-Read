part of 'login_cubit.dart';

class LoginState {
  const LoginState(
      {this.status = Status.initial,
      this.creatingAccount = false,
      this.errorMessage = ''});

  final Status status;
  final bool creatingAccount;
  final String errorMessage;
}
