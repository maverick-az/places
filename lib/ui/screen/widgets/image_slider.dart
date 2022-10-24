import 'package:flutter/material.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/ui/widgets/container/container_for_image_network.dart';

/// Слайдер картинок
class ImageSlider extends StatefulWidget {
  final List<String> imageUrls;

  const ImageSlider({
    Key? key,
    required this.imageUrls,
  }) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider>
    with SingleTickerProviderStateMixin {
  late final PageController _pageController;
  late final TabController _tabController;

  @override
  void initState() {
    _pageController = PageController();
    _tabController =
        TabController(length: widget.imageUrls.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _tabController.animateTo(index);
            });
          },
          children: widget.imageUrls
              .map((imageUrl) => ContainerForImageNetwork(
                    url: imageUrl,
                    height: double.infinity,
                  ))
              .toList(),
        ),
        if (widget.imageUrls.length > 1)
          Positioned(
            bottom: 0,
            child: SizedBox(
              height: 8,
              width: MediaQuery.of(context).size.width,
              child: TabBar(
                controller: _tabController,
                labelPadding: EdgeInsets.zero,
                indicatorWeight: 0,
                onTap: (index) {
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                },
                indicator: BoxDecoration(
                  color: theme.indicatorColor,
                  borderRadius:
                      _tabController.index < widget.imageUrls.length - 1
                          ? const BorderRadius.only(
                              topRight: AppSizes.radiusBtnSwitch,
                              bottomRight: AppSizes.radiusBtnSwitch,
                            )
                          : null,
                ),
                tabs: widget.imageUrls.map((imageUrl) {
                  final tabIndex = widget.imageUrls.indexOf(imageUrl);

                  return Stack(
                    children: [
                      if (tabIndex <= _tabController.index)
                        Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: theme.indicatorColor,
                            borderRadius: const BorderRadius.only(
                              topRight: AppSizes.radiusBtnSwitch,
                              bottomRight: AppSizes.radiusBtnSwitch,
                            ),
                          ),
                        ),
                      Tab(
                        child: Container(
                          color: tabIndex < _tabController.index
                              ? theme.indicatorColor
                              : Colors.transparent,
                        ),
                      ),
                      if (tabIndex > 0 && tabIndex <= _tabController.index)
                        ColoredBox(
                          color: theme.colorScheme.secondary,
                          child: const SizedBox(
                            height: double.maxFinite,
                            width: 1,
                          ),
                        ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
      ],
    );
  }
}
