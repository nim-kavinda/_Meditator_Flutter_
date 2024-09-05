import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meditor/models/mindfull_exercise_model.dart';
import 'package:meditor/provider/custom_data-provider.dart';
import 'package:meditor/utils/colors.dart';
import 'package:meditor/widget/reuseble_widget/text_input.dart';
import 'package:provider/provider.dart';

class MindfulForm extends StatefulWidget {
  const MindfulForm({super.key});

  @override
  State<MindfulForm> createState() => _MindfulFormState();
}

class _MindfulFormState extends State<MindfulForm> {
  final _formKey = GlobalKey<FormState>();

  String _category = "";
  String _name = "";
  String _description = "";
  List<String> _instructions = [];
  int _duration = 0;
  String _instructionsUrl = "";
  File? _imagepath;

  final ImagePicker _imagePicker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFiled = await _imagePicker.pickImage(source: source);

    setState(() {
      if (pickedFiled != null) {
        _imagepath = File(pickedFiled.path);
      } else {
        print("No image selected");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Create a new mindfull exercise',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryGreen,
          ),
        ),
        const SizedBox(height: 20),
        Form(
          key: _formKey,
          child: Column(
            children: [
              if (_imagepath != null)
                Image.file(
                  _imagepath!,
                  height: 200,
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () => _pickImage(ImageSource.camera),
                    child: const Text('Pick from Camera'),
                  ),
                  ElevatedButton(
                    onPressed: () => _pickImage(ImageSource.gallery),
                    child: const Text('Pick from Gallery'),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
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
                height: 8,
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
                height: 8,
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
                height: 8,
              ),
              CustomtextFormFeild(
                labelText: 'Instruction',
                hintText: 'Instruction',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a category';
                  }
                  return null;
                },
                onSaved: (value) {
                  _instructions = value!.split(' , ');
                },
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 8,
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
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 8,
              ),
              CustomtextFormFeild(
                labelText: 'InstructionUrl',
                hintText: 'InstructionUrl',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a category';
                  }
                  return null;
                },
                onSaved: (value) {
                  _instructionsUrl = value!;
                },
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      //todo ............
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        final imagepathString = _imagepath?.path ?? "";

                        final mindfullnesExercise = MindfullnessExercise(
                          category: _category,
                          name: _name,
                          description: _description,
                          instruction: _instructions,
                          duration: _duration,
                          instructionUrl: _instructionsUrl,
                          imagePath: imagepathString,
                        );
                        _formKey.currentState!.reset();
                        _category = "";
                        _name = "";
                        _description = "";
                        _instructions = [];
                        _instructionsUrl = "";
                        _imagepath = null;
                        Provider.of<CustomDataPrvider>(context, listen: false)
                            .addMindfullExercise(mindfullnesExercise, context);
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
