import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_starterpack_jelly/components/jelly_alert.dart';
import 'package:flutter_starterpack_jelly/models/scores/score_brain.dart';
import 'package:flutter_starterpack_jelly/models/scores/score_data_response.dart';
import 'package:flutter_starterpack_jelly/services/crud/score_service.dart';
import 'package:flutter_starterpack_jelly/utils/constanta.dart';
import 'package:provider/src/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sizer/sizer.dart';

class DetailCrudScreen extends StatelessWidget {
  final ScoreService _scoreService = ScoreService();
  final taskMsgController = TextEditingController();
  int index;
  DetailCrudScreen({required this.index});

  @override
  Widget build(BuildContext context) {
    final scoreBrainW = context.watch<ScoreBrain>();
    final scoreBrainR = context.read<ScoreBrain>();

    final detail = scoreBrainW.data?.results?[index];
    taskMsgController.text = '${detail?.score}';

    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Details',
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
              readOnly: true,
              autofocus: false,
              style: kTextFieldTextStyle,
              decoration: kInputDecoration.copyWith(
                hintText: 'Data ID : ${detail?.id}',
                prefixIcon: Icon(Icons.perm_identity),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            TextField(
              autofocus: true,
              style: kTextFieldTextStyle,
              decoration: kInputDecoration.copyWith(
                hintText: 'add your score',
                prefixIcon: Icon(Icons.add_task_rounded),
                suffixIcon: IconButton(
                  onPressed: taskMsgController.clear,
                  icon: Icon(Icons.clear),
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], // Only numbers can be entered
              textInputAction: TextInputAction.done,
              controller: taskMsgController,
              onChanged: (value) {
                //
              },
              onSubmitted: (value) {
                // context.read<TaskData>().createTask(value);
                taskMsgController.clear();
                // Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 32.0,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      updateData(scoreBrainR, detail);
                      updateDone(context);
                    },
                    icon: Icon(Icons.update),
                    label: Text('Update'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.h,
                ),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      deleteData(scoreBrainR, detail, context);
                      deleteDone(context);
                    },
                    icon: Icon(Icons.delete),
                    label: Text('Delete'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void deleteData(
      ScoreBrain scoreBrainR, Results? detail, BuildContext context) async {
    final id = detail?.id;
    if (id != null) {
      scoreBrainR.deleteData(detail);
      try {
        final res = await _scoreService.deleteData(id);
        print(res);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Yay! A SnackBar!'),
            action: SnackBarAction(
              textColor: Colors.red,
              label: '',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          ),
        );
      } catch (err) {}
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error'),
          action: SnackBarAction(
            label: '',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        ),
      );
    }
  }

  void deleteDone(BuildContext context) {
    taskMsgController.clear();
    Navigator.pop(context);
  }

  void updateData(ScoreBrain scoreBrainR, Results? detail) async {
    final id = detail?.id;
    if (id != null) {
      detail?.score = double.parse(taskMsgController.text);
      scoreBrainR.updateData(detail);
      try {
        final body = {'score': double.parse(taskMsgController.text)};
        final res = await _scoreService.putData(jsonEncode(body), id);
        print(res);
      } catch (err) {
        print('err $err');
      }
    } else {
      print('null data');
    }
  }

  void updateDone(BuildContext context) {
    taskMsgController.clear();
    Navigator.pop(context);
  }
}
