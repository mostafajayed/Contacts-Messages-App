import 'package:dwm_flutter_contact_app/model/contact.model.dart';

abstract class MessageEvent<T>{
  T payload;

  MessageEvent(this.payload);
}

class MessagesByContactEvent extends MessageEvent<Contact>{
  MessagesByContactEvent(Contact payload) : super(payload);

}