import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_books_to_read/app/core/enums.dart';
import 'package:my_books_to_read/models/book_models.dart';
import 'package:my_books_to_read/models/item_models.dart';
import 'package:my_books_to_read/repositories/book_repositories.dart';
import 'package:my_books_to_read/repositories/item_repositories.dart';

part 'booklist_state.dart';

class BooklistCubit extends Cubit<BooklistState> {
  BooklistCubit(this._booksRepository, this._itemRepository)
      : super(const BooklistState());

  final BooksRepository _booksRepository;
  final ItemRepository _itemRepository;

  Future<void> getBooksModel({
    required String name,
  }) async {
    emit(const BooklistState(status: Status.loading));
    try {
      final booksModel = await _booksRepository.getBooksModel();
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

  Future<void> add(
    String name,
    String author,
  ) async {
    try {
      await _itemRepository.add;
      emit(const BooklistState(saved: true));
    } catch (error) {
      emit(BooklistState(errorMessage: error.toString()));
    }
  }
}
