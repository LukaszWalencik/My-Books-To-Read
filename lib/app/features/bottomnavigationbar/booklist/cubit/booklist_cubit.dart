import 'dart:async';

import 'package:bloc/bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_books_to_read/app/core/enums.dart';
import 'package:my_books_to_read/models/book_model.dart';
import 'package:my_books_to_read/repositories/book_repositories.dart';
import 'package:my_books_to_read/repositories/favorites_repositories.dart';
// part 'booklist_cubit.freezed.dart';
part 'booklist_state.dart';

@injectable
class BooklistCubit extends Cubit<BooklistState> {
  BooklistCubit(this.booksRepository, this._itemRepository)
      : super(BooklistState());

  final BooksRepository booksRepository;
  final ItemRepository _itemRepository;

  Future<void> getBookModel({
    required String bookName,
  }) async {
    emit(
      BooklistState(status: Status.loading),
    );
    try {
      final bookModel = await booksRepository.getBookModel(bookName: bookName);
      emit(
        BooklistState(
          model: bookModel,
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

  Future<void> add({required String name, required String author}) async {
    try {
      await _itemRepository.add(name, author);
    } catch (error) {
      emit(BooklistState(errorMessage: error.toString()));
    }
  }
}
