import 'package:flutter/material.dart';
import 'package:flutter_starterpack_jelly/screens/importants/auth/login_screen.dart';
import 'package:flutter_starterpack_jelly/screens/importants/introduction/on_boarding_screen.dart';
import 'package:flutter_starterpack_jelly/screens/importants/splash/splash_screen.dart';
import 'package:flutter_starterpack_jelly/screens/yogithesymbian/important/crud/main_crud_screen.dart';
import 'package:flutter_starterpack_jelly/screens/yogithesymbian/important/intent/intent_screen.dart';
import 'package:flutter_starterpack_jelly/screens/yogithesymbian/important/permission_handler/permission_handler_screen.dart';
import 'package:flutter_starterpack_jelly/utils/constanta.dart';

class ImportantScreen extends StatelessWidget {
  const ImportantScreen({Key? key}) : super(key: key);

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
            Text('IMPORTANT'),
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
                  Navigator.pushNamed(context, SplashScreen.id);
                },
                icon: Icon(Icons.splitscreen_sharp),
                label: Text(
                  'SplashScreen',
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
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    OnBoardingScreen.id,
                  );
                },
                icon: Icon(Icons.filter_tilt_shift),
                label: Text(
                  'OnBoarding',
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
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                icon: Icon(Icons.auto_stories_sharp),
                label: Text(
                  'Authentication',
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
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                          Text('/lib/services/preference/user_preference.dart'),
                      action: SnackBarAction(
                        // textColor: ,
                        label: '',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.data_saver_off),
                label: Text(
                  'Shared Preferences',
                  style: kTitleText.copyWith(
                    fontSize: 11.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.icecream_outlined),
                label: Text(
                  'HomePage',
                  style: kTitleText.copyWith(
                    fontSize: 11.0,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    //
                    ),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('/lib/services/storage/storage.dart'),
                      action: SnackBarAction(
                        // textColor: ,
                        label: '',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.lock),
                label: Text(
                  'Secure Storage',
                  style: kTitleText.copyWith(
                    fontSize: 11.0,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    //
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
                onPressed: () {
                  Navigator.pushNamed(context, PermissionHandlerScreen.id);
                },
                icon: Icon(Icons.perm_device_information_sharp),
                label: Text(
                  'Permission Handler',
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
                icon: Icon(Icons.storage_rounded),
                label: Text(
                  'File Picker',
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
                  Navigator.pushNamed(context, MainCrudScreen.id);
                },
                icon: Icon(Icons.data_saver_on_sharp),
                label: Text(
                  'CRUD Data',
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
                onPressed: () {
                  // Navigator.pushNamed(context, MainCrudScreen.id);
                },
                icon: Icon(Icons.data_saver_on_sharp),
                label: Text(
                  'Search Data',
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
                icon: Icon(Icons.chat_rounded),
                label: Text(
                  'Cloud Messaging',
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
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    IntentScreen.id,
                    arguments: {"id": 123},
                  );
                },
                icon: Icon(Icons.indeterminate_check_box),
                label: Text(
                  'Intent With Data',
                  textAlign: TextAlign.center,
                  style: kTitleText.copyWith(
                    fontSize: 11.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
