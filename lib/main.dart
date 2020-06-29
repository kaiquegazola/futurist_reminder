import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:futuristreminder/app/data/repository/profile_repository.dart';
import 'package:futuristreminder/app/ui/lang/my_translations.dart';
import 'package:futuristreminder/app/ui/screens/places_screen.dart';
import 'package:futuristreminder/app/ui/theme/colors_theme.dart';
import 'package:futuristreminder/app/ui/widgets/profile_widget.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

import 'app/data/model/profile.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  ScreenUtil.init(width: 768, height: 1280);
  runApp(ReminderApp());
  Get.putAsync<GetStorage>(() async {
    await GetStorage().initStorage;
    return GetStorage();
  });
  Get.lazyPut<ProfileProvider>(() => ProfileProvider(box: Get.find()));
  Get.lazyPut<ProfileRepository>(() => ProfileRepository(provider: Get.find()));
  Get.lazyPut<Profile>(() => Profile());
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
      home: HomeScreen(),
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
  Get.bottomSheet(
    Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 30.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Salvar novo Local'),
            SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'description'.tr,
                contentPadding: EdgeInsets.all(4),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 20),
            RaisedButton(
              child: Text('save'.tr),
              onPressed: () {
                Get.back();
                //     Geolocator()
                // .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
              },
            ),
          ],
        ),
      ),
    ),
  );
}
