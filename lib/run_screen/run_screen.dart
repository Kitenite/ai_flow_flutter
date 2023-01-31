import 'package:ai_flow/models/applet.dart';
import 'package:ai_flow/run_screen/text_input_screen.dart';
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
