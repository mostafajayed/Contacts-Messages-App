import 'package:dwm_flutter_contact_app/bloc/contacts.actions.dart';
import 'package:dwm_flutter_contact_app/bloc/contacts.bloc.dart';
import 'package:dwm_flutter_contact_app/ui/pages/contacts/widgets/contacts.button.item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ContactsBarButtons extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ContactsButttonItem(buttonlabel: 'All Contacts',contactsEvent: new LoadAllContacsEvent(),),
          ContactsButttonItem(buttonlabel: 'Students',contactsEvent: new LoadStudentsEvent(),),
          ContactsButttonItem(buttonlabel: 'Developers',contactsEvent: new LoadDevelopersEvent(),),
              ],
      ),
    );
  }

}