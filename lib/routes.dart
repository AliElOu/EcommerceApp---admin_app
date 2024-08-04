import 'package:admin_app/views/home/home_screen.dart';
import 'package:admin_app/views/messages/chats_screen.dart';
import 'package:admin_app/views/messages/messages_screen.dart';
import 'package:get/get.dart';

final List<GetPage<dynamic>> routes = [
  GetPage(name: "/", page: () => const HomeScreen()),
  GetPage(name: "/chats", page: () => const ChatsScreen()),
  GetPage(name: "/messages", page: () => const MessagesScreen()),
];
