import 'package:ai_flow/components/common/applet_input_card.dart';
import 'package:ai_flow/components/run_screen/speech_to_text.dart';
import 'package:ai_flow/models/applet.dart';
import 'package:flutter/material.dart';

class TextInputScreen extends StatefulWidget {
  const TextInputScreen({
    Key? key,
    required this.applet,
    this.inputText = "",
    required this.submitCallback,
  }) : super(key: key);

  final Applet applet;
  final String inputText;
  final Function(String inputText) submitCallback;

  @override
  State<TextInputScreen> createState() => _TextInputScreenState();
}

class _TextInputScreenState extends State<TextInputScreen> {
  final List<bool> _expandedListItems = [false];
  var _submitButtonVisible = false;
  final _textInputController = TextEditingController();

  Widget getPromptView() {
    // If applet allows prompts to be displayed
    if (widget.applet.showPrompt) {
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
                title: Text("Show prompt"),
              );
            },
            body: ListTile(
              title: Text(widget.applet.prompt),
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
          child: Stack(
            children: <Widget>[
              TextFormField(
                controller: _textInputController,
                autofocus: true,
                autocorrect: true,
                maxLines: 10,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    setState(() {
                      _submitButtonVisible = true;
                    });
                  } else {
                    setState(() {
                      _submitButtonVisible = false;
                    });
                  }
                },
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: SpeechToText(
                    finishedProcessingCallback: (String outputText) {
                  setState(() {
                    _textInputController.text = outputText;
                  });
                })),
            ],
          ),
        ),
        getPromptView(),
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
                  onPressed: () => widget.submitCallback(
                      "${widget.applet.prompt}: ${_textInputController.text}"),
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
