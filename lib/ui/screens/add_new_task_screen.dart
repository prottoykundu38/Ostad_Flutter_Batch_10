import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  static const String name = 'add-new-task-screen';

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _subjectTEcontroller = TextEditingController();
  final TextEditingController _descriptionTEcontroller =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80,
                ),
                Text(
                  "Add New Task",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 24,
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter Your Title';
                    }
                    return null;
                  },
                  controller: _subjectTEcontroller,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Subject',
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter Your Title';
                    }
                    return null;
                  },
                  controller: _descriptionTEcontroller,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Description',
                  ),
                  maxLines: 5,
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: _onTapSubmitButton,
                  child: Icon(Icons.arrow_circle_right_rounded),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSubmitButton() {
    if (_formKey.currentState!.validate()) {}
    Navigator.pop(context);
  }

  void _dispose() {
    _subjectTEcontroller.dispose();
    _descriptionTEcontroller.dispose();
    super.dispose();
  }
}
