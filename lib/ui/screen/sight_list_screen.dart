import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/presets/colors/colors.dart';
import 'package:places/presets/styles/text_styles.dart';

/// Экран 'Список интересных мест'
class SightListScreen extends StatefulWidget {
  const SightListScreen({Key? key}) : super(key: key);

  @override
  State<SightListScreen> createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 152,
        centerTitle: false,
        titleSpacing: 16,
        elevation: 0,
        titleTextStyle: AppTextStyles.largeTitle.copyWith(
          color: AppColors.secondary,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
        ),
        title: const _Text(),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

/// Text
class _Text extends StatelessWidget {
  const _Text({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      'Список\nинтересных мест',
      style: AppBarTheme.of(context).titleTextStyle,
    );
  }
}
