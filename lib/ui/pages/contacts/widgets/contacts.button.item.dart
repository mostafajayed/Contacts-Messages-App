import 'package:dwm_flutter_contact_app/bloc/contacts.actions.dart';
import 'package:dwm_flutter_contact_app/bloc/contacts.bloc.dart';
import 'package:dwm_flutter_contact_app/bloc/contacts.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsButttonItem extends StatelessWidget {
  String buttonlabel;
  ContactsEvent contactsEvent;

ContactsButttonItem({this.buttonlabel,this.contactsEvent});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ContactsBloc,ContactsState>(
      builder: (context,state){
        return Container(
          padding: EdgeInsets.fromLTRB(6,2,6,2),
          decoration: BoxDecoration(
              border: Border.all(
                  width: (state.currentEvent.runtimeType==contactsEvent.runtimeType)?2:0,
                  color: Colors.deepOrange)
          ),
          // ignore: deprecated_member_use
          child: RaisedButton(onPressed: () => {
            context.read<ContactsBloc>().add(contactsEvent)
          },
            child:
            Text(buttonlabel,
                style: TextStyle(color: Colors.white)),
            color: Colors.amber,),
        );
      },

    );

  }
}
