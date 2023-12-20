class JokeModel {
  final String text;

  JokeModel({required this.text});

  factory JokeModel.fromOpenAI(Map<String, dynamic> json) {
    String content = json['choices'][0]['message']['content'];
    return JokeModel(
      text: content,
    );
  }

  factory JokeModel.fromFirebaseJson(Map<String, dynamic> json) {
    return JokeModel(
      text: json['text']
    );
  }
}