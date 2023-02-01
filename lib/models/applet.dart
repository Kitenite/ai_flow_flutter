class Applet {
  final String prompt;
  final String name;
  final InputType inputType;
  final OutputType outputType;

  // Optional
  final String description;
  final String inputPrompt;
  final String outputPrompt;
  final bool showPrompt;

  Applet({
    required this.prompt,
    required this.name,
    required this.inputType,
    required this.outputType,
    this.description = "",
    this.inputPrompt = "",
    this.outputPrompt = "",
    this.showPrompt = true,
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
