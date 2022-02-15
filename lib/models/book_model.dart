import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

// part 'book_model.freezed.dart';
part 'book_model.g.dart';

class BookModel {
  BookModel({
    this.docs,
  });

  List<Doc>? docs;

  factory BookModel.fromRawJson(String str) =>
      BookModel.fromJson(json.decode(str));

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        docs: List<Doc>.from(json["docs"].map((x) => Doc.fromJson(x))),
      );
}

class Doc {
  Doc({
    this.coverI,
    required this.title,
    this.authorName,
  });

  int? coverI;
  String title;
  List<String>? authorName;

  factory Doc.fromRawJson(String str) => Doc.fromJson(json.decode(str));

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
        coverI: json["cover_i"],
        title: json["title"],
        authorName: List<String>.from(json["author_name"].map((x) => x)),
      );
}
