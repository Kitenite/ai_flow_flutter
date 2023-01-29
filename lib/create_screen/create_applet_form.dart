import 'package:flutter/material.dart';

class CreateAppletForm extends StatefulWidget {
  const CreateAppletForm({super.key});

  @override
  CreateAppletFormState createState() {
    return CreateAppletFormState();
  }
}

class CreateAppletFormState extends State<CreateAppletForm> {
  final _formKey = GlobalKey<FormState>();

  final _appletNameController = TextEditingController();
  final _appletPromptController = TextEditingController();
  String? _selectedInputType;
  String? _selectedOutputType;
  final List<String> _inputTypes = ['Text', 'Image', 'Audio'];
  final List<String> _outputTypes = ['Text', 'Image', 'Audio'];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppletInputCard(
                title: "App Name",
                child: TextFormField(
                  controller: _appletNameController,
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
              ),
              AppletInputCard(
                title: "Prompt",
                child: TextFormField(
                  controller: _appletPromptController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Add your prompt',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a prompt';
                    }
                    return null;
                  },
                ),
              ),
              AppletInputCard(
                title: "Input",
                child: DropdownButtonFormField(
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
              ),
              AppletInputCard(
                title: "Output",
                child: DropdownButtonFormField(
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
              ),
              Row(
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // Create app with all that information here
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Creating your app')),
                          );
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                  const Spacer(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AppletInputCard extends StatelessWidget {
  const AppletInputCard({Key? key, required this.title, required this.child})
      : super(key: key);

  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 2,
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(8),
            child: Column(children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              child,
            ]),
          ),
        ),
      ),
    );
  }
}
