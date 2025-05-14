// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:convert'; // Import the dart:convert library
import 'dart:typed_data'; // Import the dart:typed_data library

import 'DB_Manegers/status_conv_maneger.dart';

import 'users.dart';

// in this file, y;ou can create (StatusConversations) between staffs and paitent
// and return all messages inside current status conversation

// you can create and add new message to status onversaion


class StatusConversations {
  int? id;

  // Medical staff only
  int? patient_id; // primary key of patient users

  int num_of_status_messages =
      0; // to count number of status messages in current conversation
  // use it in set (id) of each message

  List<Event> status_messages = []; // contain all status_messages
  // status_messages = [{status_message}, {status_message}, .....]

  StatusConversations(int id, int patient_id, int num_of_status_messages, List<Event> status_messages){
    this.id = id;
    this.patient_id = patient_id;
    this.num_of_status_messages = num_of_status_messages;
    this.status_messages = status_messages;

  }

  StatusConversations.create(
    int id, int patient_id, int num_of_status_messages) {
    this.id = id;
    this.patient_id = patient_id;
    this.num_of_status_messages = num_of_status_messages;
  }


  add_status_messages(Event msg){
    status_messages.add(msg);
  }


  List<Event> get_all_status_messages(){
    status_messages.sort((a,b) => a.timestamp.compareTo(b.timestamp));
    return status_messages;
  }


    // Convert StatusConversations object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patient_id': patient_id,
      'num_of_status_messages': num_of_status_messages,
      'status_messages': status_messages.map((message) => message.toJson()).toList(),
    };
  }


  // Create a StatusConversations object from JSON
  factory StatusConversations.fromJson(Map<String, dynamic> json) {
    return StatusConversations(
      json['id'],
      json['patient_id'],
      json['num_of_status_messages'],
      List<Event>.from(
        (json['status_messages'] as List).map((message) => Event.fromJson(message)),
      ),
    );
  }

}


int all_status_conversations_count = 0;

List<StatusConversations> AllStatusConversations = [];

Future get_status_conv_count() async {
  all_status_conversations_count = AllStatusConversations.length;
}

int create_status_conversations(int patientId, int numOfStatusMessages) {
  StatusConversations newStatusConversations = StatusConversations.create(
      all_status_conversations_count, patientId, numOfStatusMessages);

  // AllStatusConversations.add(newStatusConversations);

  StatusConvManager.addStatusConv(newStatusConversations);

  return all_status_conversations_count ++;
}


add_event_to_status_conv(Event event, Users patient){
  AllStatusConversations[patient.StatusConversationID].status_messages.add(event);
  AllStatusConversations[patient.StatusConversationID].status_messages.sort((a,b) => a.timestamp.compareTo(b.timestamp));
  StatusConvManager.saveStatusConversations();
}

delete_event_to_status_conv(int index, Users patient){
  AllStatusConversations[patient.StatusConversationID].status_messages[index].isRemoved = true;
  StatusConvManager.saveStatusConversations();
}


List<Event> get_all_status_conversation_messages(int StatusConversationstID){

  for (int i = 0 ; i < AllStatusConversations.length ; i++){
    if(AllStatusConversations[i].id == StatusConversationstID){
      AllStatusConversations[i].status_messages.sort((a,b) => a.timestamp.compareTo(b.timestamp));

      return AllStatusConversations[i].status_messages;
    }
  }
  List<Event> temp = [];
  return temp;
}


//--------------



class Event {

  late final id;

  late final String title;
  late final String description;
  late final String timestamp;
  late File? image = null;

  bool isRemoved = false;

  Event({required this.id, required this.title, required this.description, required this.timestamp, this.image});

  Event.fromJsonConstructer(int id, String title, String description, String timestamp, bool isRemoved){
    this.id = id;
    this.title = title;
    this.description = description;
    this.timestamp = timestamp;
    this.image = null;
    this.isRemoved = isRemoved;
  }


  // Convert Event object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'timestamp': timestamp,
      // 'image': image != null ? base64Encode(image!.readAsBytesSync()) : null,
      // 'icon': icon != null ? icon!.codePoint : null,
      'isRemoved': isRemoved,
    };
  }


    // Create an Event object from JSON
  factory Event.fromJson(Map<String, dynamic> json) {
    return Event.fromJsonConstructer(
      json['id'],
      json['title'],
      json['description'],
      json['timestamp'],
      // json['image'] != null ? File.fromRawPath(Uint8List.fromList(base64Decode(json['image']))) : null,
      // json['icon'] != null ? IconData(json['icon'], fontFamily: 'MaterialIcons') : null,
      json['isRemoved'] ?? false,
    );
  }


}




//-----------------------------

class StatusMessage {
  int? id;

  int? patient_status_conversations_id;
  late int message_order;

  int? sender_id;
  String? sender_role; // Medical staff always

  int? reciver_id;
  String? reciver_role; // patient always

  String? message_content;
  FileImage? image;
  File? sound_file;

  DateTime? created_at = DateTime.now();

  StatusMessage();

  StatusMessage.create(
      int id,
      int patient_status_conversations_id,
      int message_order,
      int sender_id,
      String sender_role,
      int reciver_id,
      String reciver_role,
      String message_content,
      [FileImage? image,
      File? sound_file]
      ) {
    this.id = id;
    this.patient_status_conversations_id = patient_status_conversations_id;
    this.message_order = message_order;

    this.sender_id = sender_id;
    this.sender_role = sender_role;

    this.reciver_id = reciver_id;
    this.reciver_role = reciver_role;

    this.message_content = message_content;
    // this.image = image;
    // this.sound_file = sound_file;
  }
}


int all_status_message = 0;

// create_add_status_message(
//     int patientStatusConversationsId,
//     int senderId,
//     String senderRole,
//     int reciverId,
//     String reciverRole,
//     String messageContent,
//     [FileImage? image,
//     File? soundFile]
//     ) {

//       for(int i = 0; i < AllStatusConversations.length ; i++){
//         if(AllStatusConversations[i].id == patientStatusConversationsId){
//             StatusMessage newStatusMessage = StatusMessage.create(
//               all_status_message, // to get id
//               patientStatusConversationsId,
//               AllStatusConversations[i].num_of_status_messages,  // to get current message order inside conversation
//               senderId,
//               senderRole,
//               reciverId,
//               reciverRole,
//               messageContent,
//               image,
//               soundFile
//             );

//             AllStatusConversations[i].status_messages.add(newStatusMessage); // add this message to conversation

//             AllStatusConversations[i].num_of_status_messages++;  // increment num_of_status_messages counter
//         }
//       }

// }






//----------------

class MedicalRecord {
  int? id;

  // Medical staff only
  int? patient_id; // primary key of patient users

  int num_of_status_messages =
      0; // to count number of status messages in current conversation
  // use it in set (id) of each message

  List<Event> status_messages = []; // contain all status_messages
  // status_messages = [{status_message}, {status_message}, .....]

  MedicalRecord();

  MedicalRecord.create(
    int id, int patient_id, int num_of_status_messages) {
    this.id = id;
    this.patient_id = patient_id;
    this.num_of_status_messages = num_of_status_messages;
  }


  add_status_messages(Event msg){
    status_messages.add(msg);
  }


  List<Event> get_all_status_messages(){
    status_messages.sort((a,b) => a.timestamp.compareTo(b.timestamp));
    return status_messages;
  }


}

int all_medical_records_count = 0;

List<MedicalRecord> AllMedicalRecords = [];

int create_medical_record(int patientId, int numOfStatusMessages) {
  MedicalRecord newMedicalRecord = MedicalRecord.create(
      all_status_conversations_count, patientId, numOfStatusMessages);

  AllMedicalRecords.add(newMedicalRecord);

  return all_medical_records_count ++;
}



//---------

