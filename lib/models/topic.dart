import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Topic {
  final String title;
  final String imagePath;
  String id;
  Topic({required this.title, required this.imagePath}) : id = uuid.v4();
}
