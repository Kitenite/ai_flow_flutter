import 'package:ai_flow/create_screen/create_applet_form.dart';
import 'package:flutter/material.dart';

class RunScreen extends StatefulWidget {
  const RunScreen({
    Key? key,
    required this.applet,
  }) : super(key: key);

  final Applet applet;

  @override
  RunScreenState createState() => RunScreenState();
}

class RunScreenState extends State<RunScreen> {
  Widget getInputScreen(Applet applet) {
    switch (applet.inputType) {
      case InputType.text:
        return TextInputScreen(applet: applet);
      case InputType.image:
        return TextInputScreen(applet: applet);
      case InputType.audio:
        return TextInputScreen(applet: applet);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: getInputScreen(widget.applet),
      ),
    );
  }
}

class TextInputScreen extends StatefulWidget {
  const TextInputScreen({
    Key? key,
    required this.applet,
    this.inputText = "",
  }) : super(key: key);

  final Applet applet;
  final String inputText;

  @override
  State<TextInputScreen> createState() => _TextInputScreenState();
}

class _TextInputScreenState extends State<TextInputScreen> {
  var _submitButtonVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.applet.name,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            widget.applet.description,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
        AppletInputCard(
          title: '${widget.applet.inputPrompt}:',
          child: TextFormField(
            autofocus: true,
            autocorrect: true,
            maxLines: 10,
            onChanged: (value) {
              if (value.isNotEmpty) {
                setState(() {
                  _submitButtonVisible = true;
                });
              }
            },
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
              maintainAnimation: true,
              maintainState: true,
              maintainSize: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    print("Submit");
                  },
                  child: const Text('Submit'),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}

class Applet {
  final String prompt;
  final String name;
  final InputType inputType;
  final OutputType outputType;

  // Optional
  final String description;
  final String inputPrompt;

  Applet({
    required this.prompt,
    required this.name,
    required this.inputType,
    required this.outputType,
    this.description = "",
    this.inputPrompt = "",
  });
}

enum InputType {
  text,
  image,
  audio,
}

enum OutputType {
  text,
  image,
  audio,
}
