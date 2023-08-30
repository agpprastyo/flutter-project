import 'package:bwa_course_hotelio/page/checkout_page.dart';
import 'package:bwa_course_hotelio/page/checkout_success_page.dart';
import 'package:bwa_course_hotelio/page/detail_booking_page.dart';
import 'package:bwa_course_hotelio/page/detail_page.dart';
import 'package:bwa_course_hotelio/page/home_page.dart';
import 'package:bwa_course_hotelio/page/intro_page.dart';
import 'package:bwa_course_hotelio/page/signin_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'config/app_color.dart';
import 'config/app_route.dart';
import 'config/session.dart';
import 'firebase_options.dart';
import 'models/user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initializeDateFormatting('en_US');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: AppColor.backgroundScaffold,
        primaryColor: AppColor.primary,
        colorScheme: const ColorScheme.light(
          primary: AppColor.primary,
          secondary: AppColor.secondary,
        ),
      ),
      routes: {
        '/': (context) {
          return FutureBuilder(
            future: Session.getUser(),
            builder: (context, AsyncSnapshot<User> snapshot) {
              if (snapshot.data == null || snapshot.data!.id == null) {
                return const IntroPage();
              } else {
                return HomePage();
              }
            },
          );
        },
        AppRoute.intro: (context) => const IntroPage(),
        AppRoute.home: (context) => HomePage(),
        AppRoute.signin: (context) => SigninPage(),
        AppRoute.detail: (context) => DetailPage(),
        AppRoute.checkout: (context) => CheckoutPage(),
        AppRoute.checkoutSuccess: (context) => const CheckoutSuccessPage(),
        AppRoute.detailBooking: (context) => const DetailBookingPage(),
      },
    );
  }
}
