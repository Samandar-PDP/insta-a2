import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageField extends StatelessWidget {
  const MessageField({
    super.key,
    required this.controller,
    required this.isLoading,
    required this.onSendImage,
    required this.onSendMessage
});
  final TextEditingController controller;
  final bool isLoading;
  final void Function() onSendMessage;
  final void Function() onSendImage;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Xabar...',
        fillColor: Colors.white60,
        filled: true,
        contentPadding: const EdgeInsets.all(20),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 2,color: Colors.indigo)
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 2,color: Colors.indigo)
        ),
        suffixIcon: isLoading ? const CircularProgressIndicator() : IconButton(
          onPressed: onSendMessage,
          icon: const Icon(CupertinoIcons.paperplane),
        ),
        prefixIcon: IconButton(
          icon: const Icon(CupertinoIcons.photo),
          onPressed: onSendImage,
        )
      ),
    );
  }
}
