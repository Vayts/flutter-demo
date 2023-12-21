import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_demo_joke/features/joke/domain/usecases/get_joke_list.dart';
import 'joke_list_event.dart';
import 'joke_list_state.dart';


class JokeListBloc extends Bloc<JokeListEvent, JokeListState> {
  final GetFavoritesJokes getFavoritesJokes;

  JokeListBloc({required this.getFavoritesJokes}) : super(JokeListInitial()) {
    on<LoadJokeList>(_onLoadJoke);
  }

  Future<void> _onLoadJoke(LoadJokeList event, Emitter<JokeListState> emit) async {
    emit(JokeListLoading());
    try {
      final joke = await getFavoritesJokes();
      emit(JokeLoadSuccess(joke));
    } catch (error) {
      print(error);
      emit(JokeLoadError('Помилка'));
    }
  }
}
