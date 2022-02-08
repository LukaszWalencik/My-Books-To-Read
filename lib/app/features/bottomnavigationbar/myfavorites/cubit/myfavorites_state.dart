part of 'myfavorites_cubit.dart';

@immutable
class MyfavoritesState {
  MyfavoritesState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });

  final List<ItemModels> documents;
  final bool isLoading;
  final String errorMessage;
}
