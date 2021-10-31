import 'package:flutter/material.dart';
import 'package:flutter_starterpack_jelly/screens/yogithesymbian/payment/midtrans_payment_screen.dart';
import 'package:flutter_starterpack_jelly/screens/yogithesymbian/payment/xendit_payment_screen.dart';
import 'package:flutter_starterpack_jelly/utils/constanta.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Divider(
                height: 8.0,
              ),
            ),
            const SizedBox(
              width: 4.0,
            ),
            Text('PAYMENT'),
            const SizedBox(
              width: 4.0,
            ),
            Expanded(
              child: Divider(
                height: 8.0,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, XenditPaymentScreen.id);
                },
                icon: Icon(Icons.qr_code_2),
                label: Text(
                  'Xendit - Payment Gateway',
                  textAlign: TextAlign.center,
                  style: kTitleText.copyWith(
                    fontSize: 11.0,
                  ),
                ),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, MidtransPaymentScreen.id);
                },
                icon: Icon(Icons.qr_code_2),
                label: Text(
                  'Midtrans - Payment Gateway',
                  textAlign: TextAlign.center,
                  style: kTitleText.copyWith(
                    fontSize: 11.0,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
