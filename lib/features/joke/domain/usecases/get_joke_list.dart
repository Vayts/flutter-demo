import 'package:flutter_demo_joke/features/joke/domain/repositories/joke_repository.dart';

import '../entities/joke.dart';

class GetFavoritesJokes {
  final JokeRepository repository;

  GetFavoritesJokes(this.repository);

  Future<List<Joke>> call() async {
    return await repository.getFavoritesJoke();
  }
}