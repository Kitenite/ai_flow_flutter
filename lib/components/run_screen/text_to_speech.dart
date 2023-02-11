import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech extends StatefulWidget {
  const TextToSpeech({
    Key? key,
    required this.text,
    required this.autoSpeak,
  }) : super(key: key);

  final String text;
  final bool autoSpeak;

  @override
  State<TextToSpeech> createState() => _TextToSpeechState();
}

class _TextToSpeechState extends State<TextToSpeech> {
  late FlutterTts flutterTts;
  var _isSpeaking = false;

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();

    if (widget.autoSpeak) {
      _runTts();
    }
  }

  void _runTts() async {
    await flutterTts.setVolume(0.5);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1.0);
    await flutterTts.setSharedInstance(true);
    await flutterTts.setLanguage("en-US");
    await flutterTts
        .setIosAudioCategory(IosTextToSpeechAudioCategory.playback, [
      IosTextToSpeechAudioCategoryOptions.allowBluetooth,
      IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
      IosTextToSpeechAudioCategoryOptions.mixWithOthers
    ]);
    await flutterTts.awaitSpeakCompletion(true);
    _speak(widget.text);
  }

  Future _stopSpeaking() async {
    await flutterTts.stop();
    setState(() => _isSpeaking = false);
  }

  Future _speak(String text) async {
    setState(() => _isSpeaking = true);
    await flutterTts.speak(text);
    setState(() => _isSpeaking = false);
  }

  Widget getTtsIcon() {
    if (_isSpeaking) {
      return const Icon(Icons.stop);
    } else {
      return const Icon(Icons.record_voice_over);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_isSpeaking) {
          _stopSpeaking();
        } else {
          _runTts();
        }
      },
      child: getTtsIcon(),
    );
  }
}
