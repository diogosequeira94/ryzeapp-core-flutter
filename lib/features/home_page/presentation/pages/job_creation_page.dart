import 'dart:io';
import 'package:firebaseblocryze/features/home_page/presentation/blocs/jobs_bloc.dart';
import 'package:firebaseblocryze/features/home_page/presentation/widgets/creation_page/job_creation_form.dart';
import 'package:firebaseblocryze/features/home_page/utils/job_post_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class JobCreation extends StatefulWidget {
  @override
  _JobCreationState createState() => _JobCreationState();
}

class _JobCreationState extends State<JobCreation> {
  File _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          JobPostStrings.jobCreationPageTitle,
          style: TextStyle(color: Theme.of(context).textTheme.headline6.color),
        ),
      ),
      body: BlocListener<JobsBloc, JobsState>(
        listener: (context, state) {
          print(state.toString());
          if (state is AddJobFailure) {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
            ));
          } else if (state is AddJobSuccess) {
            Scaffold.of(context).showSnackBar(SnackBar(
              duration: const Duration(milliseconds: 1500),
              content: Text('Success! Your job was created'),
            ));
            Navigator.pop(context);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: InkWell(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: _image != null
                            ? Image.file(_image, width: 250, height: 250, fit: BoxFit.cover,)
                            : Image.asset(JobPostStrings.imagePlaceholder,
                                width: 250, height: 250)),
                    onTap: () async => await getImage(true),
                  ),
                ),
                JobForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future getImage(bool gallery) async {
    ImagePicker picker = ImagePicker();
    PickedFile pickedFile;
    if (gallery) {
      pickedFile = await picker.getImage(source: ImageSource.gallery);
    } else {
      pickedFile = await picker.getImage(source: ImageSource.camera);
    }

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }
}
