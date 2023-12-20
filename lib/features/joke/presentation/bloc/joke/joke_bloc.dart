import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_demo_joke/features/joke/domain/usecases/get_joke.dart';
import 'package:flutter_demo_joke/features/joke/domain/usecases/like_joke.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/joke.dart';

part 'joke_event.dart';
part 'joke_state.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  final GetJoke getJoke;
  final LikeJoke likeJoke;

  JokeBloc({required this.getJoke, required this.likeJoke}) : super(JokeInitial()) {
    on<LoadJoke>(_onLoadJoke);
    on<LikeJokeEvent>(_onLikeJoke);
  }

  Future<void> _onLoadJoke(LoadJoke event, Emitter<JokeState> emit) async {
    emit(JokeLoading());
    try {
      final joke = await getJoke();
      emit(JokeSuccess(joke));
    } catch (error) {

      if (error.toString().contains('Rate limit error')) {
        emit(JokeError('Занадто швидко! Зроби паузу'));
      } else {
        emit(JokeError('Помилка'));
      }
    }
  }

  Future<void> _onLikeJoke(LikeJokeEvent event, Emitter<JokeState> emit) async {
    emit(JokeLoading());
    try {
      await likeJoke(event.jokeText);
      final joke = await getJoke();
      emit(JokeSuccess(joke));
    } catch (error) {

      if (error.toString().contains('Rate limit error')) {
        emit(JokeError('Занадто швидко! Зроби паузу'));
      } else {
        emit(JokeError('Помилка'));
      }
    }
  }
}
