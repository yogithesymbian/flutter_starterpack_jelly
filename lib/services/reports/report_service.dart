import 'package:flutter_starterpack_jelly/services/networking.dart';
import 'package:flutter_starterpack_jelly/services/storage/storage.dart';
import 'package:flutter_starterpack_jelly/utils/anim/duratioin.dart';
import 'package:flutter_starterpack_jelly/utils/value.dart';

// TODO : api_route
const excelDownload = '/api/excel/download';

class ReportService {
  NetworkingHelper? _networkingHelper;

  Future<dynamic> getExportToExcelData(String? param1, String? param2) async {
    // debug
    print('uri : $kApiUri$excelDownload');
    // set uri
    _networkingHelper = NetworkingHelper(
      url: '$kApiUri$excelDownload',
    );
    // execute action
    return await _networkingHelper?.getDataBy2Param(param1, param2);
  }
}
