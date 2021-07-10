import 'package:firebaseblocryze/features/home_page/presentation/cubit/job_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobCategoryPicker extends StatefulWidget {
  @override
  _JobCategoryPickerState createState() => _JobCategoryPickerState();
}

class _JobCategoryPickerState extends State<JobCategoryPicker> {
  final TextEditingController _controller = new TextEditingController();
  var jobCategoryTitles = [
    'Bar',
    'Chef',
    'Hotel',
    'IT',
    'Remote',
    'Support',
    'Other',
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobFormCubit, JobFormState>(builder: (context, state) {
      return Center(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                      enableInteractiveSelection: false,
                      readOnly: true,
                      controller: _controller,
                      decoration: InputDecoration(
                        labelText: 'Category',
                        hintText: 'Select a Category',
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.5, color: Color(0xFF3229bf)),
                        ),
                      ),
                    )),
                    PopupMenuButton(
                      padding: const EdgeInsets.all(0),
                      icon: const Icon(Icons.arrow_drop_down),
                      onSelected: (String value) {
                        context.read<JobFormCubit>().categorySelected(value);
                        _controller.text = value;
                      },
                      itemBuilder: (BuildContext context) {
                        return jobCategoryTitles
                            .map<PopupMenuItem<String>>((value) {
                          return PopupMenuItem(
                              child: Text(value), value: value);
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
    });
  }
}
