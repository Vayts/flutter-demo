import 'package:flutter_demo_joke/features/joke/data/sources/remote/joke_source.dart';
import 'package:flutter_demo_joke/features/joke/domain/entities/joke.dart';
import 'package:flutter_demo_joke/features/joke/domain/repositories/joke_repository.dart';

class JokeRepositoryImpl implements JokeRepository {
  final JokeRemoteDataSource remoteDataSource;

  JokeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Joke> getJoke() async {
    final jokeModel = await remoteDataSource.getJoke();

    return Joke.fromModel(jokeModel);
  }

  @override
  Future<List<Joke>> getFavoritesJoke() async {
    final models = await remoteDataSource.getFavoritesJokes();

    return models.map((model) => Joke.fromModel(model)).toList();
  }

  @override
  Future<void> likeJoke(String jokeText) async {
    await remoteDataSource.likeJoke(jokeText);
  }
}