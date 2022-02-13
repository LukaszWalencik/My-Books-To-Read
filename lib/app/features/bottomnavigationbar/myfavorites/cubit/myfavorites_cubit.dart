import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_books_to_read/models/item_models.dart';
import 'package:my_books_to_read/repositories/item_repositories.dart';

part 'myfavorites_state.dart';

class MyfavoritesCubit extends Cubit<MyfavoritesState> {
  MyfavoritesCubit(
    this._itemRepository,
  ) : super(const MyfavoritesState(
          documents: [],
          errorMessage: '',
          isLoading: false,
        ));

  final ItemRepository _itemRepository;
  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const MyfavoritesState(documents: [], isLoading: true, errorMessage: ''),
    );

    _streamSubscription = _itemRepository.getItemsStream().listen((documents) {
      emit(MyfavoritesState(
          documents: documents, isLoading: false, errorMessage: ''));
    })
      ..onError((error) {
        emit(
          MyfavoritesState(
            documents: const [],
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }

  Future<void> delete({required String id}) async {
    await _itemRepository.remove(id: id);
    start();
  }
}
