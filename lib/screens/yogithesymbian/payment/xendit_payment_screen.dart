import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:fxendit/fxendit.dart';

class XenditPaymentScreen extends StatefulWidget {
  static const String id = '/xendit_payment';
  const XenditPaymentScreen({Key? key}) : super(key: key);

  @override
  _XenditPaymentScreenState createState() => _XenditPaymentScreenState();
}

class _XenditPaymentScreenState extends State<XenditPaymentScreen> {
  // Xendit xendit = Xendit(
  //     'xnd_public_development_fQhqXx0t9zQCXkmwY3eodCD8YOq6r9SQu5zt2j67HJDQZeCKJoYQMnavaccfK');
  // String? tokenId;

  // void createSingleUseToken() async {
  //   XCard card = XCard(
  //     creditCardNumber: '4111111111111111',
  //     creditCardCVN: '123',
  //     expirationMonth: '09',
  //     expirationYear: '2021',
  //   );

  //   TokenResult result = await xendit.createSingleUseToken(
  //     card,
  //     amount: 75000,
  //     shouldAuthenticate: true,
  //     onBehalfOf: '',
  //   );

  //   if (result.isSuccess) {
  //     tokenId = result.token?.id;
  //     print('Token ID: ${result.token?.id}');
  //   } else {
  //     print(
  //         'SingleUseToken Error: ${result.errorCode} - ${result.errorMessage}');
  //   }
  // }

  // void createMultipleToken() async {
  //   XCard card = XCard(
  //     creditCardNumber: '4111111111111111',
  //     creditCardCVN: '123',
  //     expirationMonth: '09',
  //     expirationYear: '2021',
  //   );

  //   TokenResult result = await xendit.createMultipleUseToken(card);

  //   if (result.isSuccess) {
  //     tokenId = result.token?.id;
  //     print('Token ID: ${result.token!.id}');
  //   } else {
  //     print(
  //         'MultipleUseToken Error: ${result.errorCode} - ${result.errorMessage}');
  //   }
  // }

  // void create3DSAuth() async {
  //   AuthenticationResult result =
  //       await xendit.createAuthentication(tokenId ?? '', amount: 50000);

  //   if (result.isSuccess) {
  //     print('Authentication ID: ${result.authentication!.id}');
  //   } else {
  //     print(
  //         'Authentication Error: ${result.errorCode} - ${result.errorMessage}');
  //   }
  // }

  // void ccValidator() async {
  //   // number
  //   String cardNumber = '4111111111111111';
  //   bool isValidNum = CardValidator.isCardNumberValid(cardNumber);

  //   // expired
  //   String expirationMonth = '09';
  //   String expirationYear = '2021';

  //   bool isValidExp =
  //       CardValidator.isExpiryValid(expirationMonth, expirationYear);

  //   // cvn
  //   String cardCVN = '123';

  //   bool isValidCvn = CardValidator.isCvnValid(cardCVN);

  //   // cvn length
  //   // String cardNumber = '4111111111111111';
  //   // String cardCVN = '123';

  //   bool isValid = CardValidator.isCvnValidForCardType(cardCVN, cardNumber);

  //   // card type
  //   // String cardNumber = '4111111111111111';

  //   CardType cardType = CardValidator.getCardType(cardNumber);
  //   print('${cardType.cardName} - ${cardType.cardKey}');
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Xendit'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // createSingleUseToken();
                },
                child: Text(
                  'createSingleToken',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // createMultipleToken();
                },
                child: Text(
                  'createMultipleToken',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
