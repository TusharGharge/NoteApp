import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Details extends StatelessWidget {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
            onPressed: () {
              users.add({
                'title': title.text,
                'content': content.text,
              }).whenComplete(()=>Navigator.of(context).pop);
            },
            child: Text('Save'),
          ),
        ],
      ),
      body: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: TextField(
                  controller: title,
                  decoration: InputDecoration(hintText: 'title'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: TextField(
                    controller: content,
                    maxLines: null,
                    expands: null,
                    decoration: InputDecoration(hintText: 'content'),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
