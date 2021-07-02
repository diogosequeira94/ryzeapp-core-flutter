import 'package:flutter/material.dart';

class PaymentTypePicker extends StatefulWidget {
  @override
  _PaymentTypePickerState createState() => _PaymentTypePickerState();
}

class _PaymentTypePickerState extends State<PaymentTypePicker> {
  final TextEditingController _controller = new TextEditingController();
  var paymentTypes = [
    'Fixed-Term',
    'Hourly',
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
              child: Row(
                children: <Widget>[
                  Expanded(child: TextField(enableInteractiveSelection: false, readOnly: true, controller: _controller, decoration: InputDecoration(
                    labelText: 'PayRate Terms',
                    hintText: 'Select a pay term.',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 0.5, color: Color(0xFF3229bf)),
                    ),
                  ),)),
                  PopupMenuButton(
                    padding: const EdgeInsets.all(0),
                    icon: const Icon(Icons.arrow_drop_down),
                    onSelected: (String value) {
                      _controller.text = value;
                    },
                    itemBuilder: (BuildContext context) {
                      return paymentTypes
                          .map<PopupMenuItem<String>>((value) {
                        return PopupMenuItem(child: Text(value), value: value);
                      }).toList();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
