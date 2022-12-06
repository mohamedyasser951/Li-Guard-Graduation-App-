import 'package:asps/screens/login_or_register/login_or_register.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/customizedButton.dart';
import 'package:asps/shared/widgets/customizedTextField.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF4D9FFF),
      ),
      home: LoginOrRegister(),
    );
  }
}

// بجرب بيها الشكل بس HomePage

class HomePage extends StatelessWidget {
  HomePage({super.key});

  var controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomizedTextField(
              controller: controller,
              isPassword: false,
              validator: ((val) {
                if (val!.isEmpty) return "email must be entered";
                return null;
              }),
              hint: "Email",
              prefixIcon: Icons.email,
            ),
            SizedBox(height: 20.0,),
            CustomizedTextField(
              controller: controller,
              validator: ((val) {
                if (val!.isEmpty) return "email must be entered";
                return null;
              }),
              hint: "password",
              prefixIcon: Icons.lock,
              suffixIcon: Icons.visibility,
              isPassword: true,
            ),

              SizedBox(height: 20.0,),
            CustomizedButton(buttonText: "Login",onPressed: (){},textColor: Colors.white),
          ],
        ),
      ),
    );
  }
}
