import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_books_to_read/app/cubit/autorisation_cubit.dart';
import 'package:my_books_to_read/app/features/home_page/home_page.dart';
import 'package:my_books_to_read/app/features/login_page/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Books To Read',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthorisationPage(),
    );
  }
}

class AuthorisationPage extends StatelessWidget {
  const AuthorisationPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthorisationCubit()..userChecker(),
      child: BlocBuilder<AuthorisationCubit, AuthorisationState>(
        builder: (context, state) {
          final user = state.user;
          if (user == null) {
            return LoginPage();
          }
          return HomePage(
            user: user,
          );
        },
      ),
    );
  }
}
