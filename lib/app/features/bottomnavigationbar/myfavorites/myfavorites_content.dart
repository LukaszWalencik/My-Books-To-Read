import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_books_to_read/app/features/bottomnavigationbar/account/accountpage_content.dart';

class MyFavorites extends StatelessWidget {
  const MyFavorites({required this.email, required this.user, Key? key})
      : super(key: key);
  final String? email;
  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
