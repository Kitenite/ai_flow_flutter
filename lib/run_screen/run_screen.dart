import 'package:flutter/material.dart';

class RunScreen extends StatefulWidget {
  const RunScreen({Key? key, required this.applet}) : super(key: key);

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
    super.key,
    required applet,
    required inputText,
  });

  @override
  State<TextInputScreen> createState() => _TextInputScreenState();
}

class _TextInputScreenState extends State<TextInputScreen> {
  @override
  Widget build(BuildContext context) {
    return const Text("Input baby");
  }
}

class Applet {
  final String prompt;
  final String name;
  final String description;
  final InputType inputType;
  final OutputType outputType;

  Applet({
    required this.prompt,
    required this.name,
    required this.description,
    required this.inputType,
    required this.outputType,
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
