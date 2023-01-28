import 'package:ai_flow/camera.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraNavButton extends StatelessWidget {
  const CameraNavButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      onPressed: () async {
        await availableCameras().then((value) => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => CameraExampleHome(cameras: value))));
      },
      child: const Text("Take a Picture"),
    ));
  }
}
