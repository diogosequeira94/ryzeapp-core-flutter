import 'package:firebaseblocryze/features/account/presentation/widgets/wallet/operation_item.dart';
import 'package:flutter/material.dart';

class OperationsSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var operations = _buildOperationsList();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 3.0),
      child: Container(
        height: 120,
        child: ListView.builder(
            itemCount: operations.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return operations[index];
            }),
      ),
    );
  }

  List<OperationItem> _buildOperationsList() {
    List<OperationItem> _operations = [
      OperationItem(
          title: 'Withdraw',
          operationIcon: Icon(Icons.monetization_on_outlined, size: 28.0)),
      OperationItem(
          title: 'Invoices', operationIcon: Icon(Icons.insert_drive_file_outlined, size: 28.0,)),
      OperationItem(
          title: 'Transfer',
          operationIcon: Icon(Icons.transfer_within_a_station_outlined, size: 28.0)),
    ];
    return _operations;
  }
}
