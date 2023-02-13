import 'package:ai_flow/resources/constants.dart';
import 'package:flutter/material.dart';

class IconPicker extends StatelessWidget {
  const IconPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      children: <Widget>[
        for (var index in Iterable<int>.generate(Constants.icons.length))
          OutlinedButton(
            onPressed: () => Navigator.pop(context, index),
            child: Icon(Constants.icons[index]),
          )
      ],
    );
  }
}
