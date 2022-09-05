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

class _PageView extends StatefulWidget {
  final List<FavoriteSight> list;
  final bool forVisited;

  const _PageView({
    required this.list,
    required this.forVisited,
    Key? key,
  }) : super(key: key);

  @override
  State<_PageView> createState() => _PageViewState();
}

class _PageViewState extends State<_PageView> {
  var _list = <FavoriteSight>[];

  @override
  void initState() {
    super.initState();
    _createList();
  }

  @override
  Widget build(BuildContext context) {
    return _list.isNotEmpty
        ? ListView.builder(
            padding: const EdgeInsets.only(
              top: AppSizes.paddingDetailContentDivider,
            ),
            itemCount: _list.length,
            itemBuilder: (context, index) {
              return _DraggableSightCard(
                list: _list,
                favoriteSight: _list[index],
                onDelete: () => _onDelete(_list[index]),
                onSorting: _onSorting,
              );
            },
          )
        : widget.forVisited
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

  void _onDelete(FavoriteSight favoriteSight) {
    final hasBeenRemoved = widget.list.remove(favoriteSight);
    if (hasBeenRemoved) {
      setState(_createList);
    }
  }

  void _createList() {
    _list = widget.list
        .where(
          (favoriteSight) => favoriteSight.visited == widget.forVisited,
        )
        .toList();
  }

  void _onSorting() {
    setState(() {});
  }
}

class _DraggableSightCard extends StatelessWidget {
  final List<FavoriteSight> list;
  final FavoriteSight favoriteSight;
  final VoidCallback onDelete;
  final VoidCallback onSorting;

  const _DraggableSightCard({
    required this.list,
    required this.favoriteSight,
    required this.onDelete,
    required this.onSorting,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const margin = EdgeInsets.fromLTRB(
      AppSizes.paddingCommon,
      0,
      AppSizes.paddingCommon,
      AppSizes.paddingCommon,
    );

    final favoriteSightCard = FavoriteSightCard(
      favoriteSight,
      onDelete: onDelete,
      margin: margin,
    );

    final draggableWidget = LongPressDraggable<FavoriteSight>(
      data: favoriteSight,
      axis: Axis.vertical,
      child: favoriteSightCard,
      feedback: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
        ),
        child: FavoriteSightCard(
          favoriteSight,
          onDelete: onDelete,
          isDraggable: true,
          margin: margin,
        ),
      ),
      childWhenDragging: Opacity(
        opacity: 0.5,
        child: favoriteSightCard,
      ),
    );

    return DragTarget<FavoriteSight>(
      onWillAccept: (currentFavoriteSight) {
        return currentFavoriteSight != favoriteSight;
      },
      onAccept: (currentFavoriteSight) {
        final index = list.indexOf(favoriteSight);
        list
          ..remove(currentFavoriteSight)
          ..insert(index, currentFavoriteSight);
        onSorting();
      },
      builder: (
        context,
        candidateData,
        rejectedData,
      ) {
        return draggableWidget;
      },
    );
  }
}
