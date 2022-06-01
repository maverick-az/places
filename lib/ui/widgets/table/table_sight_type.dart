import 'package:flutter/material.dart';
import 'package:places/domain/sight_type.dart';
import 'package:places/ui/widgets/button/button_icon_sight_type.dart';

/// Таблица с кнопками для фильтрации типов мест
class TableSightType extends StatelessWidget {
  final int cellsInRow;

  const TableSightType({
    this.cellsInRow = 3,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (cellsInRow == 0) return Table();

    return Table(
      children: _getTableRows(cellsInRow),
    );
  }
}

List<TableRow> _getTableRows(int cellsInRow) {
  final tableRows = <TableRow>[];
  final numberOfRows = (SightType.list.length / cellsInRow).ceil().toInt();
  final iterator = SightType.list.iterator;

  for (var rowNumber = 0; rowNumber < numberOfRows; rowNumber++) {
    if (rowNumber > 0) {
      tableRows.add(_getEmptyTableRow(cellsInRow));
    }
    tableRows.add(
      TableRow(
        children: [
          for (var cellNumber = 0; cellNumber < cellsInRow; cellNumber++)
            TableCell(
              child: iterator.moveNext()
                  ? ButtonIconSightType(
                      sightType: iterator.current,
                    )
                  : Container(),
            ),
        ],
      ),
    );
  }

  return tableRows;
}

TableRow _getEmptyTableRow(int cellsInRow) {
  return TableRow(
    children: [
      for (var cellNumber = 0; cellNumber < cellsInRow; cellNumber++)
        const TableCell(
          child: SizedBox(
            height: 40,
          ),
        ),
    ],
  );
}
