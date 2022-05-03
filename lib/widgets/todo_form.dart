import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangeTitle;
  final ValueChanged<String> onChangeDescription;
  final VoidCallback onSavedTodo;

  const TodoFormWidget({
    Key? key,
    this.title = '',
    this.description = '',
    required this.onChangeTitle,
    required this.onChangeDescription,
    required this.onSavedTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildTitleTextFormField(),
          buildDescriptionTextFormField(),
          const SizedBox(height: 8,),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onSavedTodo,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
              child: const Text('Save'),
            ),
          )
        ],
      ),
    );
  }

  TextFormField buildDescriptionTextFormField() {
    return TextFormField(
      maxLines: 3,
      initialValue: description,
      onChanged: onChangeDescription,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Description',
      ),
    );
  }

  TextFormField buildTitleTextFormField() {
    return TextFormField(
      initialValue: title,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'The title can not be empty';
        }
        return null;
      },
      onChanged: onChangeTitle,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'title',
      ),
      maxLines: 1,
    );
  }
}
