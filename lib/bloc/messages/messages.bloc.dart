import 'package:bloc/bloc.dart';
import 'package:dwm_flutter_contact_app/bloc/contacts.state.dart';
import 'package:dwm_flutter_contact_app/bloc/messages/messages.action.dart';
import 'package:dwm_flutter_contact_app/bloc/messages/messages.state.dart';
import 'package:dwm_flutter_contact_app/model/messages.model.dart';
import 'package:dwm_flutter_contact_app/repositories/messages.repository.dart';
import 'package:flutter/cupertino.dart';

class MessagesBloc extends Bloc<MessageEvent,MessagesState>{
  MessagesRepository messagesRepository;
  MessagesBloc({@required MessagesState initialState,@required this.messagesRepository}) : super(initialState);

  @override
  Stream<MessagesState> mapEventToState(MessageEvent event) async*{
    if(event is MessagesByContactEvent){
      yield MessagesState(requestState: RequestState.LOADING,messages: state.messages,currentMessageEvent: event);
      try {
        List<Message> data= await messagesRepository.messagesByContact(event.payload.id  );
        yield MessagesState(requestState: RequestState.LOADED,messages: data,currentMessageEvent: event);
      } catch (e) {
        yield MessagesState(requestState: RequestState.ERROR,messageError: e.message,messages: state.messages,currentMessageEvent: event);
      }

    }
  }



}