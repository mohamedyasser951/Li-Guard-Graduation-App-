import 'package:asps/shared/component/constants.dart';
import 'package:flutter/material.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: ListView(
          children: [
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                style: Theme.of(context).textTheme.bodyLarge,
                decoration: InputDecoration(
                  hintText: "search",
                  prefixIcon: const Icon(Icons.search),
                  enabledBorder:OutlineInputBorder(
                    borderSide:const BorderSide(color: Color(0xff4D9FFF)),
                    borderRadius: BorderRadius.circular(20), ),
                  border: OutlineInputBorder(
                    borderSide:const BorderSide(color: Color(0xff4D9FFF)),
                    borderRadius: BorderRadius.circular(20),
                    
                  ),
                  
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 18),
                child: Text(
                  "inbox",
                  style: Theme.of(context).textTheme.bodyLarge,
                )),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 20,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return const InboxItem();
              },
            )
          ],
        ),
      ),
    );
  }
}

bool star = true;
class InboxItem extends StatefulWidget {
  const InboxItem({super.key});

  @override
  State<InboxItem> createState() => _InboxItemState();
}

class _InboxItemState extends State<InboxItem> {
  @override
  Widget build(BuildContext context) {
    return  ListTile(
    leading:  CircleAvatar(
      radius: 25,
      backgroundColor: primaryColor,
      child:const Text("B",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
    ),
    title: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            Text(
              "Welcome to Gmail",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              "8:00 AM",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             SizedBox(
              height: 45,
              width: 200,
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean.",
                maxLines: 2,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
                icon: star == true
                    ?  Icon(Icons.star_border,color: Theme.of(context).iconTheme.color,)
                    : const Icon(Icons.star, color: Colors.blue),
                onPressed: () {
                 
                 setState(() {
                    star = !star;
                 });
                }),
          ],
        )
      ],
    ),
  );
  }
}
