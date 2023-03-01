import 'package:flutter/material.dart';


class MettingScreen extends StatelessWidget {
  const MettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
    
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:const [
          
           Center(child: Text("Metting Screen")),
        ],
      ),
    );
  }
}