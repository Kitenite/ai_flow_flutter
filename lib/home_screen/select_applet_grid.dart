import 'package:ai_flow/home_screen/applet_preview.dart';
import 'package:flutter/material.dart';

class SelectAppletGridView extends StatelessWidget {
  const SelectAppletGridView({
    super.key,
    required this.title,
    required this.applets,
  });

  final String title;
  final List<String> applets;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const Divider(
          color: Colors.black,
          thickness: 2,
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            scrollDirection: Axis.horizontal,
            crossAxisSpacing: 10,
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              for (var app in applets) AppletPreviewButton(app: app),
            ],
          ),
        ),
      ],
    );
  }
}
