import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final int userId;
  final int id;
  final String title;
  final String body;

  const Quote({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Quote.fromJSON(Map<String, dynamic> map) {
    return Quote(
      userId: map['userId'],
      id: map['id'],
      title: map['title'],
      body: map['body'],
    );
  }

  @override
  List<Object> get props => [userId, id, title, body];

  @override
  String toString() {
    return "Quote { id : $id }";
  }
}
