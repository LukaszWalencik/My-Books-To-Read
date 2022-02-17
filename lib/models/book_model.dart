import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_model.freezed.dart';
part 'book_model.g.dart';

@freezed
class BookModel with _$BookModel {
  factory BookModel(List<Doc> docs) = _BookModel;

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);
}

// @JsonSerializable()
// class BookModel {
//   BookModel({
//     required this.docs,
//   });

//   List<Doc> docs;

//   factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
//         docs: List<Doc>.from(json["docs"].map((x) => Doc.fromJson(x))),
//       );
// }

@freezed
class Doc with _$Doc {
  factory Doc(
    @JsonKey(name: 'cover_i') int? coverI,
    @JsonKey(name: 'author_name') List<String>? authorName,
    String title,
  ) = _Doc;

  factory Doc.fromJson(Map<String, dynamic> json) => _$DocFromJson(json);
}

// @JsonSerializable()
// class Doc {
//   Doc({
//     this.coverI,
//     required this.title,
//     this.authorName,
//   });

//   int? coverI;
//   String title;
//   List<String>? authorName;

//   factory Doc.fromJson(Map<String, dynamic> json) => Doc(
//         coverI: json["cover_i"],
//         title: json["title"],
//         authorName: List<String>.from(json["author_name"].map((x) => x)),
//       );
// }
