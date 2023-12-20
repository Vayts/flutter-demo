import '../../data/models/joke_model.dart';

class Joke {
  final String text;

  Joke({required this.text});

  factory Joke.fromModel(JokeModel model) {
    return Joke(
      text: model.text,
    );
  }
}