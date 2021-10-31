import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_starterpack_jelly/models/midtrans/midtrans_brain.dart';
import 'package:flutter_starterpack_jelly/screens/yogithesymbian/optional/webview/config/navigation_controller.dart';
import 'package:flutter_starterpack_jelly/screens/yogithesymbian/optional/webview/config/sample_menu.dart';
import 'package:provider/src/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewMidtransPaymentScreen extends StatefulWidget {
  static const String id = '/webview_midtrans_payment_screen';
  const WebViewMidtransPaymentScreen({Key? key}) : super(key: key);

  @override
  _WebViewMidtransPaymentScreenState createState() =>
      _WebViewMidtransPaymentScreenState();
}

class _WebViewMidtransPaymentScreenState
    extends State<WebViewMidtransPaymentScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  Future<bool> _onWillPop() async {
    Navigator.of(context).pop(true);
    return true;
  }

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    final midtransBrainW = context.watch<MidtransBrain>();
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter WebView example'),
          // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
          actions: <Widget>[
            NavigationControls(_controller.future),
            SampleMenu(_controller.future),
          ],
        ),
        //
        body: Builder(builder: (context) {
          return WebView(
            initialUrl: '${midtransBrainW.getLink}',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onProgress: (int progress) {
              print("WebView is loading (progress : $progress%)");
            },
            javascriptChannels: <JavascriptChannel>{
              _toasterJavascriptChannel(context),
            },
            navigationDelegate: (NavigationRequest request) {
              if (request.url.startsWith('https://www.youtube.com/')) {
                print('blocking navigation to $request}');
                return NavigationDecision.prevent;
              }
              print('allowing navigation to $request');
              return NavigationDecision.navigate;
            },
            onPageStarted: (String url) {
              print('Page started loading: $url');
            },
            onPageFinished: (String url) {
              print('Page finished loading: $url');
            },
            gestureNavigationEnabled: true,
          );
        }),
        floatingActionButton: favoriteButton(),
      ),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          // ignore: deprecated_member_use
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

  Widget favoriteButton() {
    return FutureBuilder<WebViewController>(
        future: _controller.future,
        builder: (BuildContext context,
            AsyncSnapshot<WebViewController> controller) {
          if (controller.hasData) {
            return FloatingActionButton(
              onPressed: () async {
                final String url = (await controller.data!.currentUrl())!;
                // ignore: deprecated_member_use
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text('Favorited $url')),
                );
              },
              child: const Icon(Icons.favorite),
            );
          }
          return Container();
        });
  }
}
