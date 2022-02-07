import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'myfavorites_state.dart';

class MyfavoritesCubit extends Cubit<MyfavoritesState> {
  MyfavoritesCubit()
      : super(MyfavoritesState(
          documents: [],
          errorMessage: '',
          isLoading: false,
        ));
  StreamSubscription? _streamSubscription;
  Future<void> start() async {
    emit(
      MyfavoritesState(documents: [], isLoading: true, errorMessage: ''),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('books')
        .snapshots()
        .listen((documents) {
      emit(MyfavoritesState(
          documents: documents.docs, isLoading: false, errorMessage: ''));
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

    Future<void> close() {
      _streamSubscription?.cancel();
      return super.close();
    }

    ;
  }
}
