import 'package:ai_flow/components/applet_input_card.dart';
import 'package:ai_flow/main.dart';
import 'package:ai_flow/models/applet.dart';
import 'package:flutter/material.dart';

class TextOutputScreen extends StatefulWidget {
  const TextOutputScreen({
    Key? key,
    required this.applet,
    required this.resultText,
    this.inputText = "",
  }) : super(key: key);

  final Applet applet;
  final String resultText;
  final String inputText;

  @override
  State<TextOutputScreen> createState() => _TextOutputScreenState();
}

class _TextOutputScreenState extends State<TextOutputScreen> {
  final List<bool> _expandedListItems = [false];

  Widget getInputView() {
    if (widget.applet.showPrompt && widget.inputText.isNotEmpty) {
      return ExpansionPanelList(
        elevation: 0,
        expandedHeaderPadding: const EdgeInsets.all(10),
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _expandedListItems[index] = !isExpanded;
          });
        },
        children: [
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return const ListTile(
                title: Text("Show input"),
              );
            },
            body: ListTile(
              title: Text(widget.inputText),
            ),
            isExpanded: _expandedListItems[0],
          ),
        ],
      );
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Result",
          style: TextStyle(
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
          child: Text(widget.resultText),
        ),
        getInputView(),
        Row(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName(homeRoute));
                },
                child: const Text('Finish'),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Retry'),
              ),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}