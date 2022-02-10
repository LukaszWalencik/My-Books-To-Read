// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:json_annotation/json_annotation.dart';
// part 'book_models.g.dart';
// part 'book_models.freezed.dart';

// @freezed
// class BooksModel with _$BooksModel {
//   factory BooksModel(@JsonKey(name: 'title') String bookName) = _BooksModel;

//   factory BooksModel.fromJson(Map<String, dynamic> json) =>
//       _$BooksModelFromJson(json);
// }

// @JsonSerializable()
// class BooksModel {
//   const BooksModel({
//     required this.bookName,
//     // required this.bookAuthor,
//   });
//   @JsonKey(name: 'title')
//   final String bookName;
//   // final String bookAuthor;
//   factory BooksModel.fromJson(Map<String, dynamic> json) =>
//       _$BooksModelFromJson(json);
//   Map<String, dynamic> toJson() => _$BooksModelToJson(this);

//   BooksModel.fromJson(Map<String, dynamic> responseData)
//       : bookName = responseData['docs']['0']['title'];
// }

import 'dart:convert';

class BooksModel {
  BooksModel({
    this.numFound,
    this.start,
    this.numFoundExact,
    this.docs,
    this.bookModelNumFound,
    this.q,
    this.offset,
  });

  int? numFound;
  int? start;
  bool? numFoundExact;
  List<dynamic>? docs;
  int? bookModelNumFound;
  String? q;
  dynamic offset;

  factory BooksModel.fromRawJson(String str) =>
      BooksModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BooksModel.fromJson(Map<String, dynamic> json) => BooksModel(
        numFound: json["numFound"],
        start: json["start"],
        numFoundExact: json["numFoundExact"],
        docs: List<dynamic>.from(json["docs"].map((x) => x)),
        bookModelNumFound: json["num_found"],
        q: json["q"],
        offset: json["offset"],
      );

  Map<String, dynamic> toJson() => {
        "numFound": numFound,
        "start": start,
        "numFoundExact": numFoundExact,
        "docs": List<dynamic>.from(docs!.map((x) => x)),
        "num_found": bookModelNumFound,
        "q": q,
        "offset": offset,
      };
}
