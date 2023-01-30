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
        child: OrientationBuilder(
          builder: (context, orientation) {
            final paddingHorizontal = orientation == Orientation.landscape
                ? AppSizes.paddingCommon * 2
                : AppSizes.paddingCommon;

            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: paddingHorizontal,
              ),
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
                      orientation: orientation,
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(
                      top: orientation == Orientation.landscape
                          ? AppSizes.paddingCommon / 2
                          : 20,
                    ),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            orientation == Orientation.landscape ? 2 : 1,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: paddingHorizontal,
                        mainAxisSpacing: AppSizes.paddingCommon,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return SightCard(
                            mocks[index],
                          );
                        },
                        childCount: mocks.length,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
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
  final Orientation orientation;

  @override
  double get maxExtent =>
      (orientation == Orientation.portrait
          ? AppSizes.heightAppBarLargeTitle + AppSizes.paddingCommon
          : AppSizes.heightAppBar) +
      AppSizes.heightSearchBar;

  @override
  double get minExtent => AppSizes.heightAppBar;

  _AppBarPersistentHeaderDelegate({
    required this.changeFilters,
    required this.searchByWord,
    required this.orientation,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final offsetPercent = shrinkOffset / maxExtent;
    final orientationLandscape = orientation == Orientation.landscape;

    return Stack(
      children: [
        Opacity(
          child: AppBarStandard(
            bottomWidget: const SizedBox(),
            title: AppStrings.scrTitleSightListScreen,
            centerTitle: !orientationLandscape,
          ),
          opacity: offsetPercent,
        ),
        Opacity(
          opacity: 1 - offsetPercent,
          child: orientationLandscape
              ? _AppBarWithSearchBarLandscape(
                  changeFilters: changeFilters,
                  searchByWord: searchByWord,
                )
              : _AppBarWithSearchBarPortret(
                  changeFilters: changeFilters,
                  searchByWord: searchByWord,
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

class _AppBarWithSearchBarPortret extends StatelessWidget {
  final VoidCallback? changeFilters;
  final VoidCallback? searchByWord;

  const _AppBarWithSearchBarPortret({
    Key? key,
    required this.changeFilters,
    required this.searchByWord,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBarLargeTitle(
      title: AppStrings.scrTitleSightListScreen,
      titlePadding: const EdgeInsets.only(
        top: AppSizes.paddingAppBarLargeTitle,
        bottom: AppSizes.paddingCommon,
      ),
      bottomWidget: SearchBar(
        padding: const EdgeInsets.only(
          bottom: AppSizes.paddingCommon - 2,
        ),
        sufixIcon: ButtonIconSvg(
          icon: AppIcons.iconFilter,
          color: Theme.of(context).colorScheme.tertiary,
          action: changeFilters,
        ),
        onTap: searchByWord,
      ),
    );
  }
}

class _AppBarWithSearchBarLandscape extends StatelessWidget {
  final VoidCallback? changeFilters;
  final VoidCallback? searchByWord;

  const _AppBarWithSearchBarLandscape({
    Key? key,
    required this.changeFilters,
    required this.searchByWord,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBarStandard(
      title: AppStrings.scrTitleSightListScreen,
      centerTitle: false,
      titleSpacing: 0,
      bottomWidget: SearchBar(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.paddingCommon / 2,
        ),
        sufixIcon: ButtonIconSvg(
          icon: AppIcons.iconFilter,
          color: Theme.of(context).colorScheme.tertiary,
          action: changeFilters,
        ),
        onTap: searchByWord,
      ),
    );
  }
}
