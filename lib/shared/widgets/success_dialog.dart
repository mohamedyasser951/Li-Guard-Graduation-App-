import 'package:asps/shared/component/constants.dart';
import 'package:flutter/material.dart';

Future customizedSuccessDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 25.0),
        alignment: Alignment.center,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          height: 420,
          width: 395,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(40.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage("assets/images/congra_image.png"),
              ),
              const SizedBox(
                height: 22.0,
              ),
              Text(
                "Congratulations!",
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 4.0,
              ),
              Text(
                "Your account is ready to use. You will \n be redirected to the Login page in \n a  few saconds..",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 70,
                width: 70,
                child: CircularProgressIndicator(
                  backgroundColor: const Color(0xffCCCCCC),
                  strokeWidth: 8.0,
                  color: primaryColor,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
