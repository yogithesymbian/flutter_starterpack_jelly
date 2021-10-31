import 'package:flutter_starterpack_jelly/services/networking.dart';
import 'package:flutter_starterpack_jelly/utils/value.dart';

const uriScore = '/api/score';

class ScoreService {
  NetworkingHelper? _networkingHelper;
  String? uriData = '$kApiUri$uriScore';

  Future<dynamic> getData(page, size) async {
    // debug
    print('uri : $uriData?page=$page&size=$size');
    // set uri
    _networkingHelper = NetworkingHelper(
      url: '$uriData?page=$page&size=$size',
    );
    // execute action
    return await _networkingHelper?.getData();
  }

  Future<dynamic> postData(body) async {
    // debug
    print('uri : $uriData');
    // set uri
    _networkingHelper = NetworkingHelper(
      url: '$uriData',
    );
    // execute action
    return await _networkingHelper?.postData(body);
  }

  Future<dynamic> putData(body, int id) async {
    // debug
    print('uri : $uriData/$id');
    // set uri
    _networkingHelper = NetworkingHelper(
      url: '$uriData/$id',
    );
    // execute action
    return await _networkingHelper?.putReplaceOrCreateData(body);
  }

  Future<dynamic> patchData(body, int id) async {
    // debug
    print('uri : $uriData/$id');
    // set uri
    _networkingHelper = NetworkingHelper(
      url: '$uriData/$id',
    );
    // execute action
    return await _networkingHelper?.patchUpdateData(body);
  }

  Future<dynamic> deleteData(int id) async {
    // debug
    print('uri : $uriData/$id/1');
    // set uri
    _networkingHelper = NetworkingHelper(
      url: '$uriData/$id/1',
    );
    // execute action
    return await _networkingHelper?.deleteData();
  }

  Future<dynamic> unDeleteData(int id) async {
    // debug
    print('uri : $uriData/$id/null');
    // set uri
    _networkingHelper = NetworkingHelper(
      url: '$uriData/$id/null',
    );
    // execute action
    return await _networkingHelper?.deleteData();
  }
}
