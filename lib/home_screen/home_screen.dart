import 'package:ai_flow/create_screen/create_screen.dart';
import 'package:ai_flow/home_screen/select_applet_grid.dart';
import 'package:ai_flow/models/applet.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Applet> exampleApplets = [
    Applet(
        name: "Vegan ingredients",
        prompt:
            "Look at this list of recipes. For each ingredient, explain the ingredients in 1-2 sentences and say if they are vegan. Then at the end, say whether all the ingredients are vegan or not vegan: ",
        description:
            "Takes a list of ingredients and say whether or not it's vegan",
        inputType: InputType.text,
        outputType: OutputType.text,
        inputPrompt: "Add your list of ingredients here"),
    Applet(
        name: "Ask me anything",
        prompt:
            "Look at this list of recipes. For each ingredient, explain the ingredients in 1-2 sentences and say if they are vegan. Then at the end, say whether all the ingredients are vegan or not vegan: ",
        description:
            "Takes a list of ingredients and say whether or not it's vegan",
        inputType: InputType.image,
        outputType: OutputType.text,
        inputPrompt: "Add your list of ingredients here"),
    Applet(
        name: "Reply to email",
        prompt:
            "Look at this list of recipes. For each ingredient, explain the ingredients in 1-2 sentences and say if they are vegan. Then at the end, say whether all the ingredients are vegan or not vegan: ",
        description:
            "Takes a list of ingredients and say whether or not it's vegan",
        inputType: InputType.audio,
        outputType: OutputType.text,
        inputPrompt: "Add your list of ingredients here"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ai Flow",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle_outlined),
            color: Colors.black,
            tooltip: 'Profile button',
            onPressed: () {
              // TODO: Profile button
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SelectAppletGridView(
              title: "Your Apps",
              applets: exampleApplets,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SelectAppletGridView(
              title: "Marketplace",
              applets: exampleApplets,
            ),
          ),
          const SizedBox(
            height: kBottomNavigationBarHeight + kRadialReactionRadius + 10,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateScreen()),
          );
        },
        backgroundColor: const Color.fromARGB(255, 128, 81, 209),
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
