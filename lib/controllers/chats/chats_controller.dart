import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ChatsController extends GetxController {
  late Stream<QuerySnapshot> chatsStream =
      FirebaseFirestore.instance.collection("chats").snapshots();

  Stream<QuerySnapshot> lastMsg(user) {
    late Stream<QuerySnapshot> lastDoc = FirebaseFirestore.instance
        .collection("chats")
        .doc(user)
        .collection("messages")
        .orderBy('createdAt', descending: true)
        .snapshots();
        return lastDoc;
  }
}
