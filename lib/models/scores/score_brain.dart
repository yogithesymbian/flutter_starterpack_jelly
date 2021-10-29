import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_starterpack_jelly/models/scores/score_data_response.dart';

class ScoreBrain with ChangeNotifier {
  ScoreDataResponse? _scoreDataResponse = ScoreDataResponse();

  void setData(ScoreDataResponse? data) {
    _scoreDataResponse = data;
    notifyListeners();
  }

  void addData(data) {
    _scoreDataResponse?.results?.insertAll(0, data);
    notifyListeners();
  }

  void updateData(data) {
    final index = _scoreDataResponse?.results
        ?.indexWhere((element) => element.id == data.id);
    _scoreDataResponse?.results?[index!] = data;
    notifyListeners();
  }

  void deleteData(data) {
    _scoreDataResponse?.results?.remove(data);
    notifyListeners();
  }

  ScoreDataResponse? get data {
    return _scoreDataResponse;
  }

  int? get count {
    return _scoreDataResponse?.results?.length;
  }
}
