import 'package:asps/screens/login_or_register/login_or_register.dart';
import 'package:asps/shared/component/component.dart';
import 'package:asps/shared/component/constants.dart';

import 'package:flutter/material.dart';

class Onboarging extends StatefulWidget {
  const Onboarging({Key? key}) : super(key: key);

  @override
  State<Onboarging> createState() => _OnboargingState();
}

class _OnboargingState extends State<Onboarging> {
  late PageController _pageController;

  @override
  void initState() {
   
    _pageController =PageController(initialPage: 0 );
    super.initState();
  }

  @override
  void dispose() {
    
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          children: [
            Expanded(
              child: SafeArea(
                  child: PageView.builder(
                    itemCount: demo_data.length,
                    controller: _pageController,
                    itemBuilder: (context, index)=> OnboardContent(
                      image: demo_data[index].image,
                      title: demo_data[index].title,
                      description: demo_data[index].description,

                  ),)
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                TextButton(onPressed: (){
                  navigateTo(context, const LoginOrRegister());
                }, child: const Text("Skip",style: TextStyle(fontSize:15 ,fontWeight: FontWeight.bold,) ,)),
                const Spacer(),
                SizedBox(
                    height: 43,
                    width: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        _pageController.nextPage(duration: const Duration(milliseconds: 300) , curve: Curves.ease );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: const CircleBorder(),

                      ),

                      child:const Icon(Icons.arrow_forward_ios,),

                    )
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,)
        ],
      ),
    ));
  }
}
class Onboard{
  final String image, title,description;

  Onboard(
      {
        required this.image,
        required this.title,
        required this.description,
      });
}

final List<Onboard> demo_data =[
  Onboard(
      title: "Detect Strangers",
      description: "The app detects and knews anyone who enters the organization",
      image: "assets/images/1photo.png"
  ),
  Onboard(
      title: "Enter your Key",
      description: "",
      image: "assets/images/2photo.png"
  ),
  Onboard(
      title: "Face Recgnation",
      description: "",
      image: "assets/images/3photo.png"
  ),
  Onboard(
      title: "Light and Dark mode",
      description: "",
      image: "assets/images/4photo.png"
  ),

];

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    Key? key,
    required this.title,
    required this.image,
    required this.description,
  }) : super(key: key);

  final String title , image ,description;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
             // const Spacer(),
                const SizedBox(
                  height: 80,
                ),
                Image.asset(image,
                  height:250,
                  // width: 200,
                ),
               const SizedBox(
                  height: 25,
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 30,),
                ),
                SizedBox(height: 10,),
                Container(
                   width: 300,
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style:const TextStyle(fontSize: 16,)
                  ),
                ),
            //  const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
