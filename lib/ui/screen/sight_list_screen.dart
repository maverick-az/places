import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/presets/assets/icons.dart';
import 'package:places/presets/strings/app_strings.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/ui/screen/add_sight_screen.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/widgets/app_bar/app_bar_large_title.dart';
import 'package:places/ui/widgets/button/button_circular_with_gradient.dart';
import 'package:places/ui/widgets/navigation_bar/bottom_navigation_view.dart';

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
      resizeToAvoidBottomInset: false,
      appBar: const AppBarLargeTitle(title: AppStrings.scrTitleSightListScreen),
      body: SingleChildScrollView(
        child: Column(
          children: mocks.map((sight) {
            return SightCard(
              sight,
              margin: const EdgeInsets.fromLTRB(
                AppSizes.paddingCommon,
                0,
                AppSizes.paddingCommon,
                AppSizes.paddingCommon,
              ),
            );
          }).toList(),
        ),
      ),
      bottomNavigationBar: const BottomNavigationView(),
      floatingActionButton: ButtonCircularWithGradient(
        text: AppStrings.newSight.toUpperCase(),
        action: _addNewSight,
        icon: AppIcons.iconPlus,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<void> _addNewSight() async {
    await Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => const AddSightScreen(),
      ),
    );
    // TODO(me): change logic after closing form (must see courses about Navigator)
    setState(() {});
  }
}
