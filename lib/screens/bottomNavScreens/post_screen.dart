import 'package:asps/Data/Models/posts_model.dart';
import 'package:asps/businessLogic/LayoutCubit/cubit.dart';
import 'package:asps/businessLogic/LayoutCubit/states.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: LayoutCubit.get(context).isDark
            ? const Color(0xff0D0D0D)
            : Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15.0,
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Posts",
                      style: TextStyle(
                          fontSize: 36,
                          color: primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.only(right: 15, top: 8),
                      decoration: BoxDecoration(
                        color: cubit.isDark ?Colors.grey[900] :Colors.grey[300],
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
                      child: CircleAvatar(
                        backgroundColor: primaryColor,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 40,
                      width: 230,
                      child: TextField(
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          hintText: "what's on your mind?",
                          contentPadding:
                              const EdgeInsets.only(top: 20, left: 20),
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
              BlocBuilder<LayoutCubit, LayoutStates>(
                builder: (context, state) {
                  if (state is GetPostsLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } if (state is GetPostsErrorState) {
                    return const Center(
                      child: Text('Something went Wrong !'),
                    );
                  } else {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return PostItem(
                          posts: cubit.posts[index],
                        );
                      },
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cubit.posts.length,
                      shrinkWrap: true,
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

bool like = true;

class PostItem extends StatefulWidget {
  final PostsData posts;
  const PostItem({super.key, required this.posts});

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 6.0,vertical: 6.0),
      color: Theme.of(context).colorScheme.background,
      elevation: 5,
      child: Container(
        margin: const EdgeInsets.only(top: 8),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10, top: 10),
                  child: CircleAvatar(
                    backgroundColor: primaryColor,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, top: 10),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.posts.userName!,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text("16h",
                              style: Theme.of(context).textTheme.bodySmall)
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: const Icon(Icons.keyboard_control_outlined))
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
                  widget.posts.postContent!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            if (widget.posts.img != null)
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
            Row(children: [
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
              Row(
                children: [
                  const Icon(Icons.comment),
                  Container(
                      margin: const EdgeInsets.only(top: 4, left: 8),
                      child: const Text("Comment"))
                ],
              )
            ]),
          ],
        ),
      ),
    );
    ;
  }
}
