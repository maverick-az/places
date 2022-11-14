import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:places/presets/settings/settings.dart';
import 'package:places/presets/strings/app_strings.dart';
import 'package:places/providers/filters_sight_type_provider.dart';
import 'package:places/providers/theme_provider.dart';
import 'package:places/ui/screen/res/themes.dart';
import 'package:places/ui/screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  // инициализация приложения
  Intl.defaultLocale = AppSettings.defaultLocale;
  initializeDateFormatting(Intl.defaultLocale);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FiltersSightTypeProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: context.watch<ThemeProvider>().themeMode,
      title: AppStrings.appTitle,
      home: const SplashScreen(),
    );
  }
}
