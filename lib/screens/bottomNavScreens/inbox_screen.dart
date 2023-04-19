import 'package:asps/Data/Models/messages_model.dart';
import 'package:asps/businessLogic/LayoutCubit/cubit.dart';
import 'package:asps/businessLogic/LayoutCubit/states.dart';
import 'package:asps/shared/component/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
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
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff4D9FFF)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff4D9FFF)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
                child: Text(
                  "inbox",
                  style: Theme.of(context).textTheme.bodyLarge,
                )),
            BlocBuilder<LayoutCubit, LayoutStates>(
              builder: (context, state) {
                if (state is GetMessagesLoadingState) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 1.6,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (state is GetMessagesErrorState) {
                  return const Center(
                    child: Text("Something went Wrong !!"),
                  );
                }
                if (state is GetMessagesSuccessState) {
                  if (state.messages.isEmpty) {
                    return const Center(
                      child: Text("Now messages yet"),
                    );
                  }
                }

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: cubit.messages.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InboxItem(
                      model: cubit.messages[index],
                    );
                  },
                );
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
  final MessageData model;
  const InboxItem({super.key, required this.model});

  @override
  State<InboxItem> createState() => _InboxItemState();
}

class _InboxItemState extends State<InboxItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: primaryColor,
        child: Text(
          widget.model.mesContent![0].toUpperCase(),
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.model.mesContent!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
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
                  widget.model.mesContent!,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                  icon: star == true
                      ? Icon(
                          Icons.star_border,
                          color: Theme.of(context).iconTheme.color,
                        )
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
