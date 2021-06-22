import 'package:firebaseblocryze/features/home_page/utils/job_post_strings.dart';
import 'package:flutter/material.dart';

class DateOfBirthPicker extends StatefulWidget {
  @override
  _DateOfBirthPickerState createState() => _DateOfBirthPickerState();
}

class _DateOfBirthPickerState extends State<DateOfBirthPicker> {
  String birthDateInString = 'Eg: 01/01/2000';
  TextEditingController dateController;
  DateTime birthDate;
  bool isDateSelected = false;

  @override
  void initState() {
    super.initState();
    dateController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    dateController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: () async {
          final initialDate = DateTime.now();
          final datePick = await showDatePicker(
              context: context,
              initialDate: initialDate,
              firstDate: DateTime(1940),
              lastDate: DateTime(initialDate.year + 1));
          if (datePick != null && datePick != birthDate) {
            setState(
              () {
                birthDate = datePick;
                isDateSelected = true;
                birthDateInString =
                    '${birthDate.day}/${birthDate.month}/${birthDate.year}';// 08/14/2019
                dateController.text = birthDateInString;
              },
            );
          }
        },
        child: Row(
          children: [
            Image.asset(JobPostStrings.calendarIcon, width: 34.0, height: 34.0),
            const SizedBox(width: 10.0),
            Expanded(
              child: TextFormField(
                autofocus: false,
                minLines: 1,
                maxLines: 1,
                maxLengthEnforced: true,
                keyboardType: TextInputType.number,
                enabled: true,
                initialValue: birthDateInString,
                controller: dateController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Date of Birth',
                  labelStyle: TextStyle(height:0),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).accentColor),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).accentColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
