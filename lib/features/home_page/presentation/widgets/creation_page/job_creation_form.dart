import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebaseblocryze/features/home_page/presentation/blocs/jobs_bloc.dart';
import 'package:firebaseblocryze/features/home_page/presentation/cubit/job_form_cubit.dart';
import 'package:firebaseblocryze/features/home_page/utils/job_post_strings.dart';
import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';
import 'package:firebaseblocryze/uikit/widgets/ryze_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class JobForm extends StatefulWidget {
  @override
  _JobFormState createState() => _JobFormState();
}

class _JobFormState extends State<JobForm> {
  FocusNode titleNode;
  FocusNode descriptionNode;
  FocusNode hourRateNode;
  FocusNode cityNode;
  FocusNode submitNode;
  TextEditingController titleController;
  TextEditingController descriptionController;
  TextEditingController cityController;
  TextEditingController hourRateController;

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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _JobPhoto(),
            _TitleInput(),
            _DescriptionInput(),
            _CityInput(),
            _HourRateInput(),
            const SizedBox(height: 8.0),
            _JobDisclaimer(),
            const SizedBox(height: 24.0),
            RyzePrimaryButton(
                title: JobPostStrings.previewJobBtn,
                action: () => Navigator.pop(context),
                isAffirmative: false),
            const SizedBox(height: 12.0),
            _CreateJobButton(),
          ],
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
}

class _TitleInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobFormCubit, JobFormState>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: TextFormField(
            autofocus: false,
            maxLength: 50,
            keyboardType: TextInputType.text,
            enabled: true,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: 'Title',
              hintText: 'Enter Title',
              errorText: state.title.invalid
                  ? JobPostStrings.jobFormInvalidTitle
                  : null,
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5, color: Color(0xFF3229bf)),
              ),
            ),
            onChanged: (title) {
              context.read<JobFormCubit>().titleChanged(title);
            }),
      );
    });
  }
}

class _DescriptionInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobFormCubit, JobFormState>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: TextFormField(
          autofocus: false,
          maxLength: 50,
          keyboardType: TextInputType.text,
          enabled: true,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: 'Description',
            hintText: 'Enter Description',
            errorText: state.description.invalid
                ? JobPostStrings.jobFormInvalidDescription
                : null,
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Color(0xFF3229bf)),
            ),
          ),
          onChanged: (description) =>
              context.read<JobFormCubit>().descriptionChanged(description),
        ),
      );
    });
  }
}

class _CityInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobFormCubit, JobFormState>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: TextFormField(
          autofocus: false,
          maxLength: 15,
          keyboardType: TextInputType.text,
          enabled: true,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: 'City',
            hintText: 'Enter City',
            errorText:
                state.city.invalid ? JobPostStrings.jobFormInvalidCity : null,
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Color(0xFF3229bf)),
            ),
          ),
          onChanged: (city) => context.read<JobFormCubit>().cityChanged(city),
        ),
      );
    });
  }
}

class _HourRateInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobFormCubit, JobFormState>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: TextFormField(
          autofocus: false,
          maxLength: 4,
          keyboardType: TextInputType.number,
          enabled: true,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: 'Hour Rate',
            hintText: 'Enter Hour Rate',
            errorText: state.hourRate.invalid
                ? JobPostStrings.jobFormInvalidHourRate
                : null,
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Color(0xFF3229bf)),
            ),
          ),
          onChanged: (hourRate) =>
              context.read<JobFormCubit>().hourRateChanged(hourRate),
        ),
      );
    });
  }
}

class _CreateJobButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final JobsBloc _jobsBloc = BlocProvider.of<JobsBloc>(context);
    return BlocBuilder<JobFormCubit, JobFormState>(
      buildWhen: (previous, current) =>
          previous.status != current.status ||
          previous.isDisclaimerAccepted != current.isDisclaimerAccepted,
      builder: (context, formState) {
        return BlocBuilder<JobsBloc, JobsState>(
          builder: (context, jobState) {
            return RyzePrimaryButton(
              title: JobPostStrings.createJobBtn,
              enabled: (formState.status.isValidated &&
                  formState.isDisclaimerAccepted),
              action: () {
                formState.image == null
                    ? _showConfirmationDialog(context, formState)
                    : _createJobPost(context, formState);
              },
              isAffirmative: true,
              isLoading: jobState is AddJobInProgress,
            );
          },
        );
      },
    );
  }

  _createJobPost(BuildContext context, JobFormState formState) {
    final _jobsBloc = context.read<JobsBloc>();
    _jobsBloc.add(AddJobPost(
        JobPost(
          jobID: Uuid().v4(),
          title: formState.title.value,
          description: formState.description.value,
          city: formState.city.value,
          imageUrl: null,
          hourRate: '${formState.hourRate.value}€ / h',
          isRemote: false,
          slotsAvailable: 1,
          languages: ['Portuguese'],
        ),
        formState.image));
  }

  _showConfirmationDialog(BuildContext context, JobFormState formState) {
    AwesomeDialog(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      context: context,
      width: 350,
      buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
      headerAnimationLoop: false,
      animType: AnimType.BOTTOMSLIDE,
      dialogType: DialogType.NO_HEADER,
      title: 'Confirmation',
      desc: JobPostStrings.confirmCreationDialogText,
      btnCancelText: 'Go Back',
      btnCancelColor: Theme.of(context).accentColor,
      btnOkText: 'Continue',
      btnOkColor: Colors.black,
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        _createJobPost(context, formState);
      },
    )..show();
  }
}

class _JobDisclaimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobFormCubit, JobFormState>(
      builder: (context, state) {
        return CheckboxListTile(
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
            value: state.isDisclaimerAccepted,
            activeColor: Color(0xFF3229bf),
            onChanged: (bool checkBoxValue) {
              context
                  .read<JobFormCubit>()
                  .disclaimerCheckboxChanged(checkBoxValue);
            });
      },
    );
  }
}

class _JobPhoto extends StatelessWidget {
  final photoHeightWidth = 250.0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobFormCubit, JobFormState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: InkWell(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: state.image != null
                    ? Image.file(
                        state.image,
                        width: photoHeightWidth,
                        height: photoHeightWidth,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        JobPostStrings.imagePlaceholder,
                        width: photoHeightWidth,
                        height: photoHeightWidth,
                        fit: BoxFit.cover,
                      )),
            onTap: () async => await getImage(context),
          ),
        );
      },
    );
  }

  Future getImage(BuildContext context) async {
    ImagePicker picker = ImagePicker();
    PickedFile pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final _image = File(pickedFile.path);
      context.read<JobFormCubit>().jobPictureSelected(_image);
    }
  }
}
