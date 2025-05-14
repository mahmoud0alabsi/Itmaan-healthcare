import 'dart:async' show Future;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:my_tasks/models/status_conversations.dart';


class StatusConvManager {
  

  static const String statusConvKey = 'status_conversations';

  // Save the lists to shared preferences
  static Future<void> saveStatusConversations() async {
    final prefs = await SharedPreferences.getInstance();
    final statusConvJson = AllStatusConversations.map((conv) => conv.toJson()).toList();
    await prefs.setString(statusConvKey, jsonEncode(statusConvJson));
  }


  // Load the lists from shared preferences
  static Future<void> loadStatusConvs() async {
    final prefs = await SharedPreferences.getInstance();
    
    final statusConvJson = prefs.getString(statusConvKey);
    if (statusConvJson != null) {
      final statusConvData = jsonDecode(statusConvJson);
      AllStatusConversations = List<StatusConversations>.from(statusConvData.map((conv) => StatusConversations.fromJson(conv)));
    }

    get_status_conv_count();
  }


  // Add a user to the appropriate list
  static void addStatusConv(StatusConversations conv) async {
    AllStatusConversations.add(conv);
    await saveStatusConversations();
  }

  // Remove a user from the appropriate list
  static void removeStatusConv(StatusConversations conv) async {
    AllStatusConversations.add(conv);
    await saveStatusConversations();
  }

}
