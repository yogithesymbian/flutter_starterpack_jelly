import 'package:flutter_starterpack_jelly/models/importants/introduction/intro_data.dart';
import 'package:flutter_starterpack_jelly/models/midtrans/midtrans_data.dart';
import 'package:flutter_starterpack_jelly/services/networking.dart';
import 'package:flutter_starterpack_jelly/utils/value.dart';

const uriMidtransPayment =
    'https://app.sandbox.midtrans.com/snap/v1/transactions';

class MidtransService {
  NetworkingHelper? _networkingHelper;
  String? uriData = '$uriMidtransPayment';

  Future<dynamic> postData(String? body) async {
    // debug
    print('uri : $uriData');
    // set uri
    _networkingHelper = NetworkingHelper(
      url: '$uriData',
    );
    // execute action
    return await _networkingHelper?.postDataPayment(body);
  }
}
