import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_books_to_read/app/core/enums.dart';
import 'package:my_books_to_read/app/data/remote_data_sources/books_remote_data_source.dart';
import 'package:my_books_to_read/app/features/bottomnavigationbar/booklist/cubit/booklist_cubit.dart';
import 'package:my_books_to_read/models/book_model.dart';

import 'package:my_books_to_read/repositories/book_repositories.dart';
import 'package:my_books_to_read/repositories/item_repositories.dart';

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
      create: (context) => BooklistCubit(
          BooksRepository(BooksRemoteDataSource()), ItemRepository()),
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
            // return Builder(builder: (context) {
            //   if (booksModel == null) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.black38,
                            hintText: 'Write name of the book',
                            hintStyle: TextStyle(fontSize: 15),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
                            ),
                          ),
                          controller: searchcontroller,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          context
                              .read<BooklistCubit>()
                              .getBooksModel(name: searchcontroller.text);
                        },
                        icon: const Icon(Icons.search),
                        label: const Text('Search'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                          fixedSize: const Size(120, 48),
                        ),
                      )
                    ],
                  ),
                  Builder(builder: (context) {
                    final booksModel = state.model;
                    if (booksModel == null) {
                      const Text('Wartość null');
                    }
                    if (state.status == Status.loading) {
                      return const Text('Loading');
                    }
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Container(
                            color: Colors.black38,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(searchcontroller.text),
                                        ],
                                      ),
                                    ),
                                    FavoriteButton(
                                      iconDisabledColor: Colors.black,
                                      isFavorite: true,
                                      valueChanged: () {
                                        context.read<BooklistCubit>().add(
                                            searchcontroller.text,
                                            searchcontroller.text);
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.star,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        context.read<BooklistCubit>().add(
                                            searchcontroller.text,
                                            searchcontroller.text);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.black38,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text('example'),
                                      ],
                                    ),
                                  ),
                                  FavoriteButton(
                                    iconDisabledColor: Colors.black,
                                    isFavorite: true,
                                    valueChanged: () {
                                      context.read<BooklistCubit>().add(
                                          searchcontroller.text,
                                          searchcontroller.text);
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.star,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  })
                ],
              ),
            );
            //   }
            //   if (state.status == Status.loading) {
            //     return const Text('Loading');
            //   }
            //   return Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Column(
            //       children: [
            //         Text('gg')
            //         // SearchLine(),
            //         // Padding(
            //         //   padding: const EdgeInsets.all(8.0),
            //         //   child: Row(
            //         //     children: [
            //         //       Column(
            //         //         children: [Text('booksModel.bookName')],
            //         //       ),
            //         //       IconButton(
            //         //           onPressed: () {}, icon: const Icon(Icons.star))
            //         //     ],
            //         //   ),
            //         // )
            //         // BooksList(
            //         //   booksModel: booksModel,
            //         // )
            //       ],
            //     ),
            //   );
            // });
          },
        ),
      ),
    );
  }
}

// class SearchLine extends StatelessWidget {
//   SearchLine({
//     Key? key,
//   }) : super(key: key);

//   final _searchcontroller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         TextField(
//           decoration: const InputDecoration(
//             filled: true,
//             fillColor: Colors.black38,
//             hintText: 'Write name of the book',
//             hintStyle: TextStyle(fontSize: 15),
//             focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.white, width: 2.0),
//             ),
//           ),
//           controller: _searchcontroller,
//         ),
//         const SizedBox(
//           width: 5,
//         ),
        // ElevatedButton.icon(
        //   onPressed: () {
        //     context
        //         .read<BooklistCubit>()
        //         .getBooksModel(name: _searchcontroller.text);
        //   },
        //   icon: const Icon(Icons.search),
        //   label: const Text('Search'),
        //   style: ElevatedButton.styleFrom(
        //     primary: Colors.purple,
        //     fixedSize: const Size(120, 48),
        //   ),
        // )
//       ],
//     );
//   }
// }

// class BooksList extends StatelessWidget {
//   const BooksList({
//     required this.booksModel,
//     Key? key,
//   }) : super(key: key);

//   final BooksModel booksModel;

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<BooklistCubit, BooklistState>(builder: (context, state) {
//       final booksModel = state.model;
//       return Builder(
//         builder: (context) {
//           if (booksModel == null) {
//             return const SizedBox.shrink();
//           }
//           if (state.status == Status.loading) {
//             return const Text('Loading');
//           }

//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               color: Colors.black26,
//               child: Row(
//                 children: [
//                   Column(
//                     children: [Text(booksModel.bookName)],
//                   ),
//                   IconButton(onPressed: () {}, icon: const Icon(Icons.star))
//                 ],
//               ),
//             ),
//           );
//         },
//       );
//     });
//   }
// }
