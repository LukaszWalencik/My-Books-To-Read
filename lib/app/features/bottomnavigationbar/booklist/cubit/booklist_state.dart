part of 'booklist_cubit.dart';

@immutable
class BooklistState {
  const BooklistState({
    this.model,
    this.saved = false,
    this.status = Status.initial,
    this.errorMessage,
  });
  final String? model;
  final bool saved;
  final Status status;
  final String? errorMessage;
}
