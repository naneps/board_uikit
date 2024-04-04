import 'package:board_uikit/app/commons/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      title: "Board UIKit",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      darkTheme: DefaultTheme.darkTheme,
      themeMode: Get.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
    ),
  );
}
