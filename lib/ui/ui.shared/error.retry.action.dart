import 'package:dwm_flutter_contact_app/bloc/contacts.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorRetryMessage extends StatelessWidget {

  String errorMessage;
  Function onAction;

  ErrorRetryMessage({this.errorMessage,this.onAction});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("${errorMessage}"),

        // ignore: deprecated_member_use
        RaisedButton(onPressed: onAction,
          child: Text('Retry',
            style: TextStyle(color: Colors.white),), color: Colors.greenAccent,)
      ],
    );
  }
}
