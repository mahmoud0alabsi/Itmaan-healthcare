import 'dart:async' show Future;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:my_tasks/models/conversations.dart';


class ConvChatManager {

  static const String convChatKey = 'conversations_chat';

  // Save the lists to shared preferences
  static Future<void> saveConvChats() async {
    final prefs = await SharedPreferences.getInstance();
    final ConvChatJson = AllConversationsChats.map((conv) => conv.toJson()).toList();

    await prefs.setString(convChatKey, jsonEncode(ConvChatJson));
  }


  // Load the lists from shared preferences
  static Future<void> loadConvChats() async {
    final prefs = await SharedPreferences.getInstance();
    
    final ConvChatsJson = prefs.getString(convChatKey);
    if (ConvChatsJson != null) {
      final ConvChatsData = jsonDecode(ConvChatsJson);
      AllConversationsChats = List<ConversationsChats>.from(ConvChatsData.map((conv) => ConversationsChats.fromJson(conv)));
    }

    get_conv_chats_count();
  }


  // Add a user to the appropriate list
  static void addConvChat(ConversationsChats conv) async {
    AllConversationsChats.add(conv);

    await saveConvChats();
  }

  // Remove a user from the appropriate list
  static void removeConvChat(ConversationsChats conv) async {
    AllConversationsChats.add(conv);
    await saveConvChats();
  }



}
