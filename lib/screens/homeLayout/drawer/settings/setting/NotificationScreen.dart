import 'package:asps/shared/component/constants.dart';
import 'package:asps/shared/widgets/setting_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//error
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).colorScheme.background,
      appBar:const PreferredSize(
          preferredSize:  Size.fromHeight(56.0),
          child: SettingsAppBar(
            title: "Notification",
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            children: [
              const SizedBox(height: 68.0,),
              NotificationItem(text: "General Notification",value: true,),
              NotificationItem(text: "Sound",value: false,),
              NotificationItem(text: "APP Updates",value: false,),
              NotificationItem(text: "Bill Reminder",value: true,),
              NotificationItem(text: "Promotion",value: true,),
              NotificationItem(text: "New Service Available",value: false,),
         
              ],
          ),
        ),
      ),
    );
  }
}

class NotificationItem extends StatefulWidget {
  final String text;
   bool value;
   NotificationItem({
    required this.text,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.text,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Transform.scale(
              scale: 0.8,
              child: CupertinoSwitch(
                  activeColor: primaryColor,
                  trackColor: const Color(0xff1C1B1F1F),
                  value: widget.value,
                  onChanged: (val) {
                    setState(() {
                      widget.value = val;
                    });
                  })),
        ],
      ),
    );
  }
}
