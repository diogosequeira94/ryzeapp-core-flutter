import 'package:firebaseblocryze/features/account/presentation/widgets/operation_item.dart';
import 'package:flutter/material.dart';

class OperationsSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var operations = _buildOperationsList();
    return Container(
      height: 120,
      child: ListView.builder(
          itemCount: operations.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return operations[index];
          }),
    );
  }

  List<OperationItem> _buildOperationsList() {
    List<OperationItem> _operations = [
      OperationItem(
          title: 'Withdraw', operationIcon: Icon(Icons.monetization_on_outlined)),
      OperationItem(title: 'Deposits', operationIcon: Icon(Icons.shopping_bag_outlined)),
      OperationItem(
          title: 'Transfer',
          operationIcon: Icon(Icons.transfer_within_a_station_outlined)),
    ];
    return _operations;
  }
}
