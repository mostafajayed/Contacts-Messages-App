import 'package:dwm_flutter_contact_app/bloc/messages/messages.action.dart';
import 'package:dwm_flutter_contact_app/bloc/messages/messages.bloc.dart';
import 'package:dwm_flutter_contact_app/bloc/messages/messages.state.dart';
import 'package:dwm_flutter_contact_app/model/contact.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class MessagesPage extends StatelessWidget {
Contact contact;
  @override
  Widget build(BuildContext context) {
    this.contact=ModalRoute.of(context).settings.arguments;
    context.read<MessagesBloc>().add(MessagesByContactEvent(this.contact));
    return Scaffold(
      appBar: AppBar(title:Text('Messages de ${contact.name}') ,),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  child: Text('${contact.profile}'),),
                SizedBox(width: 10,),
                Text('${contact.name}')
              ],
            ),
          ),
          BlocBuilder<MessagesBloc,MessagesState>(
            builder:(context,state){
              return  Expanded(
              child: Container(
              child: Text('Messages List'),
              ),
              );
            },

          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.bottomLeft,
            child: Text('Messages Form'),
          )
        ],
      ),
    );
  }
}
