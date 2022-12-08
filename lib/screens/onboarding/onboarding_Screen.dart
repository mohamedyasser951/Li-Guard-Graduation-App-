import 'package:asps/screens/login_or_register/login_or_register.dart';
import 'package:asps/shared/component/component.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
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

                  ),)
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                TextButton(onPressed: (){
                  navigateTo(context, LoginOrRegister());
                }, child: const Text("Skip",style: TextStyle(fontSize:15 ,fontWeight: FontWeight.bold) ,)),
                const Spacer(),
                SizedBox(
                    height: 50,
                    width: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        _pageController.nextPage(duration: Duration(milliseconds: 300) , curve: Curves.ease );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: CircleBorder(),

                      ),

                      child:const Icon(Icons.arrow_forward_ios,),

                    )
                ),
              ],
            ),
          ),
          SizedBox(height: 20,)
        ],
      ),
    ));
  }
}
class Onboard{
  final String image, title;

  Onboard(
      {
        required this.image,
        required this.title
      });
}

final List<Onboard> demo_data =[
  Onboard(
      title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
      image: "assets/images/1photo.png"
  ),
  Onboard(
      title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
      image: "assets/images/2photo.png"
  ),
  Onboard(
      title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
      image: "assets/images/3photo.png"
  ),
  Onboard(
      title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
      image: "assets/images/4photo.png"
  ),

];

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  final String title , image ;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
             // const Spacer(),
              SizedBox(
                height: 80,
              ),
              Image.asset(image,
                height:250,
                // width: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,),

              ),
            //  const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
