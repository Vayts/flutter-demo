import '../entities/joke.dart';

abstract class JokeRepository {
  Future<Joke> getJoke();
  Future<List<Joke>> getFavoritesJoke();
  Future<void> likeJoke(String jokeText);
}