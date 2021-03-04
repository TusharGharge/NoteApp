import 'package:flutter/foundation.dart';

class Model with ChangeNotifier {
  final String title;
  final String content;

  Model({@required this.title, @required this.content});
}
