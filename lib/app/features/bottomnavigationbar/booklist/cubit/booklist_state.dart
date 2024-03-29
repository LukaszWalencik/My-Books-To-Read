part of 'booklist_cubit.dart';

class BooklistState {
  BooklistState({
    this.model,
    this.saved = false,
    this.status = Status.initial,
    this.errorMessage,
  });
  final BookModel? model;
  final bool saved;
  final Status status;
  final String? errorMessage;
}
