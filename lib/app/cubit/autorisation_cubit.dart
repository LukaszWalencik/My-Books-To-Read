import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'autorisation_state.dart';

class AuthorisationCubit extends Cubit<AuthorisationState> {
  AuthorisationCubit()
      : super(const AuthorisationState(
          user: null,
          isLoading: false,
          errorMessage: '',
        ));

  StreamSubscription? _streamSubscription;

  Future<void> userChecker() async {
    emit(
      const AuthorisationState(
        user: null,
        isLoading: true,
        errorMessage: '',
      ),
    );

    _streamSubscription =
        FirebaseAuth.instance.authStateChanges().listen((user) {
      emit(
        AuthorisationState(
          user: user,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
          ..onError((error) {
            const AuthorisationState(
              user: null,
              isLoading: false,
              errorMessage: 'error',
            );
          });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
