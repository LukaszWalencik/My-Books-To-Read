import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'account_state.dart';

@injectable
class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountState());

  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
  }
}
