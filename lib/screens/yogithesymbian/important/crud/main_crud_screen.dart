import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_starterpack_jelly/models/scores/score_brain.dart';
import 'package:flutter_starterpack_jelly/models/scores/score_data_response.dart';
import 'package:flutter_starterpack_jelly/services/crud/score_service.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'add_crud_screen.dart';
import 'detail_crud_screen.dart';

class MainCrudScreen extends StatefulWidget {
  static const String id = '/main_crud_screen';
  const MainCrudScreen({Key? key}) : super(key: key);

  @override
  _MainCrudScreenState createState() => _MainCrudScreenState();
}

class _MainCrudScreenState extends State<MainCrudScreen> {
  final ScoreService _scoreService = ScoreService();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: true);

  int currentPage = 0;
  int? totalPage;

  @override
  void initState() {
    super.initState();
  }

  Future<bool> getData(ScoreBrain scoreBrainR, {bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 0;
      print('init refresh');
      _refreshController.resetNoData();
    } else {
      if (currentPage >= totalPage!) {
        print('no data');
        return false;
      }
      print('continue refresh');
    }

    final response = await _scoreService.getData(currentPage, 5);
    final data = ScoreDataResponse.fromJson(response);

    if (data.results != []) {
      if (isRefresh) {
        scoreBrainR.setData(data);
        print('setData');
      } else {
        scoreBrainR.addData(data.results);
        print('addData');
      }
      currentPage++;
      totalPage = data.totalPages!;
      print('currentPage page : $currentPage');
      print('total page : $totalPage');

      setState(() {});
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final scoreBrainR = context.read<ScoreBrain>();
    return Scaffold(
      appBar: AppBar(
        title: Text('AUTO CRUD'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true, // modal take up the full screen:
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30.0),
              ),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            builder: (context) => SingleChildScrollView(
              // To have the AddTaskScreen sit just above the keyboard, you can wrap it inside a SingleChildScrollView, which determines the padding at the bottom using a MediaQuery.
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                child: AddCrudScreen(refreshController: _refreshController),
              ),
            ),
          );
        },
      ),
      body: Consumer<ScoreBrain>(
        builder: (context, dataScoreBrain, child) {
          return SmartRefresher(
            controller: _refreshController,
            enablePullUp: true,
            onRefresh: () async {
              final result = await getData(scoreBrainR, isRefresh: true);
              print('onRefresh : $result');
              if (result == true) {
                _refreshController.refreshCompleted();
              } else {
                _refreshController.refreshFailed();
              }
            },
            onLoading: () async {
              final result = await getData(scoreBrainR);
              print('onLoading : $result');
              if (result == true) {
                _refreshController.loadComplete();
              } else {
                if (currentPage >= totalPage!) {
                  _refreshController.loadNoData();
                  print('no data');
                } else {
                  _refreshController.loadFailed();
                }
              }
            },
            child: ListView.separated(
              // physics: const NeverScrollableScrollPhysics(),
              // reverse: true,
              shrinkWrap: true,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                final data = dataScoreBrain.data?.results;
                return InkWell(
                  onTap: () {
                    print('tap ${data?[index].id}');
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled:
                          true, // modal take up the full screen:
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30.0),
                        ),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      builder: (context) => SingleChildScrollView(
                        // To have the AddTaskScreen sit just above the keyboard, you can wrap it inside a SingleChildScrollView, which determines the padding at the bottom using a MediaQuery.
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: Container(
                          child: DetailCrudScreen(index: index),
                        ),
                      ),
                    );
                  },
                  child: Dismissible(
                    key: ValueKey(data?[index]),
                    onDismissed: (DismissDirection direction) {
                      print('onDismis $direction');
                      print('onDismis $index');
                      // setState(() {
                      // items.removeAt(index);
                      // });
                    },
                    background: Container(
                      color: Colors.green,
                    ),
                    secondaryBackground: Container(
                      color: Colors.red,
                    ),
                    child: Container(
                      color: Colors.white,
                      width: double.infinity,
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                          '$index . ID : ${data?[index].id} Data score : ${data?[index].score}'),
                    ),
                  ),
                );
              },
              itemCount: dataScoreBrain.count ?? 1,
            ),
          );
        },
      ),
    );
  }
}
