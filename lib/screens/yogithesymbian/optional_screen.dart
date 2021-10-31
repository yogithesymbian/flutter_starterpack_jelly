import 'package:flutter/material.dart';
import 'package:flutter_starterpack_jelly/screens/yogithesymbian/optional/webview/webview_sample_screen.dart';
import 'package:flutter_starterpack_jelly/utils/constanta.dart';

class OptionalScreen extends StatelessWidget {
  const OptionalScreen({Key? key}) : super(key: key);

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
            Text('OPTIONAL'),
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
                onPressed: () {},
                icon: Icon(Icons.personal_video_rounded),
                label: Text(
                  'Provider',
                  style: kTitleText.copyWith(
                    fontSize: 11.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.block),
                label: Text(
                  'BloC',
                  style: kTitleText.copyWith(
                    fontSize: 11.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.chat),
                label: Text(
                  'NLP Bot Chat',
                  textAlign: TextAlign.center,
                  style: kTitleText.copyWith(
                    fontSize: 11.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.qr_code_2),
                label: Text(
                  'QrCode All Type',
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
                  Navigator.pushNamed(context, WebViewSampleScreen.id);
                },
                icon: Icon(Icons.qr_code_2),
                label: Text(
                  'WebView',
                  textAlign: TextAlign.center,
                  style: kTitleText.copyWith(
                    fontSize: 11.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
