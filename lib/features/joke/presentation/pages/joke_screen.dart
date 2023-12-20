import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_joke/core/utils/color_maker/color_maker.dart';
import 'package:flutter_demo_joke/features/joke/presentation/bloc/joke/joke_bloc.dart';
import 'package:flutter_demo_joke/features/joke/presentation/widgets/joke_container/joke_container.dart';
import '../../../../core/widgets/header/header.dart';
import '../../../../injection_container.dart';
import '../widgets/joke_controls/joke_controls.dart';

class JokeScreen extends StatelessWidget {
  const JokeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<JokeBloc>()..add(LoadJoke()),
      child: Scaffold(
        backgroundColor: colorMaker('#F5F5F7'),
        appBar: const Header(
          route: '/list',
          icon: Icons.favorite,
        ),
        body: Container(
          margin: const EdgeInsets.all(20.0),
          child: const Center(
            child: SizedBox(
              height: 600,
              width: 400,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  JokeContainer(),
                  SizedBox(height: 20),
                  JokeControls(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
