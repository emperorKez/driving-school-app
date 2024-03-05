import 'package:flutter/material.dart';
import 'package:korbil_mobile/theme/theme.dart';

class PaymentDataTable extends StatelessWidget {
  const PaymentDataTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataTable(
      dataTextStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 12,
        color: KorbilTheme.of(context).secondaryColor,
      ),
      columnSpacing: 20,
      clipBehavior: Clip.antiAlias,
      horizontalMargin: 0,
      columns: const [
        DataColumn(
          label: Text('Name'),
        ),
        DataColumn(
          label: Text('Date'),
        ),
        DataColumn(
          label: Text('Amount'),
        ),
        DataColumn(
          label: Text('Status'),
        ),
      ],
      rows: const [
        DataRow(
          cells: [
            DataCell(Text('Mikael Anders')),
            DataCell(Text('21/11/22')),
            DataCell(Text(r'50$')),
            DataCell(Text('Success ')),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Mikael Anders')),
            DataCell(Text('21/11/22')),
            DataCell(Text(r'50$')),
            DataCell(Text('Success ')),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Mikael Anders')),
            DataCell(Text('21/11/22')),
            DataCell(Text(r'50$')),
            DataCell(Text('Success ')),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Mikael Anders')),
            DataCell(Text('21/11/22')),
            DataCell(Text(r'50$')),
            DataCell(Text('Success ')),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Mikael Anders')),
            DataCell(Text('21/11/22')),
            DataCell(Text(r'50$')),
            DataCell(Text('Success ')),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Mikael Anders')),
            DataCell(Text('21/11/22')),
            DataCell(Text(r'50$')),
            DataCell(Text('Success ')),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Mikael Anders')),
            DataCell(Text('21/11/22')),
            DataCell(Text(r'50$')),
            DataCell(Text('Success ')),
          ],
        ),
      ],
    );
  }
}
