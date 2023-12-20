import 'package:flutter_demo_joke/features/joke/domain/repositories/joke_repository.dart';

import '../entities/joke.dart';

class GetJoke {
  final JokeRepository repository;

  GetJoke(this.repository);

  Future<Joke> call() async {
    return await repository.getJoke();
  }
}