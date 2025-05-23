import 'package:flutter/material.dart';
import 'package:my_tasks/pages/staff_side/conversation.dart';


class ChatItem extends StatefulWidget {

  final String dp;
  final String name;
  final String time;
  final String msg;
  final bool isOnline;
  final int counter;

  final int patient_id;

  const ChatItem({
    super.key,
    required this.dp,
    required this.name,
    required this.time,
    required this.msg,
    required this.isOnline,
    required this.counter,
    required this.patient_id,
  });

  @override
  _ChatItemState createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: Stack(
          children: <Widget>[
            // CircleAvatar(
            //   backgroundImage: AssetImage(
            //     widget.dp,
            //   ),
            //   radius: 25,
            // ),

            const CircleAvatar(
                      backgroundColor: Color.fromARGB(
                        255, 48, 135, 221), // لون الخلفية للشعار
                      child: Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 255, 255, 255), // لون الأيقونة باللون الأسود
                      ),
                    ),

            Positioned(
              bottom: 0.0,
              left: 6.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                height: 11,
                width: 11,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.isOnline
                          ?Colors.greenAccent
                          :Colors.grey,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    height: 7,
                    width: 7,
                  ),
                ),
              ),
            ),

          ],
        ),

        title: Text(
          widget.name,
          maxLines: 1,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          widget.msg,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            const SizedBox(height: 10),
            Text(
              widget.time,
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 11,
              ),
            ),

            const SizedBox(height: 5),
            widget.counter == 0
                ?const SizedBox()
                :Container(
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(6),
              ),
              constraints: const BoxConstraints(
                minWidth: 11,
                minHeight: 11,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 1, left: 5, right: 5),
                child:Text(
                  "${widget.counter}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        onTap: (){
          Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute(
              builder: (BuildContext context){
                return Conversation(patient_id : widget.patient_id);
              },
            ),
          );
        },
      ),
    );
  }
}
