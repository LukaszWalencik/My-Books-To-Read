part of 'booklist_cubit.dart';

@immutable
class BooklistState {
  const BooklistState({
    this.model = const [],
    this.saved = false,
    this.status = Status.initial,
    this.errorMessage,
  });
  final List<BooksModel> model;
  final bool saved;
  final Status status;
  final String? errorMessage;
}
