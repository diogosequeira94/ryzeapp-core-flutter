import 'dart:io';

import 'package:firebaseblocryze/features/home_page/presentation/blocs/jobs_bloc.dart';
import 'package:firebaseblocryze/features/home_page/utils/home_page_strings.dart';
import 'package:firebaseblocryze/features/home_page/utils/job_post_strings.dart';
import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';
import 'package:firebaseblocryze/uikit/widgets/ryze_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class JobCreation extends StatefulWidget {
  @override
  _JobCreationState createState() => _JobCreationState();
}

class _JobCreationState extends State<JobCreation> {
  FocusNode titleNode;
  FocusNode descriptionNode;
  FocusNode hourRateNode;
  FocusNode cityNode;
  FocusNode submitNode;
  TextEditingController titleController;
  TextEditingController descriptionController;
  TextEditingController cityController;
  TextEditingController hourRateController;
  JobsBloc _jobsBloc;
  bool _isChecked = false;
  File _image;

  @override
  void initState() {
    super.initState();
    titleNode = FocusNode();
    descriptionNode = FocusNode();
    cityNode = FocusNode();
    hourRateNode = FocusNode();
    submitNode = FocusNode();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    cityController = TextEditingController();
    hourRateController = TextEditingController();
    _jobsBloc = BlocProvider.of<JobsBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
    titleNode.dispose();
    descriptionNode.dispose();
    cityNode.dispose();
    hourRateNode.dispose();
    submitNode.dispose();
    titleController.dispose();
    descriptionController.dispose();
    cityController.dispose();
    hourRateController.dispose();
  }

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
                            ? Image.file(_image, width: 250, height: 250)
                            : Image.asset(JobPostStrings.imagePlaceholder,
                                width: 250, height: 250)),
                    onTap: () async => await getImage(true),
                  ),
                ),
                _buildInputSection(titleNode, false, 'Title', 'Enter title', 50,
                    titleController, descriptionNode),
                _buildInputSection(descriptionNode, false, 'Description',
                    'Enter description', 50, descriptionController, cityNode),
                _buildInputSection(cityNode, false, 'City', 'Enter city', 20,
                    cityController, hourRateNode),
                _buildInputSection(hourRateNode, false, 'Hour Rate',
                    'Enter hour rate', 6, hourRateController, submitNode, true),
                SizedBox(height: 8.0),
                CheckboxListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 14.0),
                    child: Text(
                      JobPostStrings.termsOfConsent,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  subtitle: Text(JobPostStrings.jobDisclaimer),
                  controlAffinity: ListTileControlAffinity.platform,
                  contentPadding: EdgeInsets.all(0.0),
                  value: _isChecked,
                  activeColor: Color(0xFF3229bf),
                  onChanged: (bool value) {
                    setState(() {
                      _isChecked = value;
                    });
                  },
                ),
                SizedBox(height: 24.0),
                RyzePrimaryButton(
                    title: JobPostStrings.createJobBtn,
                    action: () {
                      var uuid = Uuid();
                      _jobsBloc.add(AddJobPost(JobPost(
                        jobID: uuid.v4(),
                        title: titleController.text == ''
                            ? 'No title job'
                            : titleController.text,
                        description: descriptionController.text == ''
                            ? HomePageStrings.dummyJobDescription
                            : descriptionController.text,
                        city: cityController.text == ''
                            ? 'Unknown location'
                            : cityController.text,
                        imageUrl: null,
                        hourRate: hourRateController.text == ''
                            ? 'Volunteer job'
                            : '${hourRateController.text.toString()}€ / h',
                        isRemote: false,
                        slotsAvailable: 1,
                        languages: ['Portuguese'],
                      )));
                    },
                    isAffirmative: true),
                SizedBox(height: 12.0),
                RyzePrimaryButton(
                    title: JobPostStrings.previewJobBtn,
                    action: () => Navigator.pop(context),
                    isAffirmative: false),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputSection(FocusNode focusNode, bool autoFocus, String label,
      String hint, int length, TextEditingController controller,
      [FocusNode nextFocus, bool numeric = false]) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextFormField(
        autofocus: autoFocus,
        focusNode: focusNode,
        maxLength: length,
        controller: controller,
        keyboardType: numeric ? TextInputType.number : TextInputType.text,
        enabled: true,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 0.5, color: Color(0xFF3229bf)),
          ),
        ),
        onFieldSubmitted: (term) {
          focusNode.unfocus();
          FocusScope.of(context).requestFocus(nextFocus);
        },
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
