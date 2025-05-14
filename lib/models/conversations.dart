// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_tasks/models/DB_Manegers/conv_chat_maneger.dart';

import 'DB_Manegers/conv_chat_maneger.dart';

// in this file, you can create (ConversationsChats) between staffs and paitent
// and return all messages inside current conversation

// you can create and add new message to conversaion


class ConversationsChats {
  int? id;

  // Medical staff only
  late int patient_id; // id of patient (index in AllPatientUsers list)

  late int num_of_messages; // to count number of messages in current conversation
  // use it in set (id) of each message

  List<Message> messages = []; // contain all messages between both sides
  // messages = [{message}, {message}, .....]

  late int send_count = 1;
  bool is_blocked = false;

  late int unread_msgs = 0;

  late bool show_patient_snack = false;


  ConversationsChats.create(int this.id, this.patient_id,this.num_of_messages);

  ConversationsChats.fromJsonConstructor(int id, patient_id, int num_of_messages, List<Message> messages, int send_count, bool is_blocked, int unread_msgs, bool show_patient_snack){
    this.id = id;
    this.patient_id = patient_id;
    this.num_of_messages = num_of_messages;
    this.messages = messages;
    this.send_count = send_count;
    this.is_blocked = is_blocked;
    this.unread_msgs = unread_msgs;
    this.show_patient_snack = show_patient_snack;
  }

  add_messages_to_conversation(Message msg){
  messages.add(msg);
}


  // Convert ConversationsChats object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patient_id': patient_id,
      'num_of_messages': num_of_messages,
      'messages': messages.map((message) => message.toJson()).toList(),
      'send_count': send_count,
      'is_blocked': is_blocked,
      'unread_msgs': unread_msgs,
      'show_patient_snack': show_patient_snack,
    };
  }

    // Create a ConversationsChats object from JSON
  factory ConversationsChats.fromJson(Map<String, dynamic> json) {
    return ConversationsChats.fromJsonConstructor(
      json['id'],
      json['patient_id'],
      json['num_of_messages'],
      List<Message>.from(
        (json['messages'] as List).map((message) => Message.fromJson(message)),
      ),
      json['send_count'],
      json['is_blocked'],
      json['unread_msgs'],
      json['show_patient_snack'],
    );
  }

}

int all_conversations_chats_count = 0;

List<ConversationsChats> AllConversationsChats = [];


Future get_conv_chats_count() async {
  all_conversations_chats_count = AllConversationsChats.length;
}

int create_conversation_chat(int patient_id, int num_of_messages) {
  ConversationsChats new_conversation_chat = ConversationsChats.create(
      all_conversations_chats_count, patient_id, num_of_messages);

  // AllConversationsChats.add(new_conversation_chat);

  ConvChatManager.addConvChat(new_conversation_chat);

  return all_conversations_chats_count ++;
}


List<Message> get_all_conversation_messages(int ConversationChatID){

  for (int i = 0 ; i < AllConversationsChats.length ; i++){
    if(AllConversationsChats[i].id == ConversationChatID){
      AllConversationsChats[i].messages.sort((a,b) => a.message_order.compareTo(b.message_order));

      return AllConversationsChats[i].messages;
    }
  }
  List<Message> temp = [];
  return temp;
}


//--------------------------


class Message {
  late int id; // of current message
  int? conversaion_id; // of current conversation

  late int message_order;

  late int sender_id;
  late String sender_role; // Medical staff or patient

  late int? reciver_id;
  late String? reciver_role; // Medical staff or patient

  late String message_content;
  FileImage? image;
  File? sound_file;

  DateTime created_at = DateTime.now();

  Message.create(
      this.id,
      this.message_order,
      this.sender_id,
      this.sender_role,
      this.reciver_id,
      this.reciver_role,
      this.message_content,
      [this.image,
      this.sound_file]
      );


  Message.fromJsonConstructor(int id, int message_order, int sender_id, String sender_role, int? reciver_id,  reciver_role, String message_content, FileImage? image, File? sound_file, DateTime created_at ){
    this.id = id;
    this.message_order = message_order;
    this.sender_id = sender_id;
    this.sender_role = sender_role;
    this.reciver_id = reciver_id;
    this.reciver_role = reciver_role;
    this.message_content = message_content;
    this.image = image;
    this.sound_file = sound_file;
    this.created_at = created_at;

  }

    // Convert Message object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'conversation_id': conversaion_id,
      'message_order': message_order,
      'sender_id': sender_id,
      'sender_role': sender_role,
      'receiver_id': reciver_id,
      'receiver_role': reciver_role,
      'message_content': message_content,
      'image': image,
      'sound_file': sound_file,
      'created_at': created_at.toIso8601String(),
    };
  }


    // Create a Message object from JSON
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message.fromJsonConstructor(
      json['id'],
      json['message_order'],
      json['sender_id'],
      json['sender_role'],
      json['receiver_id'],
      json['receiver_role'],
      json['message_content'],
      json['imageBase64'],
      json['soundFileBase64'],
      DateTime.parse(json['created_at']),
    );
  }


}

int all_message_count = 0;

Future create_add_message_to_conversation(
    int CurrentConversationsChatId,  // id of current conversaion chat
    int sender_id,
    String sender_role,
    int reciver_id,
    String reciver_role,
    String message_content,
    [FileImage? image,
    File? sound_file]
    ) async {


       for(int i = 0; i < AllConversationsChats.length ; i++){
        if(AllConversationsChats[i].id == CurrentConversationsChatId){
            
            Message new_message = Message.create(
            all_message_count, // to get current message id
            AllConversationsChats[i].num_of_messages,  // to get current message order inside conversation
            sender_id,
            sender_role,
            reciver_id,
            reciver_role,
            message_content,
            image,
            sound_file
            );

            AllConversationsChats[i].messages.add(new_message); // add this message to conversation

            AllConversationsChats[i].num_of_messages++;  // increment num_of_status_messages counter
        
            AllConversationsChats[i].messages.sort((a, b) => a.created_at.compareTo(b.created_at));
            AllConversationsChats[i].messages = AllConversationsChats[i].messages.reversed.toList();

            await ConvChatManager.saveConvChats();

            break;
        }
      }

  all_message_count += 1;
}
