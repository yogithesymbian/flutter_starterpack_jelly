import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starterpack_jelly/services/reports/report_service.dart';
import 'package:path_provider/path_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String id = '/home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final String path;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    _setPath();
    if (!mounted) return;
  }

  void _setPath() async {
    path = (await getExternalStorageDirectory())!.path;
  }

  @override
  Widget build(BuildContext context) {
    final report_service = ReportService();
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              try {
                final request = await report_service.getExportToExcelData(
                    '2021-10-10', '2021-10-11');
                File file = new File('$path/data.xlsx');
                await file.writeAsBytes(request.bodyBytes);
              } catch (e) {
                print('catch report_service : $e');
              }
            },
            child: Text('TEST DOWNLOAD XLSX'),
          ),
        ],
      ),
    );
  }
}
