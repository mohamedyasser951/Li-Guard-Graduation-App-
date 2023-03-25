import 'package:asps/shared/component/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class post_Screen extends StatefulWidget {
  const post_Screen({super.key});

  @override
  State<post_Screen> createState() => _post_ScreenState();
}

class _post_ScreenState extends State<post_Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 5, left: 15),
                child: Row(
                  children: [
                    const Text(
                      "post",
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.only(left: 220, top: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(
                        Icons.search,
                        color: Colors.blue,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: const CircleAvatar(),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 40,
                      width: 230,
                      child: TextField(
                        style: Theme.of(context).textTheme.bodyText2,
                        decoration: InputDecoration(
                          hintText: "what's on your mind?",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(
                      Icons.add_photo_alternate_outlined,
                      size: 30,
                      color: Colors.blue,
                    )
                  ],
                ),
              ),
              ListView.builder(itemBuilder: (context, index) {
                return const listviewpost();
              },
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              shrinkWrap: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}

bool like = true;

class listviewpost extends StatefulWidget {
  const listviewpost({super.key});

  @override
  State<listviewpost> createState() => _listviewpostState();
}

class _listviewpostState extends State<listviewpost> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: const EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10, top: 10),
                child: const CircleAvatar(),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, top: 10),
                child: Column(
                  children:  [
                    Text(
                      "tefa",style: Theme.of(context).textTheme.headline6,
                      // style: TextStyle(
                      //   fontSize: 20,
                      //   fontWeight: FontWeight.w500,
                      // ),
                    ),
                    Text("16h",style: Theme.of(context).textTheme.bodySmall)
                  ],
                ),
              ),
              const SizedBox(
                width: 220,
              ),
              const Icon(Icons.keyboard_control_outlined)
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: const EdgeInsets.only(
                left: 5,
              ),
              width: MediaQuery.of(context).size.width,
              child: Text(
                "the bast player in the world  ",
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(
              minHeight: 150,
              minWidth: 150,
              maxHeight: 350,
              maxWidth: MediaQuery.of(context).size.width,
            ),
            child: Image.network(
                "https://assets.goal.com/v3/assets/bltcc7a7ffd2fbf71f5/bltd9b58ca77501c8b0/63a2694c68cc6b5ae4b7e3fe/messi5.jpg?auto=webp&format=jpg&quality=100"),
          ),
          const SizedBox(
            height: 10,
          ),
          //---------row like & comment-----------------
          Row(children: [
            //------row like-------
            Container(
              margin: const EdgeInsets.only(left: 40),
              child: Row(
                children: [
                  IconButton(
                      icon: like == true
                          ? const Icon(Icons.thumb_up_alt_rounded)
                          : const Icon(
                              Icons.thumb_up_alt_rounded,
                              color: Colors.blue,
                            ),
                      onPressed: () {
                        setState(() {});
                        like = !like;
                        print(like);
                      }),
                  Container(
                      margin: const EdgeInsets.only(
                        top: 4,
                      ),
                      child: const Text("Like"))
                ],
              ),
            ),
            const SizedBox(
              width: 100,
            ),
            //-------row comment----------
            Container(
              child: Row(
                children: [
                  const Icon(Icons.mode_comment_sharp),
                  Container(
                      margin: const EdgeInsets.only(top: 4, left: 8),
                      child: const Text("Comment"))
                ],
              ),
            )
          ]),
        ],
      ),
    );
    ;
  }
}