import 'package:flutter/material.dart';
import 'package:places/domain/sight_type.dart';
import 'package:places/ui/widgets/button/button_icon_sight_type.dart';

/// Список с кнопками для фильтрации типов мест
class ListViewSightType extends StatelessWidget {
  const ListViewSightType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: SightType.list.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 96,
            child: ButtonIconSightType(
              sightType: SightType.list[index],
            ),
          );
        },
      ),
    );
  }
}
