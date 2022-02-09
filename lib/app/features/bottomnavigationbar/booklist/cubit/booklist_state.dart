part of 'booklist_cubit.dart';

@immutable
class BooklistState {
  const BooklistState({
    this.model,
    this.status = Status.initial,
    this.errorMessage,
  });
  final BooksModel? model;
  final Status status;
  final String? errorMessage;
}
