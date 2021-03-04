import 'package:flutter/material.dart';

class ListDetails extends StatelessWidget {
  final String title;
  final String content;
  ListDetails({this.title, this.content});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 10,
            ),
          ),
          Text(
            content,
            style: TextStyle(
              fontSize: 8,
            ),
          ),
        ],
      ),
    );
  }
}
