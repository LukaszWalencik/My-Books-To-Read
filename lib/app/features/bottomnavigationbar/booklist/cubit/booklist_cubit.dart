import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_books_to_read/app/core/enums.dart';
import 'package:my_books_to_read/models/item_models.dart';
import 'package:my_books_to_read/repositories/item_repositories.dart';

part 'booklist_state.dart';

class BooklistCubit extends Cubit<BooklistState> {
  BooklistCubit(this._booksRepository) : super(const BooklistState());

  final BooksRepository _booksRepository;

  Future<void> getBooksModel({
    required String name,
  }) async {
    emit(const BooklistState(status: Status.loading));
    try {
      final booksModel = await _booksRepository.getBooksModel(bookName: name);
      emit(
        BooklistState(
          model: booksModel,
          status: Status.success,
        ),
      );
    } catch (error) {
      emit(
        BooklistState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
