import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MettingScreen extends StatelessWidget {
  const MettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Container(
        color: Colors.white30,
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