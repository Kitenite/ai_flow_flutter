import 'package:ai_flow/components/applet_input_card.dart';
import 'package:ai_flow/models/applet.dart';
import 'package:flutter/material.dart';

class TextOutputScreen extends StatefulWidget {
  const TextOutputScreen({
    Key? key,
    required this.applet,
    this.inputText = "",
  }) : super(key: key);

  final Applet applet;
  final String inputText;

  @override
  State<TextOutputScreen> createState() => _TextOutputScreenState();
}

class _TextOutputScreenState extends State<TextOutputScreen> {
  final List<bool> _expandedListItems = [false];
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
        ExpansionPanelList(
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
