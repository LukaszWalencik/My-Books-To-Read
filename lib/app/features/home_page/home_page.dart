import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_books_to_read/app/features/bottomnavigationbar/account/account.dart';

import 'package:my_books_to_read/app/features/bottomnavigationbar/booklist/booklist_content.dart';

import 'package:my_books_to_read/app/features/bottomnavigationbar/myfavorites/myfavorites_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         Navigator.of(context).push(
        //           MaterialPageRoute(
        //             builder: (_) => AccountPage(email: widget.user.email),
        //           ),
        //         );
        //       },
        //       icon: const Icon(Icons.person))
        // ],
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: const Text(
          'My Books to Read',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Builder(
        builder: (context) {
          if (currentIndex == 0) {
            return BookList();
          }
          if (currentIndex == 1) {
            return MyFavorites(email: widget.user.email, user: widget.user);
          }

          return AccountPage(email: widget.user.email, user: widget.user);

          // return AccountPage(
          //   email: widget.user.email,
          // );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        backgroundColor: Colors.purple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Books'),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), label: 'Favorite books'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
  }
}
