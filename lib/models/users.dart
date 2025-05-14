// ignore_for_file: non_constant_identifier_names, prefer_initializing_formals

import 'status_conversations.dart';
import 'conversations.dart';

import 'DB_Manegers/user_maneger.dart';

import 'package:uuid/uuid.dart';


class Users {

  late int id;
  late int staff_id;   // index of staff user in AllStaffUsers
  late int patient_id; // index of atient user in AllPatientUsers
  // Medical staff only
  String? username;
  String? email;
  String? passward;

  // Medical staff and patient 
  String? f_name;
  String? l_name;
  String? medical_staff_type;  // Medical staff onlu (dr or nurse)
  String? medical_staff_major; // dr only

  // patient only  // for login
  String? patient_login_id;
  String? secure_code_login;

  // Medical staff only
  String? hospital;
  String? department;

  late String user_role;  // user type (medical_staff or patient)
  DateTime? created_at = DateTime.now();

  late int StatusConversationID;
  late int ConversationChatID;
  late int MedicalRecordID;


  late bool isRemoved = false;

  
  Users(int id, int staff_id, int patient_id, String username, String? email, String? passward, String? f_name, String? l_name, String? medical_staff_type, String? medical_staff_major, String? patient_login_id, String? secure_code_login, String? hospital, String? department, String user_role, int StatusConversationID, int ConversationChatID, int MedicalRecordID){
    this.id = id;
    this.staff_id = staff_id;
    this.patient_id = patient_id;

    this.username = username;
    this.email = email;
    this.passward = passward;
    this.f_name = f_name;
    this.l_name = l_name;
    this.medical_staff_type = medical_staff_type;  
    this.medical_staff_major = medical_staff_major; 
    this.patient_login_id = patient_login_id;
    this.secure_code_login = secure_code_login;
    this.hospital = hospital;
    this.department = department;
    this.user_role = user_role;

    this.StatusConversationID = StatusConversationID;
    this.ConversationChatID = ConversationChatID;
    this.MedicalRecordID = MedicalRecordID;
  }

  Users.fromJsonConstructer(int id, int staff_id, int patient_id, String username, String? email, String? passward, String? f_name, String? l_name, String? medical_staff_type, String? medical_staff_major, String? patient_login_id, String? secure_code_login, String? hospital, String? department, String user_role, DateTime? created_at, int StatusConversationID, int ConversationChatID, int MedicalRecordID, bool isRemoved){
    this.id = id;
    this.staff_id = staff_id;
    this.patient_id = patient_id;

    this.username = username;
    this.email = email;
    this.passward = passward;
    this.f_name = f_name;
    this.l_name = l_name;
    this.medical_staff_type = medical_staff_type;  
    this.medical_staff_major = medical_staff_major; 
    this.patient_login_id = patient_login_id;
    this.secure_code_login = secure_code_login;
    this.hospital = hospital;
    this.department = department;
    this.user_role = user_role;

    this.created_at = created_at;

    this.StatusConversationID = StatusConversationID;
    this.ConversationChatID = ConversationChatID;
    this.MedicalRecordID = MedicalRecordID;

    this.isRemoved = isRemoved;
  }


  Map<String, dynamic> toMap() {
    return {
      'staff_id': staff_id,
      'patient_id': patient_id,
      'username': username,
      'email': email,
      'password': passward, // Note: Typo correction from passward to password
      'f_name': f_name,
      'l_name': l_name,
      'medical_staff_type': medical_staff_type,
      'medical_staff_major': medical_staff_major,
      'patient_login_id': patient_login_id,
      'secure_code_login': secure_code_login,
      'hospital': hospital,
      'department': department,
      'user_role': user_role,
      'created_at': created_at?.toIso8601String(),
      'StatusConversationID': StatusConversationID,
      'ConversationChatID': ConversationChatID,
      'MedicalRecordID': MedicalRecordID,
      'isRemoved': isRemoved ? true : false,
    };
  }


// Define a toJson method to convert Users object to a Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'staff_id': staff_id,
      'patient_id': patient_id,
      'username': username,
      'email': email,
      'password': passward,
      'f_name': f_name,
      'l_name': l_name,
      'medical_staff_type': medical_staff_type,
      'medical_staff_major': medical_staff_major,
      'patient_login_id': patient_login_id,
      'secure_code_login': secure_code_login,
      'hospital': hospital,
      'department': department,
      'user_role': user_role,
      'created_at': created_at?.toIso8601String(), // Convert DateTime to a string
      'StatusConversationID': StatusConversationID,
      'ConversationChatID': ConversationChatID,
      'MedicalRecordID': MedicalRecordID,
      'isRemoved': isRemoved,
    };
  }

  // Define a fromJson factory constructor to create a Users object from a Map
  factory Users.fromJson(Map<String, dynamic> json) {
    return Users.fromJsonConstructer(
      json['id'],
      json['staff_id'],
      json['patient_id'],
      json['username'],
      json['email'],
      json['password'],
      json['f_name'],
      json['l_name'],
      json['medical_staff_type'],
      json['medical_staff_major'],
      json['patient_login_id'],
      json['secure_code_login'],
      json['hospital'],
      json['department'],
      json['user_role'],
      json['created_at'] != null ? DateTime.parse(json['created_at']) : null, // Parse DateTime from the string
      json['StatusConversationID'],
      json['ConversationChatID'],
      json['MedicalRecordID'],
      json['isRemoved'],
    );
  }


}


int all_users_count = 0;

List<Users> AllStaffUsers = [];
int all_staff_users_count = 0;

Future get_staff_count() async {
  all_staff_users_count = AllStaffUsers.length;
}

Future get_last_user_id() async {
  int x = AllPatientUsers.length != 0 ? AllPatientUsers.last.id : -1;
  int y = AllStaffUsers.length != 0 ? AllStaffUsers.last.id : -1;

  try{
      all_users_count = x >= x ? x + 1 : y + 1 ;
  }
  catch (e){
    all_users_count = 2;
  }
}

create_staff_user(String username, String email, String passward, String fName, String lName, String medicalStaffType, String medicalStaffMajor, String patientLoginId, String secureCodeLogin, String hospital, String department, String userRole){

  Users newUser = Users(
    all_users_count, all_staff_users_count, -1,  username,   email,   passward,   fName,   lName,   medicalStaffType,   medicalStaffMajor,   patientLoginId,   secureCodeLogin,   hospital,   department,   userRole, -1, -1, -1
  );

  // AllStaffUsers.add(
  //   newUser
  // );

  UserManager.addUser(newUser);

  all_users_count += 1;
  all_staff_users_count += 1;
  
}

List<Users> AllPatientUsers = [];

int all_patient_users_count = 0;

Future get_patient_count() async {
  all_patient_users_count = AllPatientUsers.length;
}

create_patient_user(String username, String email, String passward, String fName, String lName, String medicalStaffType, String medicalStaffMajor, String hospital, String department, String userRole){

  var uuid = Uuid().v1().substring(0, 5);
  var uuid_pass = Uuid().v1().substring(0, 7);
  String login_id = 'ID$uuid';
  String secure_login_code = '$uuid_pass';

  int status_conversations_id = create_status_conversations(all_patient_users_count, 0);  // Create Status conversaion for this paitent

  int conversation_chat_id = create_conversation_chat(all_patient_users_count, 0);   // Create Chat conversaion for this paitent

  int medical_record_id = create_medical_record(all_patient_users_count, 0);   // Create Medical Record for this paitent

  Users newUser = Users(
    all_users_count, -1 , all_patient_users_count, username,   email,   passward,   fName,   lName,   medicalStaffType,   medicalStaffMajor,   login_id,   secure_login_code,   hospital,   department,   userRole, status_conversations_id, conversation_chat_id, medical_record_id
  );

  // AllPatientUsers.add(
  //   newUser
  // );  

  UserManager.addUser(newUser);

  all_users_count += 1;
  all_patient_users_count += 1;
}