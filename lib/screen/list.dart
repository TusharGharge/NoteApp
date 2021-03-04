import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './details.dart';
import './editnote.dart';

class List extends StatelessWidget {
  final ref = FirebaseFirestore.instance.collection('notes');
  @override
  Widget build(BuildContext context) {
    //final content = Provider.of<Model>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Noteapp"),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Details()));
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => Details()));
        },
      ),
      body: StreamBuilder(
          stream: ref.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            Editnote(doctoEdit: snapshot.data.docs[index])));
              },
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20),
                  itemCount: snapshot.hasData ? snapshot.data.docs.length : 0,
                  itemBuilder: (_, index) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      height: 150,
                      color: Colors.grey,
                      child: Column(
                        children: [
                          Text(
                            snapshot.data.docs[index].data()['title'],
                          ),
                          Text(snapshot.data.docs[index].data()['content']),
                        ],
                      ),
                    );
                  }),
            );
          }),
    );
  }
}
