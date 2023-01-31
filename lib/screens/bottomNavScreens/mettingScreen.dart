import 'package:flutter/material.dart';


class MettingScreen extends StatelessWidget {
  const MettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
    
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Container(
             
              child: const Center(child: Text("Metting Screen")),
            ),
          ],
        ),
      ),
    );
  }
}