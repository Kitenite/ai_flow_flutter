import 'package:flutter/material.dart';

class WaitScreen extends StatelessWidget {
  const WaitScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                "Fetching app state",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: 20,
                height: 20,
              ),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
