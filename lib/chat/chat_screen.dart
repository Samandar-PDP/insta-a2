import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:instagram_cl_a2/model/fb_user.dart';

import '../widget/message_field.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.fbUser});
  final FbUser? fbUser;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final _messageController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 24,
              foregroundImage: NetworkImage(
                widget.fbUser?.image ?? ""
              ),
            ),
            const Gap(20),
            Text(widget.fbUser?.username ?? ""),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: FutureBuilder(
                  
                ),
              ),
            ),
            MessageField( /// import
              controller: _messageController,
              isLoading: _isLoading,
              onSendMessage: () {}, /// 1
              onSendImage: () {}///  2
            )
          ],
        ),
      ),
    );
  }
}
