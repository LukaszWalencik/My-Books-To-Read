import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_books_to_read/app/core/enums.dart';
import 'package:my_books_to_read/app/core/injection.dart';
import 'package:my_books_to_read/app/features/bottomnavigationbar/booklist/cubit/booklist_cubit.dart';
import 'package:my_books_to_read/models/book_model.dart';

class BookList extends StatefulWidget {
  const BookList({
    Key? key,
  }) : super(key: key);

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injection<BooklistCubit>(),
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
            var searchcontroller = TextEditingController();
            final books = state.model?.docs ?? [];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SearchBar(searchcontroller: searchcontroller),
                  Builder(builder: (context) {
                    if (state.status == Status.error) {
                      return const Center(
                        child: Text('Unknown error',
                            style: TextStyle(color: Colors.red)),
                      );
                    }
                    if (state.status == Status.loading) {
                      return const CircularProgressIndicator();
                    }

                    return Expanded(
                      child: ListView.builder(
                        itemCount: books.length,
                        itemBuilder: (BuildContext context, int index) {
                          final book = books[index].authorName ?? [];
                          return BookPosition(
                              docs: books, authors: book, index: index);
                        },
                      ),
                    );
                  })
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.searchcontroller,
  }) : super(key: key);

  final TextEditingController searchcontroller;

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
            controller: searchcontroller,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        ElevatedButton.icon(
          onPressed: () {
            context
                .read<BooklistCubit>()
                .getBookModel(bookName: searchcontroller.text);
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

class BookPosition extends StatelessWidget {
  const BookPosition(
      {Key? key,
      required this.docs,
      required this.authors,
      required this.index})
      : super(key: key);

  final List<Doc> docs;
  final List<String> authors;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooklistCubit, BooklistState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Container(
            color: Colors.black38,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            docs[index].title,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            authors.isNotEmpty
                                ? authors[0]
                                : 'Author not added',
                            style: const TextStyle(fontStyle: FontStyle.italic),
                          )
                        ],
                      ),
                    ),
                    StarButton(
                      isStarred: false,
                      // iconDisabledColor: Colors.white,
                      valueChanged: (_isStarred) {
                        context.read<BooklistCubit>().add(
                              author: authors[0],
                              name: docs[index].title,
                            );
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
