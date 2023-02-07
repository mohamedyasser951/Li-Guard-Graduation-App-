import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/customizedButton.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Setup
 extends StatelessWidget {
   Setup
  ({super.key});

   // TextEditingController nameController = TextEditingController();
   // TextEditingController phonenNamberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height:130,
              ),
              const Text("Fill Your Profile",
              style:TextStyle(fontWeight: FontWeight.bold, fontSize: 30) ,),
              const SizedBox(
                height: 10,
              ),
              const Text("Don't worry, you can always change it later.",
              style: TextStyle( fontSize: 15),),
              const SizedBox(
                height: 50,
              ), 
              Image.asset("assets/images/setup_img.png"),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                  decoration:  InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'FullName',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      width: 0.0,
                      color: backgroundColor,
              ))
                  ),
                
                ),
               const SizedBox(
                height: 10,
              ),
              TextFormField(
                  decoration:  InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Nickname',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(25.0),
                     borderSide: BorderSide(
                      width: 0.0,
                      color: backgroundColor,
                    )
                    )
                  ),
                ),
                const SizedBox(
                height: 10,
              ),
               IntlPhoneField(
                 decoration:InputDecoration (
                   fillColor: Colors.white,
                   filled: true,
                   labelText:"Phone Number" ,
                   border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                   ),
                   enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      width: 0.0,
                      color: backgroundColor,
                    )
                   )
                  )                   
                ),  
               const SizedBox(
                height: 60),
              CustomizedButton(
                buttonText: "Continue",
                textColor: Colors.white,
                onPressed: (){    
                })
            ]   
          ),
        ),
      ),
    );
  }
}