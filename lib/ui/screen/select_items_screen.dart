import 'package:flutter/material.dart';
import 'package:places/domain/entity.dart';
import 'package:places/domain/typedefs/typedef.dart';
import 'package:places/presets/assets/icons.dart';
import 'package:places/presets/strings/app_strings.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/ui/widgets/app_bar/app_bar_standard.dart';
import 'package:places/ui/widgets/button/button_normal.dart';
import 'package:places/ui/widgets/divider/divider_default.dart';
import 'package:places/ui/widgets/icon/icon_svg.dart';

/// Экран для выбора элементов из списка
class SelectItemsScreen extends StatelessWidget {
  final ListItems<Entity> getList;
  late final List<String> selectedItems;
  final bool multiSelection;

  SelectItemsScreen({
    required this.getList,
    List<String>? selectedItems,
    this.multiSelection = false,
    Key? key,
  })  : selectedItems = selectedItems ?? [],
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarStandard(
        title: AppStrings.srcTitleSelectSightTypeScreen,
        showNavigationButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.paddingCommon,
        ),
        child: _FormSelectItems(
          getList: getList,
          selectedItems: selectedItems,
          multiSelection: multiSelection,
        ),
      ),
    );
  }
}

class _FormSelectItems extends StatefulWidget {
  final ListItems<Entity> getList;
  final List<String> selectedItems;
  final bool multiSelection;

  const _FormSelectItems({
    required this.getList,
    required this.selectedItems,
    required this.multiSelection,
    Key? key,
  }) : super(key: key);

  @override
  State<_FormSelectItems> createState() => _FromSelectItemState();
}

class _FromSelectItemState extends State<_FormSelectItems> {
  late List<Entity> listItems;

  @override
  void initState() {
    super.initState();
    _getList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: listItems.length + 1,
            itemBuilder: (context, id) {
              if (id >= listItems.length) return Container();

              return ListTile(
                dense: true,
                title: Text(
                  listItems[id].name,
                  style: theme.textTheme.bodyText1?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: theme.primaryColorDark,
                  ),
                ),
                contentPadding: EdgeInsets.zero,
                trailing: _isSelected(listItems[id].id)
                    ? IconSvg(
                        icon: AppIcons.iconTick,
                        color: theme.colorScheme.tertiary,
                      )
                    : const SizedBox(),
                onTap: () => _selectItem(listItems[id].id),
              );
            },
            separatorBuilder: (context, id) => const DividerDefault(height: 1),
          ),
        ),
        //const Spacer(),
        const SizedBox(
          height: AppSizes.paddingDetailContentDivider / 2,
        ),
        ButtonNormal(
          text: AppStrings.save.toUpperCase(),
          action: widget.selectedItems.isNotEmpty ? _selectAndClose : null,
        ),
        const SizedBox(
          height: AppSizes.paddingDetailContentDivider / 2,
        ),
      ],
    );
  }

  void _selectItem(String value) {
    final isSelected = _isSelected(value);
    if (!widget.multiSelection) {
      widget.selectedItems.clear();
    }
    if (!isSelected) {
      widget.selectedItems.add(value);
    } else if (widget.multiSelection) {
      widget.selectedItems.remove(value);
    }
    setState(() {});
  }

  void _selectAndClose() {
    Navigator.pop(
      context,
      _selectedValue(),
    );
  }

  bool _isSelected(String value) {
    return widget.selectedItems.contains(value);
  }

  dynamic _selectedValue() {
    return widget.multiSelection
        ? widget.selectedItems
        : widget.selectedItems.isNotEmpty
            ? widget.selectedItems.first
            : AppStrings.appEmptyString;
  }

  Future<void> _getList() async {
    listItems = widget.getList();
  }
}
