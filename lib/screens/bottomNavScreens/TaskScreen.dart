import 'package:asps/shared/component/constants.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar:const PreferredSize(
          preferredSize:  Size.fromHeight(225),
          child: taskAppBar(),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tasks",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                 const SizedBox(
                    height: 14.0,
                  ),
                  SizedBox(
                    height: 400,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return const taskItem();
                      },
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}

class taskAppBar extends StatelessWidget {
  const taskAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          
          BoxShadow(
            color: primaryColor,
            blurRadius: 10,
            spreadRadius: 5,
            offset: const Offset(2, 3),
            
          ),
        ],
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0)),
      ),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 26.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                size: 30.0,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              "Oct, 2023",
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 18.0,
            ),
            selectedDatePicker()
          ],
        ),
      ),
    );
  }
}

class taskItem extends StatelessWidget {
  const taskItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ListTile(
        leading: Container(
          height: 42,
          width: 44,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [Color(0xFF6F9EFF), Color(0xFF246BFD)]),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: const Icon(
            Icons.today_sharp,
            color: Colors.white,
          ),
        ),
        title: const Text("Design Changes"),
        subtitle: const Text(
          "2 Days ago",
          style: TextStyle(
            color: Color(0xffcccccc),
          ),
        ),
        trailing: const Icon(
          Icons.more_vert,
          color: Color(0xffcccccc),
        ),
      ),
    );
  }
}

selectedDatePicker() {
  return DatePicker(
    DateTime.now(),
    height: 74.0,
    width: 60.0,
    initialSelectedDate: DateTime.now(),
    selectionColor: const Color(0xFF246BFD),
    selectedTextColor: Colors.white,
    dayTextStyle: GoogleFonts.urbanist(
      textStyle: const TextStyle(
          color: Color(0xff2E3A59),
          fontWeight: FontWeight.w600,
          fontSize: 14.0),
    ),
    monthTextStyle: GoogleFonts.urbanist(
      textStyle: const TextStyle(
          color: Color(0xff2E3A59),
          fontWeight: FontWeight.w600,
          fontSize: 14.0),
    ),
    dateTextStyle: GoogleFonts.urbanist(
        textStyle: const TextStyle(
            color: Color(0xff2E3A59),
            fontWeight: FontWeight.w300,
            fontSize: 14.0)),
    onDateChange: (date) {
      //selectedDate = date;
    },
  );
}
