import 'package:dwm_flutter_contact_app/bloc/contacts.bloc.dart';
import 'package:dwm_flutter_contact_app/bloc/contacts.state.dart';
import 'package:dwm_flutter_contact_app/ui/pages/contacts/widgets/contacts.bar.buttons.dart';
import 'package:dwm_flutter_contact_app/ui/pages/contacts/widgets/contacts.list.dart';
import 'package:dwm_flutter_contact_app/ui/ui.shared/error.retry.action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({Key key}) : super(key: key);

  String get errorMessage => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contacts'),),
      body: Column(
        children: [
          ContactsBarButtons(),
          Expanded(
            child: BlocBuilder<ContactsBloc, ContactsState>(builder: (context, state){
              if(state.requestState == RequestState.LOADING){
                return Center(child: CircularProgressIndicator());
              } else if(state.requestState == RequestState.ERROR){
                return ErrorRetryMessage(
                  errorMessage: state.errorMessage,
                  onAction: (){
                    context.read<ContactsBloc>().add(state.currentEvent);
                  },
                );
              } else if(state.requestState == RequestState.LOADED){
                return ContactsList(
                  contacts: state.contacts,
                );
              } else {
                return Container();
              }
            }),
          )
        ],
      )
    );
  }
}
