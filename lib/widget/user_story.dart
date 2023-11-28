import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_cl_a2/model/fb_user.dart';

class UserStory extends StatelessWidget {
  const UserStory({super.key, required this.user, required this.onClick});
  final FbUser? user;
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff11347a),
            Color(0xffd52a92),
            Color(0xffe5571e),
          ]
        ),
        shape: BoxShape.circle
      ),
      child: InkWell(
        onTap: onClick, /// mana
        borderRadius: BorderRadius.circular(50),
        child: CircleAvatar(
          foregroundImage: NetworkImage(user?.image ?? ""),
        ),
      ),
    );
  }
}
