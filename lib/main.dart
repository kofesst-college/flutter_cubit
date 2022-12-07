import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pr4/cubit/score_cubit.dart';
import 'package:pr4/cubit/theme_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => ScoreCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
              themeMode: state.getTheme(),
              title: 'PR4',
              theme: ThemeData(primarySwatch: Colors.blue),
              darkTheme: ThemeData(
                  primarySwatch: Colors.blue,
                  colorScheme: const ColorScheme.dark()),
              home: Scaffold(
                appBar: AppBar(
                  title: const Text('PR4'),
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Score'),
                      BlocBuilder<ScoreCubit, ScoreState>(
                        builder: (context, state) => Text('${state.score}')
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              child: const Text('+'),
                              onPressed: () {
                                context
                                    .read<ScoreCubit>()
                                    .increment(state.getTheme(), 1);
                              }),
                          const SizedBox(width: 50.0),
                          ElevatedButton(
                              child: const Text('-'),
                              onPressed: () {
                                context
                                    .read<ScoreCubit>()
                                    .increment(state.getTheme(), -1);
                              }),
                        ],
                      ),
                      BlocBuilder<ScoreCubit, ScoreState>(
                        builder: (context, state) {
                          return SizedBox(
                            height: 250.0,
                            child: ListView.builder(
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(8.0),
                              itemCount: state.clicks.length,
                              itemBuilder: (context, index) {
                                var click = state.clicks[index];
                                return Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        '${click.addition} in ${click.inTheme}'),
                                  )
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    context.read<ThemeCubit>().toggleTheme();
                  },
                  tooltip: 'Toggle theme',
                  child: const Icon(Icons.sunny),
                ),
              ));
        },
      ),
    );
  }
}
