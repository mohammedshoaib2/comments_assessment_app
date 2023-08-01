// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Comment {
  final String name;
  final String email;
  final String body;

  Comment({
    required this.name,
    required this.email,
    required this.body,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'body': body,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      body: map['body'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) =>
      Comment.fromMap(json.decode(source) as Map<String, dynamic>);
}
