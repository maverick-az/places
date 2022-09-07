import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/presets/assets/icons.dart';
import 'package:places/presets/strings/app_strings.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/providers/sight_search_provider.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/ui/screen/widgets/search_bar.dart';
import 'package:places/ui/widgets/app_bar/app_bar_standard.dart';
import 'package:places/ui/widgets/button/button_icon_svg.dart';
import 'package:places/ui/widgets/container/container_empty_page.dart';
import 'package:places/ui/widgets/divider/divider_default.dart';
import 'package:places/ui/widgets/lists/list_tile_standard.dart';
import 'package:places/ui/widgets/lists/list_tile_with_image.dart';
import 'package:places/ui/widgets/navigation_bar/bottom_navigation_view.dart';
import 'package:provider/provider.dart';

/// Экран поиска 'Список интересных мест'
class SightSearchScreen extends StatelessWidget {
  const SightSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SightSearchProvider(),
      child: const _Screen(),
    );
  }
}

class _Screen extends StatefulWidget {
  const _Screen({
    Key? key,
  }) : super(key: key);

  @override
  State<_Screen> createState() => _ScreenState();
}

class _ScreenState extends State<_Screen> {
  final _controllerSearch = TextEditingController();
  late SightSearchProvider provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<SightSearchProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBarStandard(
        title: AppStrings.scrTitleSightListScreen,
        showNavigationButton: true,
        bottomWidget: SearchBar(
          controller: _controllerSearch,
          onChange: (value) => provider.searchSights(value),
        ),
        bottomWidgetHeight: AppSizes.heightSearchBar,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.paddingCommon,
          vertical: AppSizes.paddingDetailContentDivider,
        ),
        child: Selector<SightSearchProvider, SightSearchStatus>(
          selector: (_, searchProvider) => searchProvider.status,
          builder: (_, status, __) {
            switch (status) {
              case SightSearchStatus.empty:
                return _SearchedHistory(
                  provider: provider,
                  theme: theme,
                );
              case SightSearchStatus.waitingForMinChars:
                return Container();
              case SightSearchStatus.inProgress:
              case SightSearchStatus.done:
                return const _FoundedSights();
              default:
                return const ContainerEmptyPage(
                  icon: AppIcons.emptyPageSearch,
                  title: AppStrings.foundNothing,
                  description: AppStrings.emptyPageFoundNothing,
                );
            }
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigationView(),
    );
  }
}

class _SearchedHistory extends StatefulWidget {
  final SightSearchProvider provider;
  final ThemeData theme;

  const _SearchedHistory({
    required this.provider,
    required this.theme,
    Key? key,
  }) : super(key: key);

  @override
  State<_SearchedHistory> createState() => _SearchedHistoryState();
}

class _SearchedHistoryState extends State<_SearchedHistory> {
  @override
  Widget build(BuildContext context) {
    if (widget.provider.searchedHistory.isEmpty) {
      return Container();
    }

    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          AppStrings.youSearched.toUpperCase(),
          style: Theme.of(context).textTheme.overline,
        ),
        ListView.separated(
          shrinkWrap: true,
          itemCount: widget.provider.searchedHistory.length,
          itemBuilder: (context, index) => ListTileStandard(
            title: widget.provider.searchedHistory[index].name,
            titleColor: widget.theme.colorScheme.secondaryContainer,
            trailing: ButtonIconSvg(
              icon: AppIcons.iconDelete,
              color: widget.theme.disabledColor,
              action: () => _deleteItem(index),
            ),
            onTap: () => Navigator.push<SightDetails>(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    SightDetails(widget.provider.searchedHistory[index]),
              ),
            ),
          ),
          separatorBuilder: (context, index) => const DividerDefault(height: 1),
        ),
        GestureDetector(
          onTap: () {
            widget.provider.clearSearchedHistory();
            setState(() {});
          },
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 13),
              child: Text(
                AppStrings.linkClearHistory,
                style: theme.textTheme.headline6?.copyWith(
                  color: theme.colorScheme.tertiary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _deleteItem(int index) {
    widget.provider.deleteItemFromSearchedHistory(index);
    setState(() {});
  }
}

class _FoundedSights extends StatelessWidget {
  const _FoundedSights({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SightSearchProvider>(context);
    final foundedSights = provider.foundedSights;
    final theme = Theme.of(context);

    if (provider.status == SightSearchStatus.inProgress) {
      return SizedBox(
        width: double.infinity,
        child: SizedBox.square(
          dimension: 40,
          child: Align(
            child: CircularProgressIndicator(
              color: theme.colorScheme.background,
              backgroundColor: theme.colorScheme.background.withOpacity(0.1),
              strokeWidth: 6,
            ),
          ),
        ),
      );
    }

    // list of sights
    return ListView.separated(
      physics: Theme.of(context).platform == TargetPlatform.iOS
          ? const BouncingScrollPhysics()
          : const ClampingScrollPhysics(),
      itemCount: foundedSights.length,
      itemBuilder: (context, index) => ListTileLeadingImage(
        image: foundedSights[index].sight.urls[0],
        title: '',
        titleWidget: _RichText(
          text: foundedSights[index].sight.name,
          matches: foundedSights[index].mathes,
          theme: theme,
        ),
        subtitle: foundedSights[index].sight.type.name,
        onTap: () =>
            _showSightDetail(context, foundedSights[index].sight, provider),
      ),
      separatorBuilder: (context, index) => const DividerDefault(
        height: 1,
        indent: AppSizes.widthImageListTile + AppSizes.paddingCommon,
      ),
    );
  }

  Future<void> _showSightDetail(
    BuildContext context,
    Sight sight,
    SightSearchProvider provider,
  ) async {
    provider.addSearchedWordToHistory(sight);
    await Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => SightDetails(sight),
      ),
    );
  }
}

class _RichText extends StatelessWidget {
  final String text;
  final Iterable<RegExpMatch> matches;
  final ThemeData theme;
  final _list = <Map<String, dynamic>>[];

  _RichText({
    required this.text,
    required this.matches,
    required this.theme,
    Key? key,
  }) : super(key: key) {
    _addDataToList();
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: theme.textTheme.bodyText1?.copyWith(
          fontWeight: FontWeight.w400,
          color: theme.primaryColorDark,
        ),
        children: _list
            .map((element) => TextSpan(
                  text: element['text'] as String,
                  style: element['isBold'] as bool
                      ? const TextStyle(
                          fontWeight: FontWeight.w500,
                        )
                      : null,
                ))
            .toList(),
      ),
    );
  }

  void _addDataToList() {
    final firstMatch = matches.first;
    _list
      ..add(<String, dynamic>{
        'text': text.substring(0, firstMatch.start),
        'isBold': false,
      })
      ..add(<String, dynamic>{
        'text': text.substring(firstMatch.start, firstMatch.end),
        'isBold': true,
      })
      ..add(<String, dynamic>{
        'text': text.substring(firstMatch.end),
        'isBold': false,
      });
  }
}
