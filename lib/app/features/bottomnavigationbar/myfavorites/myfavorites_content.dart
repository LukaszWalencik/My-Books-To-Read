import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_books_to_read/app/features/bottomnavigationbar/myfavorites/cubit/myfavorites_cubit.dart';
import 'package:my_books_to_read/repositories/favorites_repositories.dart';

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
            return Column(
              children: const [
                SizedBox(
                  height: 60,
                ),
                CircularProgressIndicator(),
              ],
            );
          }
          final itemModels = state.documents;
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(children: [
                for (final document in itemModels) ...[
                  Dismissible(
                    background: Container(
                      color: Colors.red,
                    ),
                    key: ValueKey(document.id),
                    onDismissed: (_) {
                      context.read<MyfavoritesCubit>().delete(id: document.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.black26,
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      document.name,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(document.author,
                                        style: const TextStyle(
                                            fontStyle: FontStyle.italic)),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
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
