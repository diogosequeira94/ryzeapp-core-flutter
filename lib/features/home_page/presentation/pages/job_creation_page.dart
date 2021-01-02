import 'package:firebaseblocryze/features/home_page/presentation/blocs/jobs_bloc.dart';
import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    _jobsBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Add Job',
          style: TextStyle(color: Colors.black),
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
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset('assets/ryze-app-logo.jpg',
                          width: 200, height: 200)),
                ),
                _buildInputSection(titleNode, true, 'Title', 'Enter title', 50,
                    titleController, descriptionNode),
                _buildInputSection(
                    descriptionNode,
                    false,
                    'Description',
                    'Enter description',
                    50,
                    descriptionController,
                    cityNode),
                _buildInputSection(cityNode, false, 'City',
                    'Enter city', 20, cityController, hourRateNode),
                _buildInputSection(hourRateNode, false, 'Hour Rate',
                    'Enter hour rate', 3, hourRateController, submitNode, true),
                SizedBox(height: 8.0),
                CheckboxListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 14.0),
                    child: Text('Terms of Consent', style: TextStyle(
                      fontWeight: FontWeight.w600
                    ),),
                  ),
                  subtitle: Text('By submitting this job, you agree to share all the information with RyzeApp and its users.'),
                  controlAffinity: ListTileControlAffinity.platform,
                  contentPadding: EdgeInsets.all(0.0),
                  value: _isChecked,
                  activeColor: Color(0xFF3229bf),
                  onChanged: (bool value){
                    setState(() {
                      _isChecked = value;
                    });
                  },
                ),
                SizedBox(height: 24.0),
                InkWell(
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF3229bf),
                            Color(0xFF4568ff),
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50.0))),
                    child: Center(
                      child: const Text(
                        'Create Job',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  onTap: () {
                    _jobsBloc.add(
                        AddJobPost(
                            JobPost(
                      title: titleController.text == '' ? 'No title job' : titleController.text,
                      description: descriptionController.text == '' ? 'No description' : descriptionController.text,
                      city: cityController.text == '' ? 'Unknown location' : cityController.text,
                      imageUrl: null,
                      hourRate: hourRateController.text == '' ? 'Volunteer job' : '${hourRateController.text} / h',
                      isRemote: false,
                      slotsAvailable: 1,
                      languages: ['Portuguese'],
                    )));
                  },
                ),
                SizedBox(height: 12.0),
                InkWell(
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF0b0b0d),
                            Color(0xFF1d1e22),
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50.0))),
                    child: Center(
                      child: const Text(
                        'Preview Post',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputSection(FocusNode focusNode, bool autoFocus, String label,
      String hint, int length, TextEditingController controller,
      [FocusNode nextFocus, bool numeric]) {
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
}
