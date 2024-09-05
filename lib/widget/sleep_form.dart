import 'package:flutter/material.dart';
import 'package:meditor/models/sleep_exercise_model.dart';
import 'package:meditor/provider/custom_data-provider.dart';
import 'package:meditor/utils/colors.dart';
import 'package:meditor/widget/reuseble_widget/text_input.dart';
import 'package:provider/provider.dart';

class SleepForm extends StatefulWidget {
  const SleepForm({super.key});

  @override
  State<SleepForm> createState() => _SleepFormState();
}

class _SleepFormState extends State<SleepForm> {
  final _formKey = GlobalKey<FormState>();

  String _category = '';
  String _name = '';
  String _description = '';
  int _duration = 0;
  String _audioUrl = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              const Text(
                'Create a new Sleep Exercise',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryGreen,
                ),
              ),
              const SizedBox(height: 15),
              CustomtextFormFeild(
                labelText: 'Category',
                hintText: 'Category',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a category';
                  }
                  return null;
                },
                onSaved: (value) {
                  _category = value!;
                },
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 15),
              CustomtextFormFeild(
                labelText: 'Name',
                hintText: 'Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a category';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 15),
              CustomtextFormFeild(
                labelText: 'Description',
                hintText: 'Description',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a category';
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value!;
                },
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 15),
              CustomtextFormFeild(
                labelText: 'Duration',
                hintText: 'Duration',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a category';
                  }
                  return null;
                },
                onSaved: (value) {
                  _duration = int.parse(value!);
                },
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 15),
              CustomtextFormFeild(
                labelText: 'Audio Url',
                hintText: 'Audio Url',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a category';
                  }
                  return null;
                },
                onSaved: (value) {
                  _audioUrl = value!;
                },
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      //todo ............
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        final sleepExercise = SleepExercise(
                          category: _category,
                          name: _name,
                          description: _description,
                          duration: _duration,
                          audioUrl: _audioUrl,
                        );

                        _formKey.currentState!.reset();
                        _category = "";
                        _name = "";
                        _description = "";
                        _duration = 0;
                        _audioUrl = "";
                        Provider.of<CustomDataPrvider>(context, listen: false)
                            .addSleepExercise(sleepExercise, context);
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        AppColors.primaryGreen,
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
