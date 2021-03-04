import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Editnote extends StatefulWidget {
  DocumentSnapshot doctoEdit;
  EditNote({this.doctoEdit});
  @override
  _EditnoteState createState() => _EditnoteState();
}

class _EditnoteState extends State<Editnote> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  @override
  void initState() {
    title = TextEditingController(
      text: widget.doctoEdit.data()['title'],
    );
    content = TextEditingController(
      text: widget.doctoEdit.data()['content'],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
            onPressed: () {
              widget.doctoEdit.reference.update({
                'title': title.text,
                'content': content.text,
              }).whenComplete(() => Navigator.of(context).pop);
              // users.add({
              //   'title': title.text,
              //   'content': content.text,
              // }).whenComplete(()=>Navigator.of(context).pop);
            },
            child: Text('Save'),
          ),
          FlatButton(
            onPressed: () {
              widget.doctoEdit.reference
                  .delete()
                  .whenComplete(() => Navigator.of(context).pop);
              // users.add({
              //   'title': title.text,
              //   'content': content.text,
              // }).whenComplete(()=>Navigator.of(context).pop);
            },
            child: Text('Delete'),
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
