import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_starterpack_jelly/models/scores/score_brain.dart';
import 'package:flutter_starterpack_jelly/models/scores/score_data_response.dart';
import 'package:flutter_starterpack_jelly/services/crud/score_service.dart';
import 'package:flutter_starterpack_jelly/utils/constanta.dart';
import 'package:flutter_starterpack_jelly/utils/decimal_text_input_formatter.dart';
import 'package:provider/src/provider.dart';
import 'package:pull_to_refresh/src/smart_refresher.dart';

class AddCrudScreen extends StatelessWidget {
  final taskMsgController = TextEditingController();
  final ScoreService _scoreService = ScoreService();
  RefreshController? refreshController;

  AddCrudScreen({this.refreshController});
  @override
  Widget build(BuildContext context) {
    final scoreBrainR = context.read<ScoreBrain>();
    return Container(
      color: Color(0xFF757575),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'SCORE',
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 32.0,
              ),
              TextField(
                autofocus: true,
                style: kTextFieldTextStyle,
                decoration: kInputDecoration.copyWith(
                  hintText: 'add your score, ex: 89.5',
                  prefixIcon: Icon(Icons.add_task_rounded),
                  suffixIcon: IconButton(
                    onPressed: taskMsgController.clear,
                    icon: Icon(Icons.clear),
                  ),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [DecimalTextInputFormatter()],
                textInputAction: TextInputAction.done,
                controller: taskMsgController,
                onSubmitted: (value) {
                  taskMsgController.clear();
                },
              ),
              SizedBox(
                height: 32.0,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  postData(scoreBrainR);
                  actionDone(context);
                },
                icon: Icon(Icons.add),
                label: Text('ADD'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void postData(ScoreBrain scoreBrainR) async {
    try {
      final body = {
        'user_id': 1,
        'question_id': 1,
        'score': double.parse(taskMsgController.text)
      };

      final response = await _scoreService.postData(jsonEncode(body));
      final data = ScoreDataResponse.fromJson(response);

      if (data.success == true) {
        print(
            'ID DATA : ${data.results?.first.id} - score : ${data.results?.first.score}');
        scoreBrainR.addData(data.results);
      } else {
        print('noo');
      }
    } catch (err) {
      print('err $err');
    }
  }

  void actionDone(BuildContext context) {
    taskMsgController.clear();
    Navigator.pop(context);
    refreshController?.requestRefresh();
  }
}
