import 'package:ai_flow/components/common/applet_input_card.dart';
import 'package:ai_flow/components/run_screen/run_screen.dart';
import 'package:ai_flow/models/applet.dart';
import 'package:ai_flow/models/user.dart';
import 'package:ai_flow/resources/constants.dart';
import 'package:ai_flow/sao/applets.dart';
import 'package:ai_flow/sao/collections.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  var _promptFieldVisible = false;
  var _descriptionFormFieldVisible = false;
  var _inputPromptFieldVisible = false;
  var _submitButtonVisible = false;

  @override
  void initState() {
    super.initState();
  }

  Applet createApplet() {
    return Applet(
      prompt: _promptController.text,
      name: _nameController.text,
      inputPrompt: _inputPromptController.text,
      description: _descriptionController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    User user = context.watch<User>();
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
                        hintText: 'e.g. Vegan ingredients',
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
                        maxLines: null,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText:
                                'Optional: Describe your app to the user',
                            hintText:
                                "e.g. Tells you if a list of ingredients is vegan"),
                      ),
                    ),
                  ],
                ),
              ),
              AppletInputCard(
                visible: _promptFieldVisible,
                title: "AI Prompt",
                child: TextFormField(
                  controller: _promptController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'The prompt that will be sent to GPT',
                    hintText:
                        "e.g. Look at this list of recipes. For each ingredient, explain the ingredients in 1-2 sentences and say if they are vegan. Then at the end, say whether all the ingredients are vegan or not vegan.",
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
                        _inputPromptFieldVisible = true;
                        _submitButtonVisible = true;
                      });
                    }
                  },
                ),
              ),
              AppletInputCard(
                visible: _inputPromptFieldVisible,
                title: "Input description",
                child: TextFormField(
                  controller: _inputPromptController,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText:
                        'Optional: Explain what the input should include',
                    hintText: 'e.g. Input your list of ingredients',
                  ),
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
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => RunScreen(
                                  applet: createApplet(),
                                  originRoute: Constants.createRoute,
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
                            Applet newApplet = createApplet();
                            AppletDataAccessor.createNewApplet(newApplet);
                            CollectionDataAccessor.addAppletToCollection(
                              // TODO: Instead of first, should check for personal collection type instead.
                              user.collectionIds.first,
                              newApplet.id,
                            );
                            Navigator.pop(context);
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
