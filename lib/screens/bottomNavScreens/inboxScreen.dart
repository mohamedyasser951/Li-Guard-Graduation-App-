import 'package:flutter/material.dart';


class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.white,
              child: const Center(child: Text("Metting Screen")),
            ),
          ],
        ),
      ),
    );
  }
}