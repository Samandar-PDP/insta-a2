import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_cl_a2/manager/firebase_manager.dart';
import 'package:instagram_cl_a2/widget/loading.dart';
import 'package:instagram_cl_a2/widget/post_item.dart';
import 'package:instagram_cl_a2/widget/user_story.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _manager = FirebaseManager(); /// 1

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Instagram",
          style: GoogleFonts.dancingScript(fontSize: 34, color: Colors.black),
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: SizedBox(
                height: 100,
                width: double.infinity,
                child: FutureBuilder(
                  future: _manager.getAllUsers(),
                  builder: (context, snapshot) {
                    if(snapshot.data != null && snapshot.data?.isNotEmpty == true) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          if(index == 0) {
                            print(_manager.myImage);
                            return _buildBox(_manager.myImage); /// mana
                          } else {
                            return  UserStory(user: snapshot.data?[0], onClick: () {

                            });
                          }
                        },
                      );
                    } else {
                      return const Loading();
                    }
                  },
                ))),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
          Badge.count(
            count: 2,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.chat_bubble_text),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: FutureBuilder(
        future: _manager.getMyPosts(),
        builder: (context, snapshot) {
          if(snapshot.data != null && snapshot.data?.isNotEmpty == true) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return PostItem(post: snapshot.data![index]);
              },
            );
          } else {
            return const Loading();
          }
        },
      ),
    );
  }

  Widget _buildBox(String imageUrl) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(40),
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                border: Border.all(color: Colors.black,width: 2) /// 1
              ),
              child: const Icon(CupertinoIcons.profile_circled), /// 2
            ),
          ),
          Positioned(
              right: 0,
              bottom: 10, /// 4
              child: Container(
                height: 24,
                width: 24,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blue),
                child:
                    const Icon(CupertinoIcons.add_circled, color: Colors.white),
              ))
        ],
      ),
    );
  }
}
