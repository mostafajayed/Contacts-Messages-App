import 'package:dwm_flutter_contact_app/bloc/contacts.bloc.dart';
import 'package:dwm_flutter_contact_app/bloc/contacts.state.dart';
import 'package:dwm_flutter_contact_app/bloc/messages/messages.bloc.dart';
import 'package:dwm_flutter_contact_app/bloc/messages/messages.state.dart';
import 'package:dwm_flutter_contact_app/repositories/contacts.repository.dart';
import 'package:dwm_flutter_contact_app/repositories/messages.repository.dart';
import 'package:dwm_flutter_contact_app/ui/contacts.page.dart';
import 'package:dwm_flutter_contact_app/ui/messages/message.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main(){
  GetIt.instance.registerLazySingleton(()=> new ContactsRepository());
  GetIt.instance.registerLazySingleton(()=> new MessagesRepository());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ContactsBloc(
          initialState: ContactsState(
              contacts: [], errorMessage: '', requestState: RequestState.NONE
          ),
          contactsRepository: new ContactsRepository()
          ,),),
        BlocProvider(create: (context)=>MessagesBloc(
            initialState: MessagesState.initialState(),
          messagesRepository: GetIt.instance<MessagesRepository>()
        ),)
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        routes: {
          '/contacts': (context) => ContactsPage(),
          '/messages':(context)=> MessagesPage(),
        },
        initialRoute: '/contacts',
      ),
    );
  }
}
