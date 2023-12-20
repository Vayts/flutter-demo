part of 'joke_bloc.dart';

@immutable
abstract class JokeState {}

class JokeInitial extends JokeState {}

class JokeLoading extends JokeState {}

class JokeSuccess extends JokeState {
  final Joke joke;

  JokeSuccess(this.joke);
}

class JokeError extends JokeState {
  final String message;

  JokeError(this.message);
}
