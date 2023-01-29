import 'package:flutter/material.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? key}) : super(key: key);

  @override
  CreateScreenState createState() => CreateScreenState();
}

class CreateScreenState extends State<CreateScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CreateAppletForm(),
      ),
    );
  }
}

// Create a Form widget.
class CreateAppletForm extends StatefulWidget {
  const CreateAppletForm({super.key});

  @override
  CreateAppletFormState createState() {
    return CreateAppletFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class CreateAppletFormState extends State<CreateAppletForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  String? _appletNameText;
  String? _selectedInputType;
  String? _selectedOutputType;
  final List<String> _inputTypes = ['Text', 'Image', 'Audio'];
  final List<String> _outputTypes = ['Text', 'Image', 'Audio'];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              hintText: 'Name your app',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter app name';
              }
              return null;
            },
          ),
          DropdownButtonFormField(
            value: _selectedInputType,
            hint: const Text(
              'Choose an input type',
            ),
            isExpanded: true,
            onChanged: (String? value) {
              setState(() {
                _selectedInputType = value;
              });
            },
            onSaved: (value) {
              setState(() {
                _selectedInputType = value;
              });
            },
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Please choose an option";
              } else {
                return null;
              }
            },
            items: _inputTypes.map((String val) {
              return DropdownMenuItem(
                value: val,
                child: Text(
                  val,
                ),
              );
            }).toList(),
          ),
          DropdownButtonFormField(
            value: _selectedOutputType,
            hint: const Text(
              'Choose an output type',
            ),
            isExpanded: true,
            onChanged: (String? value) {
              setState(() {
                _selectedOutputType = value;
              });
            },
            onSaved: (value) {
              setState(() {
                _selectedOutputType = value;
              });
            },
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Please choose an option";
              } else {
                return null;
              }
            },
            items: _outputTypes.map((String val) {
              return DropdownMenuItem(
                value: val,
                child: Text(
                  val,
                ),
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Creating your app')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
