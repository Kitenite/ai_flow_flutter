import 'package:ai_flow/components/applet_input_card.dart';
import 'package:ai_flow/main.dart';
import 'package:ai_flow/models/applet.dart';
import 'package:ai_flow/run_screen/run_screen.dart';
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
  final _nameController = TextEditingController();
  final _promptController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _inputPromptController = TextEditingController();
  final _outputPromptController = TextEditingController();

  InputType? _selectedInputType;
  OutputType? _selectedOutputType;

  var _promptFieldVisible = false;
  var _inputFieldVisible = false;
  var _outputFieldVisible = false;
  var _descriptionFormFieldVisible = false;
  var _inputPromptFieldVisible = false;
  var _outputPromptFieldVisible = false;
  var _submitButtonVisible = false;

  @override
  void initState() {
    super.initState();
  }

  String getInputHintText() {
    switch (_selectedInputType) {
      case InputType.text:
        return "i.e. Type in your list of ingredients";
      case InputType.image:
        return "i.e. Take a picture of your ingredients";
      case InputType.audio:
        return "i.e. Read your list of ingredients out loud";
      case null:
        return "i.e. Input your list of ingredients";
    }
  }

  String getOutputHintText() {
    switch (_selectedOutputType) {
      case OutputType.text:
        return "i.e. Here's an explanation of your ingredients";
      case OutputType.image:
        return "i.e. Here's a picture illustrating what you asked for";
      case OutputType.audio:
        return "i.e. Here's an explanation of your ingredients";
      case null:
        return "i.e. Here's an explanation of your ingredients";
    }
  }

  Applet createApplet() {
    return Applet(
      prompt: _promptController.text,
      name: _nameController.text,
      inputType: _selectedInputType ?? InputType.text,
      outputType: _selectedOutputType ?? OutputType.text,
      inputPrompt: _inputPromptController.text,
      outputPrompt: _outputPromptController.text,
      description: _descriptionController.text,
    );
  }

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
                child: Column(
                  children: [
                    TextFormField(
                      autofocus: true,
                      controller: _nameController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Name your app',
                        hintText: 'i.e Vegan ingredients',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter app name';
                        }
                        setState(() {
                          _promptFieldVisible = true;
                        });
                        return null;
                      },
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          setState(() {
                            _promptFieldVisible = true;
                            _descriptionFormFieldVisible = true;
                          });
                        }
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    Visibility(
                      visible: _descriptionFormFieldVisible,
                      child: TextFormField(
                        controller: _descriptionController,
                        maxLines: 3,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText:
                                'Optional: Describe your app to the user',
                            hintText:
                                "i.e. This app takes a list of ingredients and tells you if its vegan"),
                      ),
                    ),
                  ],
                ),
              ),
              AppletInputCard(
                visible: _promptFieldVisible,
                title: "Premade prompt",
                child: TextFormField(
                  controller: _promptController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'The prompt that will be sent to GPT',
                    hintText:
                        "i.e. Look at this list of recipes. For each ingredient, explain the ingredients in 1-2 sentences and say if they are vegan. Then at the end, say whether all the ingredients are vegan or not vegan.",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a prompt';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        _inputFieldVisible = true;
                      });
                    }
                  },
                ),
              ),
              AppletInputCard(
                visible: _inputFieldVisible,
                title: "Input type",
                child: Column(
                  children: [
                    DropdownButtonFormField(
                      value: _selectedInputType,
                      hint: const Text(
                        'Type of input your app receives',
                      ),
                      isExpanded: true,
                      onChanged: (InputType? inputType) {
                        setState(() {
                          _selectedInputType = inputType;
                          _outputFieldVisible = true;
                          _inputPromptFieldVisible = true;
                        });
                      },
                      onSaved: (value) {
                        setState(() {
                          _selectedInputType = value;
                        });
                      },
                      validator: (InputType? inputType) {
                        if (inputType == null) {
                          return "Please choose an option";
                        } else {
                          return null;
                        }
                      },
                      items: InputType.values.map((InputType inputType) {
                        return DropdownMenuItem(
                          value: inputType,
                          child: Text(
                            inputType.name,
                          ),
                        );
                      }).toList(),
                    ),
                    Visibility(
                      visible: _inputPromptFieldVisible,
                      child: TextFormField(
                        controller: _inputPromptController,
                        maxLines: 2,
                        decoration: InputDecoration(
                          border: const UnderlineInputBorder(),
                          labelText: 'Optional: Tell your user what to input',
                          hintText: getInputHintText(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AppletInputCard(
                visible: _outputFieldVisible,
                title: "Output type",
                child: Column(
                  children: [
                    DropdownButtonFormField(
                      value: _selectedOutputType,
                      hint: const Text(
                        'Choose an output type',
                      ),
                      isExpanded: true,
                      onChanged: (OutputType? outputType) {
                        setState(() {
                          _selectedOutputType = outputType;
                          _submitButtonVisible = true;
                          _outputPromptFieldVisible = true;
                        });
                      },
                      onSaved: (value) {
                        setState(() {
                          _selectedOutputType = value;
                        });
                      },
                      validator: (OutputType? outputType) {
                        if (outputType == null) {
                          return "Please choose an option";
                        } else {
                          return null;
                        }
                      },
                      items: OutputType.values.map((OutputType outputType) {
                        return DropdownMenuItem(
                          value: outputType,
                          child: Text(
                            outputType.name,
                          ),
                        );
                      }).toList(),
                    ),
                    Visibility(
                      visible: _outputPromptFieldVisible,
                      child: TextFormField(
                        controller: _outputPromptController,
                        maxLines: 2,
                        decoration: InputDecoration(
                          border: const UnderlineInputBorder(),
                          labelText: 'Optional: Explain your app\'s result',
                          hintText: getOutputHintText(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                  ),
                  const Spacer(),
                  Visibility(
                    visible: _submitButtonVisible,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            // TODO: Push to RunScreen with the created applet
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => RunScreen(
                                  applet: createApplet(),
                                  originRoute: createRoute,
                                ),
                              ),
                            );
                          }
                        },
                        child: const Text('Test'),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Visibility(
                    visible: _submitButtonVisible,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            // Create app with all that information here
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Creating your app'),
                              ),
                            );
                          }
                        },
                        child: const Text('Submit'),
                      ),
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
