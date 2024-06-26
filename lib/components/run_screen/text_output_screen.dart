import 'package:ai_flow/components/common/applet_input_card.dart';
import 'package:ai_flow/components/run_screen/text_to_speech.dart';
import 'package:ai_flow/models/applet.dart';
import 'package:flutter/material.dart';

class TextOutputScreen extends StatefulWidget {
  const TextOutputScreen({
    Key? key,
    required this.applet,
    required this.resultText,
    this.inputText = "",
    this.originRoute = "",
  }) : super(key: key);

  final Applet applet;
  final String resultText;
  final String inputText;

  // Optional route to pop back to
  final String originRoute;

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
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text(
            "Result",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          AppletInputCard(
            child: Text(widget.resultText),
          ),
          Center(
            child: TextToSpeech(
              text: widget.resultText,
              autoSpeak: false,
            ),
          ),
          getInputView(),
          Row(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: OutlinedButton(
                  onPressed: () {
                    if (widget.originRoute.isEmpty) {
                      Navigator.popUntil(context, (route) => route.isFirst);
                    } else {
                      Navigator.popUntil(
                          context, ModalRoute.withName(widget.originRoute));
                    }
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
      ),
    );
  }
}
