import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_books_to_read/app/features/bottomnavigationbar/myfavorites/cubit/myfavorites_cubit.dart';
import 'package:my_books_to_read/models/item_models.dart';
import 'package:my_books_to_read/repositories/item_repositories.dart';

class MyFavorites extends StatelessWidget {
  const MyFavorites({required this.email, required this.user, Key? key})
      : super(key: key);
  final String? email;
  final User user;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyfavoritesCubit(ItemRepository())..start(),
      child: BlocBuilder<MyfavoritesCubit, MyfavoritesState>(
        builder: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            return Text(state.errorMessage);
          }
          if (state.isLoading == true) {
            return Center(child: CircularProgressIndicator());
          }
          final itemModels = state.documents;
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(children: [
                for (final document in itemModels) ...[
                  Dismissible(
                    key: ValueKey(document.id),
                    onDismissed: (_) {
                      FirebaseFirestore.instance
                          .collection('books')
                          .doc(document.id)
                          .delete();
                    },
                    child: Container(
                      color: Colors.black26,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(document.name),
                              Text(document.author),
                              Text(document.age.toString()),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ]
              ]));
        },
      ),
    );
  }
}
