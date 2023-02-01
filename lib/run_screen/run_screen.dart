import 'package:ai_flow/models/applet.dart';
import 'package:ai_flow/run_screen/text_input_screen.dart';
import 'package:ai_flow/run_screen/text_output_screen.dart';
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
  void textInputCallback(String inputText) {
    // TODO: Call server and wait for result using FutureBuilder

    // TODO: Display result
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Scaffold(
          body: SafeArea(
            child: getOutputScreen(result: "Mock result", inputText: inputText),
          ),
        ),
      ),
    );
  }

  Widget getOutputScreen({
    String result = "",
    String inputText = "",
  }) {
    switch (widget.applet.outputType) {
      case OutputType.text:
        return TextOutputScreen(
          applet: widget.applet,
          resultText: result,
          inputText: inputText,
        );
      case OutputType.image:
        return TextOutputScreen(
          applet: widget.applet,
          resultText: result,
          inputText: inputText,
        );
      case OutputType.audio:
        return TextOutputScreen(
          applet: widget.applet,
          resultText: result,
          inputText: inputText,
        );
    }
  }

  Widget getInputScreen() {
    switch (widget.applet.inputType) {
      case InputType.text:
        return TextInputScreen(
          applet: widget.applet,
          submitCallback: textInputCallback,
        );
      case InputType.image:
        return TextInputScreen(
          applet: widget.applet,
          submitCallback: textInputCallback,
        );
      case InputType.audio:
        return TextInputScreen(
          applet: widget.applet,
          submitCallback: textInputCallback,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: getInputScreen(),
      ),
    );
  }
}
