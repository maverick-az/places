import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:places/domain/favorite_sight.dart';
import 'package:places/mocks.dart';
import 'package:places/presets/assets/icons.dart';
import 'package:places/presets/settings/settings.dart';
import 'package:places/presets/strings/app_strings.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/ui/screen/visiting_card.dart';
import 'package:places/ui/widgets/app_bar/app_bar_standard.dart';
import 'package:places/ui/widgets/container/container_empty_page.dart';
import 'package:places/ui/widgets/navigation_bar/bottom_navigation_view.dart';

/// Экран "Хочу посетить/Посещенные места"
class VisitingScreen extends StatelessWidget {
  List<String> get _tabsTitles => [
        AppStrings.wantToVisit,
        AppStrings.visited,
      ];

  const VisitingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Intl.defaultLocale = 'ru';
    initializeDateFormatting(AppSettings.defaultLocale);

    return DefaultTabController(
      length: _tabsTitles.length,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBarStandard(
          title: AppStrings.srcTitleFavoriteScreen,
          tabsTitles: _tabsTitles,
        ),
        body: TabBarView(
          children: [
            _PageView(
              list: mocksFavorite,
              forVisited: false,
            ),
            _PageView(
              list: mocksFavorite,
              forVisited: true,
            ),
          ],
        ),
        bottomNavigationBar: const BottomNavigationView(
          currentIndex: 2,
        ),
      ),
    );
  }
}

class _PageView extends StatelessWidget {
  final List<FavoriteSight> list;
  final bool forVisited;

  const _PageView({
    required this.list,
    required this.forVisited,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return list.isNotEmpty
        ? SingleChildScrollView(
            child: Column(
              children: list
                  .where(
                (favoriteSight) => favoriteSight.visited == forVisited,
              )
                  .map((favoriteSight) {
                return FavoriteSightCard(
                  favoriteSight,
                  margin: const EdgeInsets.fromLTRB(
                    AppSizes.paddingCommon,
                    0,
                    AppSizes.paddingCommon,
                    AppSizes.paddingCommon,
                  ),
                );
              }).toList(),
            ),
          )
        : forVisited
            ? const ContainerEmptyPage(
                icon: AppIcons.emptyPageGo,
                title: AppStrings.empty,
                description: AppStrings.emptyPageVisited,
              )
            : const ContainerEmptyPage(
                icon: AppIcons.emptyPageCard,
                title: AppStrings.empty,
                description: AppStrings.emptyPageWantToVisit,
              );
  }
}
