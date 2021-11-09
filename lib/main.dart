import 'package:flutter_starterpack_jelly/provider.dart';
import 'package:flutter_starterpack_jelly/routes.dart';

import 'package:flutter_starterpack_jelly/screens/importants/splash/splash_screen.dart';
import 'package:flutter_starterpack_jelly/utils/anim/transition_route_observer.dart';
import 'package:flutter_starterpack_jelly/utils/class/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: CustomTheme.lightThemeV2,
          navigatorObservers: [
            TransitionRouteObserver(),
          ],
          initialRoute: SplashScreen.id,
          onGenerateRoute: onGenerateRoute,
        );
      }),
    );
  }
}
