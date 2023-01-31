class Applet {
  final String prompt;
  final String name;
  final InputType inputType;
  final OutputType outputType;

  // Optional
  final String description;
  final String inputPrompt;

  Applet({
    required this.prompt,
    required this.name,
    required this.inputType,
    required this.outputType,
    this.description = "",
    this.inputPrompt = "",
  });
}

enum InputType {
  text,
  image,
  audio,
}

enum OutputType {
  text,
  image,
  audio,
}
