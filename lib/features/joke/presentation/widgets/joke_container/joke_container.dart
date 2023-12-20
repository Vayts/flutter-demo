import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/joke/joke_bloc.dart';

class JokeContainer extends StatelessWidget {
  const JokeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JokeBloc, JokeState>(
      builder: (context, state) {
        Widget content;

        if (state is JokeLoading) {
          content = const CircularProgressIndicator();
        } else if (state is JokeSuccess) {
          content = Text(
            state.joke.text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          );
        } else if (state is JokeError) {
          content = Text(state.message);
        } else {
          content = const Text('Немає доступного жарту');
        }

        return SizedBox(
          width: 400.0,
          height: 400.0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: content,
              ),
            ),
          ),
        );
      },
    );
  }
}
