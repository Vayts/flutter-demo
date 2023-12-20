import 'package:flutter_demo_joke/features/joke/domain/repositories/joke_repository.dart';

class LikeJoke {
  final JokeRepository repository;

  LikeJoke(this.repository);

  Future<void> call(String jokeText) async {
    await repository.likeJoke(jokeText);
  }
}