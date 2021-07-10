import 'package:firebaseblocryze/features/account/presentation/widgets/wallet/operation_item.dart';
import 'package:flutter/material.dart';

class OperationsSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var operations = _buildOperationsList();
    return Container(
      height: 120,
      width: double.infinity,
      alignment: Alignment.center,
      child: ListView.builder(
          itemCount: operations.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return operations[index];
          }),
    );
  }

  List<OperationItem> _buildOperationsList() {
    List<OperationItem> _operations = [
      OperationItem(
          title: 'CashOut',
          operationIcon: Icon(Icons.monetization_on_outlined,
              size: 28.0, color: Colors.white)),
      OperationItem(
          title: 'Invoices',
          operationIcon: Icon(Icons.insert_drive_file_outlined,
              size: 28.0, color: Colors.white)),
      OperationItem(
          title: 'Cards',
          operationIcon:
              Icon(Icons.credit_card_rounded, size: 28.0, color: Colors.white)),
      OperationItem(
        title: 'Transfer',
        operationIcon: Icon(Icons.transfer_within_a_station_outlined,
            size: 28.0, color: Colors.white),
        rightPadding: 0.0,
      ),
    ];
    return _operations;
  }
}
