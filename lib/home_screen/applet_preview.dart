import 'package:flutter/material.dart';

class AppletPreviewButton extends StatelessWidget {
  const AppletPreviewButton({
    super.key,
    required this.app,
  });

  final String app;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Nav to applet
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: FractionallySizedBox(
                heightFactor: 0.65,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 1.0,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black38,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 1.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: FittedBox(
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: const Icon(
                        Icons.edit_note,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Text(app),
          ],
        ),
      ),
    );
  }
}
