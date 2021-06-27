import 'package:dwm_flutter_contact_app/bloc/contacts.state.dart';
import 'package:dwm_flutter_contact_app/bloc/messages/messages.action.dart';
import 'package:dwm_flutter_contact_app/model/messages.model.dart';

class MessagesState{
  RequestState requestState;
  List<Message>messages;
  String messageError;
  MessageEvent currentMessageEvent;

  MessagesState(
      {this.requestState,
      this.messages,
      this.messageError,
      this.currentMessageEvent});

  MessagesState.initialState():
      requestState =RequestState.NONE,
  messages=[],messageError='',currentMessageEvent=null;
}