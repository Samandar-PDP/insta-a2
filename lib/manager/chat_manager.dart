import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:instagram_cl_a2/model/message.dart';

class ChatManager {
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseDatabase.instance;
  final _storage = FirebaseStorage.instance;

  Future<void> sendTextMessage(String text, String? receiverId) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final messageId = _db.ref('chats').push().key;
    final senderId = _auth.currentUser?.uid;
    final senderRoomId = "$senderId$receiverId";
    final receiverRoomId = "$receiverId$senderId";
    final newMessage = Message(
        messageId: messageId,
        senderId: senderId,
        receiverId: receiverId,
        text: text,
        image: null,
        type: 0,
        time: getCurrentTime());
    await _db.ref('chats').child(senderRoomId).child('messages/$messageId').set(newMessage.toJson());
    await _db.ref('chats').child(receiverRoomId).child('messages/$messageId').set(newMessage.toJson());
  }
  String getCurrentTime() {
    final now = DateTime.now();
    return "${now.hour}:${now.minute}";
  }

  Future<List<Message>> getCurrentChatMessages(String? receiverId) async {
    final chatRoomId = "${_auth.currentUser?.uid}$receiverId";
    final snapshot = await _db.ref('chats/$chatRoomId/messages').get();
    final List<Message> messageList = [];
    for(var map in snapshot.children) {
      final message = Message.fromJson(map.value as Map<Object?, Object?>);
      messageList.add(message);
    }
    return messageList;
  }
}