import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_books_to_read/app/features/bottomnavigationbar/account/cubit/account_cubit.dart';
import 'package:my_books_to_read/app/features/login_page/login_page.dart';
import 'package:provider/src/provider.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String? email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountCubit(),
      child: BlocBuilder<AccountCubit, AccountState>(
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('You are login as: $email '),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AccountCubit>().signOut();
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Logout',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.purple),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// class LogOutButton extends StatelessWidget {
//   const LogOutButton({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         FirebaseAuth.instance.signOut();
//         Navigator.of(context).pop();
//         // context.read<AccountCubit>().logOut();
//       },
//       child: Text(
//         'Logout',
//         style: TextStyle(color: Colors.amber),
//       ),
//       style: ElevatedButton.styleFrom(primary: Colors.grey[700]),
//     );
//   }
// }
