import 'package:flutter/material.dart';
import 'package:wedding_organise/admin/admin_login_screen/admin_login_screen.dart';
import 'package:wedding_organise/core/constants/color_constants.dart';
import 'package:wedding_organise/screen/albums_screen/albums_screen.dart';
import 'package:wedding_organise/screen/contact_us_screen/contact_us_screen.dart';
import 'package:wedding_organise/screen/home_screen/home_screen.dart';
import 'package:wedding_organise/screen/plan_screen/plan_screen.dart';
import 'package:wedding_organise/screen/services_screen/services_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'core/helper/custom_scroll_behavior.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      // TabBarScreen(startIndex: 0),
      routes: {
        '/': (context) => HomeScreen(),
        '/organizasyon': (context) => PlanScreen(),
        '/hizmetler': (context) => ServicesScreen(),
        '/albumler': (context) => AlbumsScreen(),
        '/iletisim': (context) => ContactUsScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/admin') {
          return MaterialPageRoute(
              builder: (context) =>
                  AdminLoginScreen()); // Admin Login Screen olacak
        }
        return null;
      },
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      title: 'EVENTOPYA',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: ColorConstants.bgColor)),
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: ColorConstants.siteColor),
    );
  }
}
