// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pr4/models/click.dart';

part 'score_state.dart';

class ScoreCubit extends Cubit<ScoreState> {
  int score = 0;
  List<Click> clicks = [];

  ScoreCubit() : super(ScoreState(score: 0, clicks: []));

  void increment(ThemeMode theme) {
    var addition = 1;
    if (theme == ThemeMode.dark) {
      addition = 2;
    }
    score += addition;
    clicks.add(Click(addition: addition, inTheme: theme));
    emit(ScoreState(score: score, clicks: clicks));
  }
}
