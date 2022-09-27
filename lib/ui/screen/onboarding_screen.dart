import 'package:flutter/material.dart';
import 'package:places/presets/assets/icons.dart';
import 'package:places/presets/strings/app_strings.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/ui/widgets/app_bar/app_bar_standard.dart';
import 'package:places/ui/widgets/button/button_normal.dart';
import 'package:places/ui/widgets/button/text_button_app_bar_action.dart';
import 'package:places/ui/widgets/container/container_info_page.dart';

/// Экран онбординга
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  late final PageController _pageController = PageController();
  late final TabController _tabController;
  late final List<Map<String, String>> _pages;
  int currentIndexPage = 0;

  @override
  void initState() {
    _pages = _getPages();
    _tabController = TabController(length: _pages.length, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.headline4?.copyWith(
      color: theme.primaryColorDark,
    );
    const indicatorSize = AppSizes.paddingCommon / 2;

    return Scaffold(
      appBar: AppBarStandard(
        bottomWidget: const SizedBox(),
        title: AppStrings.appEmptyString,
        actions: currentIndexPage < _pages.length - 1
            ? [
                TextButtonAppBarAction(
                  text: AppStrings.skip,
                  action: () => _animateToPage(_pages.length - 1),
                ),
              ]
            : [],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                currentIndexPage = index;
                _tabController.animateTo(index);
                setState(() {});
              },
              children: _pages
                  .map(
                    (item) => ContainerInfoPage(
                      icon: item['icon'].toString(),
                      title: item['title'].toString(),
                      description: item['description'].toString(),
                      iconSize: 104,
                      iconColor: theme.primaryColorDark,
                      titleStyle: titleStyle,
                      descriptionStyle: theme.textTheme.subtitle2,
                    ),
                  )
                  .toList(),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(AppSizes.paddingDetailContentDivider),
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: TabBar(
              controller: _tabController,
              indicatorWeight: 0,
              labelPadding: const EdgeInsets.symmetric(
                horizontal: indicatorSize / 2,
              ),
              isScrollable: true,
              indicator: BoxDecoration(
                color: theme.colorScheme.tertiary,
                borderRadius:
                    const BorderRadius.all(AppSizes.radiusBtnImageSlider),
              ),
              indicatorSize: TabBarIndicatorSize.label,
              onTap: (index) => setState(() {
                _animateToPage(index);
              }),
              tabs: [
                for (int i = 0; i < _pages.length; i++) ...[
                  Container(
                    height: indicatorSize,
                    width: _tabController.index == i
                        ? indicatorSize * 3
                        : indicatorSize,
                    decoration: BoxDecoration(
                      color: _tabController.index == i
                          ? Colors.transparent
                          : theme.colorScheme.background,
                      borderRadius: const BorderRadius.all(
                        AppSizes.radiusBtnImageSlider,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          IgnorePointer(
            ignoring: currentIndexPage < _pages.length - 1,
            child: Opacity(
              opacity: currentIndexPage < _pages.length - 1 ? 0 : 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.paddingCommon,
                  vertical: indicatorSize,
                ),
                child: ButtonNormal(
                  text: AppStrings.toTheStart.toUpperCase(),
                  action: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _animateToPage(int page) {
    setState(() {
      _pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }
}

List<Map<String, String>> _getPages() {
  return <Map<String, String>>[
    {
      'icon': AppIcons.onBoardPageWelcome,
      'title': AppStrings.onBoardPageWelcome,
      'description': AppStrings.onBoardPageWelcomeDescription,
    },
    {
      'icon': AppIcons.onBoardPageCreateRoute,
      'title': AppStrings.onBoardPageCreateRoute,
      'description': AppStrings.onBoardPageCreateRouteDescription,
    },
    {
      'icon': AppIcons.onBoardPageAddSights,
      'title': AppStrings.onBoardPageAddSights,
      'description': AppStrings.onBoardPageAddSightsDescription,
    },
  ];
}
