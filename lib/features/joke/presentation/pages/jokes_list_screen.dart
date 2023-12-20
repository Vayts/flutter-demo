import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_joke/features/joke/domain/entities/joke.dart';
import 'package:flutter_demo_joke/features/joke/presentation/bloc/joke_list/joke_list_bloc.dart';
import 'package:flutter_demo_joke/features/joke/presentation/bloc/joke_list/joke_list_bloc.dart';
import 'package:flutter_demo_joke/features/joke/presentation/bloc/joke_list/joke_list_bloc.dart';
import 'package:flutter_demo_joke/features/joke/presentation/bloc/joke_list/joke_list_event.dart';
import 'package:flutter_demo_joke/features/joke/presentation/bloc/joke_list/joke_list_state.dart';

import '../../../../core/utils/color_maker/color_maker.dart';
import '../../../../core/widgets/header/header.dart';
import '../../../../injection_container.dart';
import '../widgets/joke_list/joke_list.dart';

class JokeListScreen extends StatelessWidget {
  const JokeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<JokeListBloc>(
      create: (_) => sl<JokeListBloc>()..add(LoadJokeList()),
      child: Scaffold(
        backgroundColor: colorMaker('#F5F5F7'),
        appBar: const Header(
          route: '/',
          icon: Icons.home,
        ),
        body: BlocBuilder<JokeListBloc, JokeListState>(
          builder: (context, state) {
            if (state is JokeListLoading) {

              return const Center(child: CircularProgressIndicator());
            } else if (state is JokeLoadSuccess) {
              return JokeListElem(jokes: state.jokeList);
            } else if (state is JokeLoadError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return const Center(child: Text('No tables data'));
          },
        ),
      ),
    );
  }
}