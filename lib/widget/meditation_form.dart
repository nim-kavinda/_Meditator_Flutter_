import 'package:flutter/material.dart';
import 'package:meditor/utils/colors.dart';
import 'package:meditor/widget/reuseble_widget/text_input.dart';

class MeditationForm extends StatefulWidget {
  const MeditationForm({super.key});

  @override
  State<MeditationForm> createState() => _MeditationFormState();
}

class _MeditationFormState extends State<MeditationForm> {
  final _formKey = GlobalKey<FormState>();

  String _category = '';
  String _name = '';
  String _description = '';
  int _duration = 0;
  String _audioUrl = '';
  String _videoUrl = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Create a new meditation',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryGreen,
                ),
              ),
              SizedBox(
                height: 12,
              ),
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
              SizedBox(
                height: 12,
              ),
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
              SizedBox(
                height: 12,
              ),
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
              SizedBox(
                height: 12,
              ),
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
              SizedBox(
                height: 12,
              ),
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
              SizedBox(
                height: 12,
              ),
              CustomtextFormFeild(
                labelText: 'Video Url',
                hintText: 'Video Url',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a category';
                  }
                  return null;
                },
                onSaved: (value) {
                  _videoUrl = value!;
                },
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 12,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      //todo ............
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
