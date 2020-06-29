import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:futuristreminder/app/ui/lang/my_translations.dart';
import 'package:futuristreminder/app/ui/screens/places_screen.dart';
import 'package:futuristreminder/app/ui/theme/colors_theme.dart';
import 'package:futuristreminder/app/ui/widgets/place_add_widget.dart';
import 'package:futuristreminder/app/ui/widgets/profile_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

import 'package:futuristreminder/app/data/dependency/injection_container.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  ScreenUtil.init(width: 768, height: 1280);
  runApp(ReminderApp());
}

class ReminderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String countryCode = Platform.localeName.split('_')[0];
    String languageCode = Platform.localeName.split('_')[1];
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Futurist Reminder',
      translations: MyTranslations(),
      themeMode: ThemeMode.dark,
      locale: Locale(countryCode, languageCode),
      supportedLocales: [
        Locale('en', 'US'),
        Locale('pt' 'BR'),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xff1f2f38),
        colorScheme:
            ThemeData.dark().colorScheme.copyWith(surface: Color(0xff1f2f38)),
        textTheme:
            GoogleFonts.anonymousProTextTheme(ThemeData.dark().textTheme),
      ),
      home: LoadingScreen(),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff1f2f38),
        textTheme:
            GoogleFonts.anonymousProTextTheme(ThemeData.dark().textTheme),
        colorScheme:
            ThemeData.dark().colorScheme.copyWith(surface: Color(0xff1f2f38)),
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () async {
      await init();
      Get.to(HomeScreen());
    });
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorsTheme.deepBlue,
          child: Icon(
            LineIcons.plus,
            color: ColorsTheme.lightBlue,
          ),
          onPressed: () => addBottomSheet(),
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ProfileWidget(),
              TabBar(
                labelPadding: EdgeInsets.symmetric(vertical: 15.h),
                tabs: <Widget>[
                  Text("places".tr),
                  Text("helpers".tr),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    PlacesScreen(),
                    Text("teste"),
                  ],
                ),
              ),
            ],
          ),
          bottom: false,
        ),
      ),
    );
  }
}

void addBottomSheet() {
  Get.bottomSheet(PlaceAddWidget());
}
