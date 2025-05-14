import 'dart:async' show Future;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:my_tasks/models/users.dart';


class UserManager {  

  static const String staffUsersKey = 'staff_users';
  static const String patientUsersKey = 'patient_users';

  // Save the lists to shared preferences
  static Future<void> saveUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final staffUsersJson = AllStaffUsers.map((user) => user.toJson()).toList();
    final patientUsersJson = AllPatientUsers.map((user) => user.toJson()).toList();
    
    await prefs.setString(staffUsersKey, jsonEncode(staffUsersJson));
    await prefs.setString(patientUsersKey, jsonEncode(patientUsersJson));
  }

  // Load the lists from shared preferences
  static Future<void> loadUsers() async {
    final prefs = await SharedPreferences.getInstance();
    
    final staffUsersJson = prefs.getString(staffUsersKey);
    if (staffUsersJson != null) {
      final staffUsersData = jsonDecode(staffUsersJson);
      AllStaffUsers = List<Users>.from(staffUsersData.map((user) => Users.fromJson(user)));
    }

    final patientUsersJson = prefs.getString(patientUsersKey);
    if (patientUsersJson != null) {
      final patientUsersData = jsonDecode(patientUsersJson);
      AllPatientUsers = List<Users>.from(patientUsersData.map((user) => Users.fromJson(user)));
    }

    get_staff_count();
    get_patient_count();
    get_last_user_id();
  }

  // Add a user to the appropriate list
  static void addUser(Users user) async {
    if (user.user_role == 'medical_staff') {
      AllStaffUsers.add(user);
    } else if (user.user_role == 'patient') {
      AllPatientUsers.add(user);
    }
    await saveUsers();
  }

  // Remove a user from the appropriate list
  static void removeUser(int index) {
    if (AllStaffUsers[index] == 'medical_staff') {
      AllStaffUsers[index].isRemoved = true;
    } else if (AllStaffUsers[index] == 'patient') {
      AllStaffUsers[index].isRemoved = true;
    }
    saveUsers();
  }


  // Get a user by their ID from SharedPreferences
  // static Users? getUserById(int id) {
  //   final List<Users> allUsers = user.role == 'medical_staff' ? AllStaffUsers : AllPatientUsers;
    
  //   for (var user in allUsers) {
  //     if (user.id == id) {
  //       return user;
  //     }
  //   }
    
  //   return null; // User with the specified ID not found
  // }

}
