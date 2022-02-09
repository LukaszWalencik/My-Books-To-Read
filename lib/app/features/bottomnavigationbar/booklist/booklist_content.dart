import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_books_to_read/app/core/enums.dart';
import 'package:my_books_to_read/app/data/remote_data_sources/books_remote_data_source.dart';
import 'package:my_books_to_read/app/features/bottomnavigationbar/booklist/cubit/booklist_cubit.dart';
import 'package:my_books_to_read/models/item_models.dart';
import 'package:my_books_to_read/repositories/item_repositories.dart';

class BookList extends StatelessWidget {
  const BookList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BooklistCubit(BooksRepository(BooksRemoteDataSource())),
      child: BlocListener<BooklistCubit, BooklistState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            final errorMessage = state.errorMessage ?? 'Unkown error';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder<BooklistCubit, BooklistState>(
          builder: (context, state) {
            final booksModel = state.model;
            return Builder(builder: (context) {
              if (state.status == Status.loading) {
                return const Text('Loading');
              }

              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SearchLine(),
                  ),
                  BooksList(
                    booksModel: booksModel,
                  )
                ],
              );
            });
          },
        ),
      ),
    );
  }
}

class SearchLine extends StatelessWidget {
  SearchLine({
    Key? key,
  }) : super(key: key);

  final _searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.black38,
              hintText: 'Write name of the book',
              hintStyle: TextStyle(fontSize: 15),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
              ),
            ),
            controller: _searchcontroller,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        ElevatedButton.icon(
          onPressed: () {
            context
                .read<BooklistCubit>()
                .getBooksModel(name: _searchcontroller.text);
          },
          icon: const Icon(Icons.search),
          label: const Text('Search'),
          style: ElevatedButton.styleFrom(
            primary: Colors.purple,
            fixedSize: const Size(120, 48),
          ),
        )
      ],
    );
  }
}

class BooksList extends StatelessWidget {
  const BooksList({
    required this.booksModel,
    Key? key,
  }) : super(key: key);

  final BooksModel booksModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooklistCubit, BooklistState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.black26,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [Text(booksModel.bookName)],
                  ),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.star))
              ],
            ),
          ),
        );
      },
    );
  }
}
