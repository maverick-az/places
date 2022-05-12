import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:places/mocks.dart';
import 'package:places/presets/settings/settings.dart';
import 'package:places/presets/strings/app_strings.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';

void main() {
  // инициализация приложения
  Intl.defaultLocale = AppSettings.defaultLocale;
  initializeDateFormatting(Intl.defaultLocale);

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      //home: SightListScreen(),
      home: VisitingScreen(),
      //home: SightDetails(mocks.first),
    );
  }
}
