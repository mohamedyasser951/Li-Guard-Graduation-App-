import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/customizedButton.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatelessWidget {
  const LoginOrRegister({super.key});

  // TextStyle(fontWeight: FontWeight.w700, fontSize: 48.0)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50.0,),
             const Text(
                "Let's you in",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 48.0),
              ),
              SizedBox(height: 10.0,),
              const Image(image: AssetImage("assets/images/login-or-register-image.png"),height: 300,width: 300,),
               const SizedBox(height: 40.0,),
              CustomizedButton(
              
                buttonText: "Login",
                buttonColor: primaryColor,
                onPressed: () {},
                textColor: Colors.white,
              ),
              const SizedBox(height: 17.0,),
              CustomizedButton(
                buttonText: "Register",
                
                onPressed: () {},
                textColor: Colors.black,
                buttonColor: Colors.white,
              ),
                
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 38.0,vertical: 14.0),
                  child: InkWell(
                    onTap: (){},
                      child:const Text("Are you visitor?", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0,color: Color(0xFF4D9FFF)))
                  ),
                ),
            )],
            ),
          ),
        ),
      ),
    );
  }
}
