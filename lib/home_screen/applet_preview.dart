import 'package:ai_flow/run_screen/run_screen.dart';
import 'package:flutter/material.dart';

class AppletPreviewButton extends StatelessWidget {
  const AppletPreviewButton({
    super.key,
    required this.applet,
  });

  final Applet applet;

  IconData getAppIcon(InputType inputType) {
    switch (inputType) {
      case InputType.text:
        return Icons.edit_note;
      case InputType.image:
        return Icons.photo_library_outlined;
      case InputType.audio:
        return Icons.mic;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RunScreen(
              applet: applet,
            ),
          ),
        );
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: FractionallySizedBox(
                heightFactor: 0.65,
                child: Card(
                  elevation: 2,
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: FittedBox(
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        getAppIcon(applet.inputType),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Text(
              applet.name,
              overflow: TextOverflow.fade,
              softWrap: false,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
