import 'package:flutter/material.dart';

class AppletInputCard extends StatelessWidget {
  const AppletInputCard({
    Key? key,
    required this.title,
    required this.child,
    this.visible = true,
  }) : super(key: key);

  final String title;
  final Widget child;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 2,
            shape: const RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              child: Column(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                child,
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
