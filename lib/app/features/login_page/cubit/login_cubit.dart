import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_books_to_read/app/core/enums.dart';

import 'package:my_books_to_read/repositories/account_repositories.dart';
part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._accountRepository)
      : super(const LoginState(status: Status.initial));

  final AccountRepository _accountRepository;

  void createAccount(bool creatingAccount) {
    switch (creatingAccount) {
      case false:
        emit(
          const LoginState(creatingAccount: true),
        );
        break;
      case true:
        emit(
          const LoginState(creatingAccount: false),
        );
        break;
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      await _accountRepository.signUp(email, password);
      emit(const LoginState(status: Status.loading));
    } catch (error) {
      emit(LoginState(status: Status.error, errorMessage: error.toString()));
    }
  }

  Future<void> singIn(String email, String password) async {
    try {
      await _accountRepository.signIn(email, password);
      emit(const LoginState(status: Status.loading));
    } catch (error) {
      emit(LoginState(status: Status.error, errorMessage: error.toString()));
    }
  }
}
