import 'package:firebaseblocryze/features/home_page/presentation/blocs/jobs_bloc.dart';
import 'package:firebaseblocryze/features/home_page/presentation/cubit/job_form_cubit.dart';
import 'package:firebaseblocryze/features/home_page/utils/job_post_strings.dart';
import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';
import 'package:firebaseblocryze/uikit/widgets/ryze_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
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
    return Column(
      children: [
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
              errorText: state.title.invalid ? 'Title must be at least 10 characters' : null,
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
            errorText: state.description.invalid ? 'Description must be at least 25 characters' : null,
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
            errorText: state.city.invalid ? 'Invalid City' : null,
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
          maxLength: 50,
          keyboardType: TextInputType.number,
          enabled: true,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: 'Hour Rate',
            hintText: 'Enter Hour Rate',
            errorText: state.hourRate.invalid ? 'Invalid Hour Rate' : null,
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
      buildWhen: (previous, current) => previous.status != current.status || previous.isDisclaimerAccepted != current.isDisclaimerAccepted,
      builder: (context, state) {
        return RyzePrimaryButton(
          title: JobPostStrings.createJobBtn,
          enabled: (state.status.isValidated && state.isDisclaimerAccepted),
          action: () {
            _jobsBloc.add(AddJobPost(JobPost(
              jobID: Uuid().v4(),
              title: state.title.value,
              description: state.description.value,
              city: state.city.value,
              imageUrl: null,
              hourRate: '${state.hourRate.value}€ / h',
              isRemote: false,
              slotsAvailable: 1,
              languages: ['Portuguese'],
            )));
          },
          isAffirmative: true,
          isLoading: state.status.isSubmissionInProgress,
        );
      },
    );
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
