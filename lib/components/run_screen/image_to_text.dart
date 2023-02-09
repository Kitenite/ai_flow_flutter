import 'package:ai_flow/sao/api.dart';
import 'package:ai_flow/utils/image_handler.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:record/record.dart';

class ImageToText extends StatefulWidget {
  const ImageToText({
    Key? key,
    required this.finishedProcessingCallback,
    required this.imageSource,
  }) : super(key: key);

  final ImageSource imageSource;
  final Function(String outputText) finishedProcessingCallback;

  @override
  State<ImageToText> createState() => _ImageToTextState();
}

class _ImageToTextState extends State<ImageToText> {
  var _isProcessing = false;
  var recorder = Record();

  void getImage() async {
    setState(() {
      _isProcessing = true;
    });
    XFile? image = (await ImageHandler.pickImage(widget.imageSource));
    if (image == null) {
      print("No image taken");
      setState(() {
        _isProcessing = false;
      });
      return;
    }
    CroppedFile? croppedImage =
        (await ImageHandler.cropImage(File(image.path)));
    if (croppedImage == null) {
      return getImage();
    }
    ApiDataAccessor.imageToText(File(croppedImage.path))
        .then(
          (value) => {
            widget.finishedProcessingCallback(value),
            setState(() {
              _isProcessing = false;
            })
          },
        )
        .catchError(
          (e) => {
            setState(() {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Something went wrong, try again"),
              ));
              _isProcessing = false;
            })
          },
        );
  }

  Widget getButtonIcon() {
    if (_isProcessing) {
      return Container(
          width: 24,
          height: 24,
          padding: const EdgeInsets.all(1),
          child: const CircularProgressIndicator(
            backgroundColor: Colors.white,
            strokeWidth: 2,
          ));
    }
    switch (widget.imageSource) {
      case ImageSource.camera:
        return const Icon(Icons.photo_camera);
      case ImageSource.gallery:
        return const Icon(Icons.photo_library);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(10),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        onPressed: () {
          getImage();
        },
        child: getButtonIcon());
  }
}
