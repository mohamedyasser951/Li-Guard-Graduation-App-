import 'package:flutter/material.dart';


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
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "search",
                    prefixIcon:const Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                    ), 
                  ),
                ),
          ),
        const  Padding(
            padding:  EdgeInsets.all(8.0),
            child: Text("inbox",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 17) ,
            textDirection:TextDirection.rtl ),
          ),
          Expanded(
              child: GridView.builder(
            itemCount: 15,
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
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
    leading:const CircleAvatar(
      radius: 25,
      backgroundColor: Colors.blue,
    ),
    title: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
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
       const SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              //  color: Colors.blue,
              height: 45,
              width: 200,
              child: const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean.",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
                icon: star == true
                    ? const Icon(Icons.star_border)
                    : const Icon(Icons.star,color: Colors.blue),
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
