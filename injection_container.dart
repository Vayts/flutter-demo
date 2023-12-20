import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_demo_joke/features/joke/data/repositories/joke_repository_impl.dart';
import 'package:flutter_demo_joke/features/joke/data/sources/remote/joke_source.dart';
import 'package:flutter_demo_joke/features/joke/domain/repositories/joke_repository.dart';
import 'package:flutter_demo_joke/features/joke/domain/usecases/get_joke.dart';
import 'package:flutter_demo_joke/features/joke/domain/usecases/get_joke_list.dart';
import 'package:flutter_demo_joke/features/joke/domain/usecases/like_joke.dart';
import 'package:flutter_demo_joke/features/joke/presentation/bloc/joke/joke_bloc.dart';
import 'package:flutter_demo_joke/features/joke/presentation/bloc/joke_list/joke_list_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final GetIt sl = GetIt.instance;

void init() {
  // http
  sl.registerLazySingleton(() => http.Client());

  // firebase
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  // Data Sources
  sl.registerLazySingleton<JokeRemoteDataSource>(() => JokeRemoteDataSourceImpl(client: sl<http.Client>(), firestore: sl<FirebaseFirestore>()));

  // Repositories
  sl.registerLazySingleton<JokeRepository>(() => JokeRepositoryImpl(remoteDataSource: sl()));

  // Use Cases
  sl.registerLazySingleton(() => GetJoke(sl()));
  sl.registerLazySingleton(() => LikeJoke(sl()));

  sl.registerLazySingleton(() => GetFavoritesJokes(sl()));

  // Bloc
  sl.registerFactory(() => JokeBloc(
    getJoke: sl(),
    likeJoke: sl(),
  ));

  sl.registerFactory(() => JokeListBloc(
    getFavoritesJokes: sl()
  ));
}