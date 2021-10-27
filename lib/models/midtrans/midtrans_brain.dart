import 'package:flutter/material.dart';
import 'package:flutter_starterpack_jelly/models/midtrans/midtrans_data.dart';

class MidtransBrain with ChangeNotifier {
  MidtransData? _midtransData = MidtransData();
  String? _paymentLink;

  void setLink(link) {
    _paymentLink = link;
    notifyListeners();
  }

  String? get getLink {
    return _paymentLink;
  }

  void setData(int amount, String? orderId) {
    _midtransData = MidtransData(
      transactionDetails: TransactionDetails(
        orderId: orderId,
        grossAmount: amount,
      ),
    );
    notifyListeners();
  }

  MidtransData? get getData {
    return _midtransData;
  }
}
