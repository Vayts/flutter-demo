import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_demo_joke/features/joke/data/models/joke_model.dart';

abstract class JokeRemoteDataSource {
  Future<JokeModel> getJoke();
  Future<List<JokeModel>> getFavoritesJokes();
  Future<void> likeJoke(String jokeText);
}

class JokeRemoteDataSourceImpl implements JokeRemoteDataSource {
  final http.Client client;
  final FirebaseFirestore firestore;

  JokeRemoteDataSourceImpl({required this.client, required this.firestore});

  @override
  Future<JokeModel> getJoke() async {
    final response = await client.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer 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',
      },
      body: jsonEncode({
        'model': 'gpt-3.5-turbo',
        'messages': [{'role': 'user', 'content': 'Розкажи мені шутку не більше ніж 200 символів.'}],
      })
    );

    print(response.body);

    if (response.statusCode == 200) {
      var result = utf8.decode(response.body.codeUnits);
      return JokeModel.fromOpenAI(json.decode(result));
    } else {
      var decodedResponse = json.decode(response.body);

      if (decodedResponse['error'] != null &&
          decodedResponse['error']['code'] == 'rate_limit_exceeded') {
        throw Exception('Rate limit error');
      }

      throw Exception('Failed to load joke');
    }
  }

  @override
  Future<List<JokeModel>> getFavoritesJokes() async {
    QuerySnapshot snapshot = await firestore.collection('jokes').get();
    return snapshot.docs
        .map((doc) => JokeModel.fromFirebaseJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> likeJoke(String jokeText) async {
    await firestore.collection('jokes').add({
      'text': jokeText,
    });
  }
}
