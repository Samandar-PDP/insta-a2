import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_cl_a2/model/post.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key, required this.post});
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              foregroundImage: NetworkImage(post.ownerProfileImage ?? ""),
            ),
            title: Text(post.ownerUserName ?? ""),
            trailing: const Icon(Icons.more_horiz),
          ),
          const SizedBox(height: 10),
          Image.network(post.image ?? "",width: double.infinity,height: 300),
          const SizedBox(height: 10),
          const Row(
            children: [
              Icon(CupertinoIcons.heart),
              Icon(CupertinoIcons.chat_bubble),
              Icon(CupertinoIcons.paperplane),
              Align(alignment: AlignmentDirectional.centerEnd,child: Icon(CupertinoIcons.bookmark),)
            ],
          )
        ],
      ),
    );
  }
}
