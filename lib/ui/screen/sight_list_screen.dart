import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/presets/assets/icons.dart';
import 'package:places/presets/strings/app_strings.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/ui/screen/add_sight_screen.dart';
import 'package:places/ui/screen/filters_screen.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/screen/sight_search_screen.dart';
import 'package:places/ui/screen/widgets/search_bar.dart';
import 'package:places/ui/widgets/app_bar/app_bar_large_title.dart';
import 'package:places/ui/widgets/app_bar/app_bar_standard.dart';
import 'package:places/ui/widgets/button/button_circular_with_gradient.dart';
import 'package:places/ui/widgets/button/button_icon_svg.dart';
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
      body: SafeArea(
        child: CustomScrollView(
          physics: Theme.of(context).platform == TargetPlatform.iOS
              ? const BouncingScrollPhysics()
              : const ClampingScrollPhysics(),
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: _AppBarPersistentHeaderDelegate(
                changeFilters: _changeFilters,
                searchByWord: _searchByWord,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return SightCard(
                      mocks[index],
                      margin: const EdgeInsets.fromLTRB(
                        AppSizes.paddingCommon,
                        0,
                        AppSizes.paddingCommon,
                        AppSizes.paddingCommon,
                      ),
                    );
                  },
                  childCount: mocks.length,
                ),
              ),
            ),
          ],
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

  Future<void> _searchByWord() async {
    await Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => const SightSearchScreen(),
      ),
    );
  }

  Future<void> _changeFilters() async {
    // TODO(me): apply filters to sight list (must see courses about Navigator)
    await Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => const FiltersScreen(),
      ),
    );
  }
}

class _AppBarPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final VoidCallback? changeFilters;
  final VoidCallback? searchByWord;

  @override
  double get maxExtent =>
      AppSizes.heightAppBarLargeTitle +
      AppSizes.heightSearchBar +
      AppSizes.paddingCommon;

  @override
  double get minExtent => AppSizes.heightAppBar;

  _AppBarPersistentHeaderDelegate({
    required this.changeFilters,
    required this.searchByWord,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final offsetPercent = shrinkOffset / maxExtent;

    return Stack(
      children: [
        Opacity(
          child: const AppBarStandard(
            bottomWidget: SizedBox(),
            title: AppStrings.scrTitleSightListScreen,
          ),
          opacity: offsetPercent,
        ),
        Opacity(
          opacity: 1 - offsetPercent,
          child: AppBarLargeTitle(
            title: AppStrings.scrTitleSightListScreen,
            bottomWidget: SearchBar(
              padding: const EdgeInsets.only(
                left: AppSizes.paddingCommon,
                right: AppSizes.paddingCommon,
                bottom: AppSizes.paddingCommon - 2,
              ),
              sufixIcon: ButtonIconSvg(
                icon: AppIcons.iconFilter,
                color: Theme.of(context).colorScheme.tertiary,
                action: changeFilters,
              ),
              onTap: searchByWord,
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
