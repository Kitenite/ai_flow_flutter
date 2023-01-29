import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            icon: const Icon(Icons.account_circle),
            color: Colors.black,
            tooltip: 'Profile button',
            onPressed: () {
              print("Profile button pressed");
            },
          ),
        ],
      ),
      body: Column(
        children: const <Widget>[
          Expanded(
            child: SelectAppletGridView(
              title: "Your apps",
              applets: [
                "My app title",
                "My app title",
                "My app title",
                "My app title",
                "My app title",
                "My app title",
                "My app title",
                "My app title",
                "My app title",
                "My app title",
                "My app title",
                "My app title",
              ],
            ),
          ),
          Expanded(
            child: SelectAppletGridView(
              title: "Marketplace",
              applets: [
                "My app title",
                "My app title",
                "My app title",
                "My app title",
                "My app title",
                "My app title",
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Nav to creation screen
        },
        backgroundColor: Color.fromARGB(255, 128, 81, 209),
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "Settings",
          icon: Icon(Icons.settings),
        ),
      ]),
    );
  }
}

class SelectAppletGridView extends StatelessWidget {
  const SelectAppletGridView({
    super.key,
    required this.title,
    required this.applets,
  });

  final String title;
  final List<String> applets;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const Divider(
          color: Colors.black,
          thickness: 2,
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            scrollDirection: Axis.horizontal,
            crossAxisSpacing: 10,
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              for (var app in applets) AppletIcon(app: app),
            ],
          ),
        ),
      ],
    );
  }
}

class AppletIcon extends StatelessWidget {
  const AppletIcon({
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
                heightFactor: 0.5,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: FittedBox(
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: const Icon(
                        Icons.text_fields_sharp,
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
