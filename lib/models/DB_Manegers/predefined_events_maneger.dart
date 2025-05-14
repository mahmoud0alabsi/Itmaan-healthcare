import 'dart:async' show Future;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:my_tasks/pages/staff_side/Models/PredefinedEvent.dart';


class PreEventsManager {

  static const String PreEventsKey = 'pre_events';

  // Save the lists to shared preferences
  static Future<void> savePreEvents() async {
    final prefs = await SharedPreferences.getInstance();
    final PreEventsJson = All_predefind_events.map((event) => event.toJson()).toList();
    
    await prefs.setString(PreEventsKey, jsonEncode(PreEventsJson));
  }


  // Load the lists from shared preferences
  static Future<void> loadPreEvents() async {
    final prefs = await SharedPreferences.getInstance();
    
    final PreEventsJson = prefs.getString(PreEventsKey);
    if (PreEventsJson != null) {
      final PreEventsData = jsonDecode(PreEventsJson);
      All_predefind_events = List<PreEvents>.from(PreEventsData.map((conv) => PreEvents.fromJson(conv)));
    }
  }


  // Add a user to the appropriate list
  static void addPreEvents(PreEvents event) async {
    All_predefind_events.add(event);
    await savePreEvents();
  }

  // Remove a user from the appropriate list
  static void removePreEvents(PreEvents event) async {
    All_predefind_events.add(event);
    await savePreEvents();
  }

}
