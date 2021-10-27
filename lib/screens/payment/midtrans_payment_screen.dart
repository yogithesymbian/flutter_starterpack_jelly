import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_starterpack_jelly/models/midtrans/midtrans_brain.dart';
import 'package:flutter_starterpack_jelly/models/midtrans/midtrans_data.dart';
import 'package:flutter_starterpack_jelly/screens/webview/payment/webview_midtrans_payment_screen.dart';
import 'package:flutter_starterpack_jelly/services/midtrans/midtrans_service.dart';
import 'package:flutter_starterpack_jelly/utils/colors.dart';
import 'package:flutter_starterpack_jelly/utils/constanta.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

class MidtransPaymentScreen extends StatefulWidget {
  static const String id = '/midtrans_payment_screen';
  const MidtransPaymentScreen({Key? key}) : super(key: key);

  @override
  _MidtransPaymentScreenState createState() => _MidtransPaymentScreenState();
}

class _MidtransPaymentScreenState extends State<MidtransPaymentScreen> {
  // TextEditingController amountController = TextEditingController();
  MoneyMaskedTextController amountController = MoneyMaskedTextController(
    decimalSeparator: ',',
    thousandSeparator: '.',
    leftSymbol: 'Rp ',
  );
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final midtransBrainR = context.read<MidtransBrain>();
    final midtransBrainW = context.watch<MidtransBrain>();

    final midtransService = MidtransService();
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text('Midtrans | Payment gateway'),
              ),
              SizedBox(
                height: 2.h,
              ),
              TextField(
                autofocus: false,
                style: kTextFieldTextStyle.copyWith(
                  color: kPrimaryColor,
                ),
                keyboardType: TextInputType.number,
                cursorColor: kPrimaryColor,
                decoration: kInputDecoration.copyWith(
                  prefixIcon: Icon(
                    Icons.payment,
                    color: kPrimaryColor,
                  ),
                  suffixIcon: amountController.text.isNotEmpty
                      ? IconButton(
                          onPressed: amountController.clear,
                          icon: Icon(
                            Icons.clear,
                            color: kPrimaryColor,
                          ),
                        )
                      : null,
                ),
                textInputAction: TextInputAction.next,
                controller: amountController,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              ElevatedButton.icon(
                onPressed: () async {
                  print('bayar clicked');
                  print('amount : ${amountController.numberValue.toInt()}');
                  try {
                    // datetime
                    DateTime now = DateTime.now();
                    String formattedDate =
                        DateFormat('kkmmssEEEdMMM').format(now);
                    String? orderId = 'ORDER-$formattedDate';

                    int? amount = amountController.numberValue.toInt();

                    midtransBrainR.setData(amount, orderId);

                    final body =
                        json.encode(await midtransBrainW.getData?.toJson());

                    print('body : ${body}');

                    final response = await midtransService.postData(body);

                    midtransBrainR.setLink(response['redirect_url']);

                    Navigator.pushNamed(
                        context, WebViewMidtransPaymentScreen.id);
                  } catch (err) {
                    print('catch payment $err');
                  }
                },
                icon: Icon(Icons.spa_outlined),
                label: Text(
                  'Bayar Sekarang',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
