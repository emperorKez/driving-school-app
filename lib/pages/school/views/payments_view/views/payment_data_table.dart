import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/pages/school/bloc/payment/payment_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/school_bloc/school_bloc.dart';
import 'package:korbil_mobile/theme/theme.dart';

class PaymentDataTable extends StatelessWidget {
  const PaymentDataTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentBloc, PaymentState>(
      builder: (context, state) {
        if (state is PaymentInitial){
          context.read<PaymentBloc>().add(GetPaymentHistory(schoolId: context.read<SchoolBloc>().state.schoolInfo!.id));
        }
        if (state is! PaymentLoaded) {
          return kLoadingWidget(context);
        } else {
          if (state.paymentHistory!.isEmpty) {
            return const Center(
              child: Text('No Payment History Yet!'),
            );
          } else {
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
              rows: List.generate(
                state.paymentHistory!.length,
                (index) => DataRow(
                  cells: [
                    DataCell(
                      Text(
                        '${state.paymentHistory![index].student.firstName} ${state.paymentHistory![index].student.lastName}',
                      ),
                    ),
                    DataCell(
                      Text(
                        DateFormat.yMd().format(
                          state.paymentHistory![index].payment.date,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        '\$${state.paymentHistory![index].payment.amount}',
                      ),
                    ),
                    DataCell(
                      Text(
                        state.paymentHistory![index].payment.status,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        }
      },
    );
  }
}
