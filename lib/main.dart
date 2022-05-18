import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:places/presets/settings/settings.dart';
import 'package:places/presets/strings/app_strings.dart';
import 'package:places/ui/screen/res/themes.dart';
import 'package:places/ui/screen/sight_list_screen.dart';

void main() {
  // инициализация приложения
  Intl.defaultLocale = AppSettings.defaultLocale;
  initializeDateFormatting(Intl.defaultLocale);

  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _darkMode ? AppThemes.darkTheme : AppThemes.lightTheme,
      title: AppStrings.appTitle,
      home: const SightListScreen(),
    );
  }
}
