import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/color_maker/color_maker.dart';
import '../../bloc/joke/joke_bloc.dart';

class JokeControls extends StatefulWidget {
  const JokeControls({Key? key}) : super(key: key);

  @override
  _JokeControlsState createState() => _JokeControlsState();
}

class _JokeControlsState extends State<JokeControls> {
  bool isDisabled = false;

  void _loadJoke(BuildContext context) {
    if (!isDisabled) {
      context.read<JokeBloc>().add(LoadJoke());
      setState(() {
        isDisabled = true;
      });

      Timer(const Duration(seconds: 10), () {
        if (mounted) {
          setState(() {
            isDisabled = false;
          });
        }
      });
    }
  }

  void _likeJoke(BuildContext context, state) {
    if (!isDisabled && state is JokeSuccess) {
      context.read<JokeBloc>().add(LikeJokeEvent(state.joke.text));
      setState(() {
        isDisabled = true;
      });

      Timer(const Duration(seconds: 10), () {
        if (mounted) {
          setState(() {
            isDisabled = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JokeBloc, JokeState>(builder: (context, state) {
      var buttonText = state is JokeLoading ? 'Почекайте' : 'Наступний жарт';

      return Row(
        children: [
          Expanded(
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: isDisabled ? Colors.grey : Colors.blue,
              ),
              onPressed: () {
                _loadJoke(context);
              },
              child: Text(
                buttonText,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          IconButton(
            icon: Icon(
              Icons.thumb_up,
              color: isDisabled || state is! JokeSuccess ? Colors.grey : colorMaker('#65B741'),),
            onPressed: () {
              _likeJoke(context, state);
            },
          ),
        ],
      );
    });
  }
}
