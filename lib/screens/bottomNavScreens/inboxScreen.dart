import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                    ), 
                  ),
                ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("inbox",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 17) ,
            textDirection:TextDirection.rtl ),
          ),
          Expanded(
              child: GridView.builder(
            itemCount: 15,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 4.30,
            ),
            itemBuilder: (context, index) => listviewinbox(),
          ))
        ],
      ),
    );
  }
}
bool star = true;
Widget listviewinbox() {
  return ListTile(
    leading: CircleAvatar(
      radius: 25,
      backgroundColor: Colors.blue,
    ),
    title: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Welcome to Gmail",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "8:00 AM",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              //  color: Colors.blue,
              height: 45,
              width: 200,
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean.",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
                icon: star == true
                    ? Icon(Icons.star_border)
                    : Icon(Icons.star,color: Colors.blue),
                onPressed: () {
                  star = !star;
                  print(star);

                }),
            
          ],
        )
      ],
    ),
  );
}
