import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:healthy_campus/helper/router_helper.dart';
import 'package:healthy_campus/theme/theme_style.dart';
import 'package:sizer/sizer.dart';

class App extends StatelessWidget {
  const App({super.key});
  static final navigatorKey = new GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return MaterialApp.router(
          title: 'Healthy Campus',
          theme: themeData,
          routerConfig: routerHelper,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('id', 'ID'), // Indonesian
          ],
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
