import 'package:flutter/material.dart';
import 'package:my_tasks/models/status_conversations.dart';

import 'package:my_tasks/models/users.dart';

import 'package:my_tasks/models/status_conversations.dart';

//هنا كودات التي تزود الأحداث التي يتم إضافتها وترسلها لشاشة الطبيب والمريض وشاشة السجل لعرضها
//تعمل على تخزين الأحداث في List وتضيفها وتخذفها حسب حاجة المستخدم

class TimelineProvider with ChangeNotifier {
  // List<Event> events = [];

  void addEvent(Event event, Users patient) {
    
    AllStatusConversations[patient.StatusConversationID].status_messages.add(event);
    // events.add(event);
    notifyListeners();
  }

  void deleteEvent(int index, Users patient) {
    AllStatusConversations[patient.StatusConversationID].status_messages[index].isRemoved = true;
    // events.remove(event);
    notifyListeners();
  }
}

class RecordTimelineProvider with ChangeNotifier {
  // List<Event> recordEvents = [];


 void addEvent(Event event, Users patient) {
    add_event_to_status_conv(event, patient);
    // events.add(event);
    notifyListeners();
  }

  void deleteEvent(int index, Users patient) {
    delete_event_to_status_conv(index, patient);
    // events.remove(event);
    notifyListeners();
  }





  void addRecordEvent(Event event, Users patient) {
    AllMedicalRecords[patient.MedicalRecordID].status_messages.add(event);
    // events.add(event);
    notifyListeners();
  }

  void deleteRecordEvent(int index, Users patient) {
    AllMedicalRecords[patient.MedicalRecordID].status_messages[index].isRemoved = true;
    // events.remove(event);
    notifyListeners();
  }

}