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
import 'package:places/ui/widgets/container/container_info_page.dart';
import 'package:places/ui/widgets/navigation_bar/bottom_navigation_view.dart';
import 'package:places/utils/date_time.dart';

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
            physics: Theme.of(context).platform == TargetPlatform.iOS
                ? const BouncingScrollPhysics()
                : const ClampingScrollPhysics(),
            padding: const EdgeInsets.only(
              top: AppSizes.paddingDetailContentDivider,
            ),
            itemCount: _list.length,
            itemBuilder: (context, index) {
              return _DraggableSightCard(
                list: _list,
                favoriteSight: _list[index],
                onDelete: () => _onDelete(_list[index]),
                onSetPlanedDate: () => _onSetPlanedDate(context, _list[index]),
                onSorting: _onSorting,
              );
            },
          )
        : widget.forVisited
            ? const ContainerInfoPage(
                icon: AppIcons.emptyPageGo,
                title: AppStrings.empty,
                description: AppStrings.emptyPageVisited,
              )
            : const ContainerInfoPage(
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

  Future<void> _onSetPlanedDate(
    BuildContext context,
    FavoriteSight favoriteSight,
  ) async {
    final firstDate = DateTime.now();
    final lastDate = firstDate.add(const Duration(days: 30));
    final initialDate = favoriteSight.planedDate.isBetween(firstDate, lastDate)
        ? favoriteSight.planedDate
        : firstDate;

    final planedDate = await showDatePicker(
      context: context,
      initialDate: initialDate!,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (planedDate == null) return;

    final planedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initialDate),
    );

    if (planedTime == null) return;

    setState(() {
      favoriteSight.planedDate = DateTime(
        planedDate.year,
        planedDate.month,
        planedDate.day,
        planedTime.hour,
        planedTime.minute,
      );
    });
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
  final VoidCallback onSetPlanedDate;
  final VoidCallback onSorting;

  const _DraggableSightCard({
    required this.list,
    required this.favoriteSight,
    required this.onDelete,
    required this.onSetPlanedDate,
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
      onSetPlanedDate: onSetPlanedDate,
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
          onSetPlanedDate: onSetPlanedDate,
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
