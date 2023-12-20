part of 'joke_bloc.dart';

abstract class JokeEvent {}

class LoadJoke extends JokeEvent {}

class LikeJokeEvent extends JokeEvent {
  final String jokeText;

  LikeJokeEvent(this.jokeText);
}

