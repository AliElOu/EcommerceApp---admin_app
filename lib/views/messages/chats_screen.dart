import 'package:admin_app/controllers/chats/chats_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatsScreen extends GetView<ChatsController> {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChatsController());
    return Scaffold(
      appBar: AppBar(
          title: const Center(child: Text("Chats")),
          toolbarHeight: Get.height * 0.1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: Get.height * 0.9,
            child: StreamBuilder(
              stream: controller.chatsStream,
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Padding(
                    padding: EdgeInsets.only(top: Get.height * 0.39),
                    child: const Center(child: CircularProgressIndicator()),
                  );
                }
                if (snapshot.hasError) {
                  return const Text("HasError");
                }
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed("/messages",
                            arguments: snapshot.data!.docs[i].id);
                      },
                      child: StreamBuilder(
                          stream: controller.lastMsg(snapshot.data!.docs[i].id),
                          builder: (context,
                              AsyncSnapshot<QuerySnapshot> snapshot2) {
                            if (snapshot2.connectionState ==
                                ConnectionState.waiting) {
                              return Padding(
                                padding:
                                    EdgeInsets.only(top: Get.height * 0.39),
                                child: const Center(
                                    child: CircularProgressIndicator()),
                              );
                            }
                            if (snapshot2.hasError) {
                              return const Text("HasError");
                            }
                            return Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  foregroundImage: NetworkImage(
                                      "https://thumbs.dreamstime.com/b/default-avatar-profile-vector-user-profile-default-avatar-profile-vector-user-profile-profile-179376714.jpg"),
                                  radius: 28,
                                ),
                                title: Text(snapshot.data!.docs[i].id),
                                subtitle:
                                    Text(snapshot2.data!.docs.isNotEmpty ? snapshot2.data!.docs[0]["message"] : ""),
                              ),
                            );
                          }),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
