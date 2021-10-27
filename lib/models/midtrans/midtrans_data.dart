class MidtransData {
  TransactionDetails? transactionDetails;

  MidtransData({this.transactionDetails});

  MidtransData.fromJson(Map<String, dynamic> json) {
    if (json["transaction_details"] is Map)
      this.transactionDetails = json["transaction_details"] == null
          ? null
          : TransactionDetails.fromJson(json["transaction_details"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.transactionDetails != null)
      data["transaction_details"] = this.transactionDetails?.toJson();
    return data;
  }
}

class TransactionDetails {
  String? orderId;
  int? grossAmount;

  TransactionDetails({this.orderId, this.grossAmount});

  TransactionDetails.fromJson(Map<String, dynamic> json) {
    if (json["order_id"] is String) this.orderId = json["order_id"];
    if (json["gross_amount"] is int) this.grossAmount = json["gross_amount"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["order_id"] = this.orderId;
    data["gross_amount"] = this.grossAmount?.toInt();
    return data;
  }
}
