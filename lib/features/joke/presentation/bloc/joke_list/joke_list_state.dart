import '../../../domain/entities/joke.dart';

abstract class JokeListState {}

class JokeListInitial extends JokeListState {}

class JokeListLoading extends JokeListState {}

class JokeLoadSuccess extends JokeListState {
  final List<Joke> jokeList;

  JokeLoadSuccess(this.jokeList);
}

class JokeLoadError extends JokeListState {
  final String message;

  JokeLoadError(this.message);
}
