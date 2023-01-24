import 'package:asps/shared/component/constants.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white30,
        child: Column(
          
          children: [
            CutomeHomeAppBar(),
            Expanded(
              child: Container(
                color: Colors.white,
                child: const Center(child: Text("Home Screen")),
               
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CutomeHomeAppBar extends StatelessWidget {
  const CutomeHomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(162.0),
        child: SafeArea(
          child: Container(
            decoration:const BoxDecoration(
              color: Colors.amberAccent,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0)),
            ),
            height: 100,
           
           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 15.0),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               const Icon(Icons.menu,size: 31.0,),
                CircleAvatar(
                  radius: 25.0,
                  backgroundColor: primaryColor,
                ),
                
              ],
             ),
           )
          ),
        ));
  }
}
