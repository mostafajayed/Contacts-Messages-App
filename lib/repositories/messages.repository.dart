import 'dart:math';

import 'package:dwm_flutter_contact_app/model/messages.model.dart';


class MessagesRepository{
  Map<int,Message> messages={
    1:Message(id: 1,contactId:1,date: DateTime.now(),content: 'Hello Moha',type: 'sent' ),
    2:Message(id: 2,contactId:1 ,date: DateTime.now(),content: "Okay thank's",type: 'received' ),
    3:Message(id: 3,contactId:1,date: DateTime.now(),content: 'What are u doing',type: 'sent' ),
    4:Message(id: 4,contactId:1,date: DateTime.now(),content: 'No thing ',type: 'received' ),
    5:Message(id: 5,contactId:2,date: DateTime.now(),content: 'Hi you',type: 'sent' ),
    6:Message(id: 6,contactId:2,date: DateTime.now(),content: 'Well received ',type: 'received' ),

  };

  Future<List<Message>> allMessages() async {
   var future= await Future.delayed(Duration(seconds: 1));
   int rnd=new Random().nextInt(10);
    if(rnd>1){
      return messages.values.toList();
    }
    else{
      throw new Exception('Internet Error');
    }
  }

  Future<List<Message>> messagesByContact(int id) async {
    var future= await Future.delayed(Duration(seconds: 1));
    int rnd=new Random().nextInt(10);
    if(rnd>1){
      Object contactId;
      return messages.values.toList().where((element) => element.contactId=contactId);
    }
    else{
      throw new Exception('Internet Error');
    }
  }
}