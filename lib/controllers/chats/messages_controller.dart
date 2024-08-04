import 'package:admin_app/core/push_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagesController extends GetxController {
  late String userId = Get.arguments;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  final msgController = TextEditingController();
  ScrollController scrollcontroller = ScrollController();

  late CollectionReference msgs = FirebaseFirestore.instance
      .collection("chats")
      .doc(userId)
      .collection("messages");
  late Stream<QuerySnapshot> messagesStream = FirebaseFirestore.instance
      .collection("chats")
      .doc(userId)
      .collection("messages")
      .orderBy('createdAt')
      .snapshots();

  notifyUser() async {
    List devices = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: userId)
        .get();
    print(userId);
    if (querySnapshot.docs.isNotEmpty) {
      devices.addAll(querySnapshot.docs[0]['devices']);
      for (String d in devices) {
        PushNotifications.sendNotificationToSelectedDriver(d);
      }
      devices.clear();
    }
  }

  sendMsg() async {
    if (msgController.text.isNotEmpty) {
      msgs.add(
        {
          "sender": "admin",
          "message": msgController.text,
          "createdAt": FieldValue.serverTimestamp(),
        },
      );
      msgController.clear();
      await notifyUser();
    }
  }

  scrollToEnd() async {
    scrollcontroller.animateTo(
      scrollcontroller.position.maxScrollExtent,
      duration: const Duration(milliseconds: 10),
      curve: Curves.easeOut,
    );
    await Future.delayed(const Duration(milliseconds: 100));
    scrollcontroller.animateTo(
      scrollcontroller.position.maxScrollExtent,
      duration: const Duration(milliseconds: 10),
      curve: Curves.easeOut,
    );
  }

  bool isMine(msg) {
    if (msg["sender"] == "admin") {
      return true;
    } else {
      return false;
    }
  }
}
