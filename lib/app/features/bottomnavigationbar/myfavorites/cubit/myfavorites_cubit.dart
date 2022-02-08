import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:my_books_to_read/models/item_models.dart';
import 'package:my_books_to_read/repositories/item_repositories.dart';

part 'myfavorites_state.dart';

class MyfavoritesCubit extends Cubit<MyfavoritesState> {
  MyfavoritesCubit(
    this._itemRepository,
  ) : super(MyfavoritesState(
          documents: [],
          errorMessage: '',
          isLoading: false,
        ));

  final ItemRepository _itemRepository;
  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      MyfavoritesState(documents: const [], isLoading: true, errorMessage: ''),
    );

    _streamSubscription = _itemRepository.getItemsStream().listen((documents) {
      emit(MyfavoritesState(
          documents: documents, isLoading: false, errorMessage: ''));
    })
      ..onError((error) {
        emit(
          MyfavoritesState(
            documents: [],
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      });

    ;
  }

  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }

  Future<void> delete({required String id}) async {
    await _itemRepository.remove(id: id);
    start();
  }
}
