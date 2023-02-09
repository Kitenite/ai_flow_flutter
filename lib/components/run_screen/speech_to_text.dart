import 'package:ai_flow/sao/api.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';

class SpeechToText extends StatefulWidget {
  const SpeechToText({
    Key? key,
    required this.finishedProcessingCallback,
  }) : super(key: key);

  final Function(String outputText) finishedProcessingCallback;

  @override
  State<SpeechToText> createState() => _SpeechToTextState();
}

class _SpeechToTextState extends State<SpeechToText> {
  var _isRecording = false;
  var _isProcessing = false;
  var recorder = Record();

  void startRecording() async {
    setState(() {
      _isRecording = true;
    });
    PermissionStatus status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      await Permission.microphone.request();
      throw Exception("Microphone permission not granted");
    }
    AudioEncoder encoder;
    String recordingFileName;

    if (await recorder.isEncoderSupported(AudioEncoder.flac)) {
      encoder = AudioEncoder.flac;
      recordingFileName = 'recording.flac';
    } else {
      encoder = AudioEncoder.wav;
      recordingFileName = 'recording.wav';
    }
    await recorder.start(
      path: '${Directory.systemTemp.path}/$recordingFileName',
      encoder: encoder,
      numChannels: 1,
      samplingRate: 16000,
    );
  }

  Future<String?> stopRecording() async {
    setState(() {
      _isRecording = false;
    });
    return recorder.stop();
  }

  void runSpeechToText(String fileUrl) {
    setState(() {
      _isProcessing = true;
    });
    ApiDataAccessor.speechToText(File(fileUrl).readAsBytesSync()).then(
      (value) => {
        widget.finishedProcessingCallback(value),
        setState(() {
          _isProcessing = false;
        })
      },
    );
  }

  Widget getRecordingIcon() {
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
    if (_isRecording) {
      return Container(
          width: 24,
          height: 24,
          padding: const EdgeInsets.all(4),
          child: const LinearProgressIndicator(
            backgroundColor: Colors.white,
            color: Color.fromARGB(255, 255, 224, 224),
          ));
    }
    return const Icon(Icons.mic);
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
          if (_isRecording) {
            stopRecording().then((fileUrl) => {
                  if (fileUrl != null) {runSpeechToText(fileUrl)}
                });
          } else {
            startRecording();
          }
        },
        child: getRecordingIcon());
  }
}
