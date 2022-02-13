// import 'package:json_annotation/json_annotation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'book_model.freezed.dart';
part 'book_model.g.dart';

@freezed
class BookModel with _$BookModel {
  factory BookModel(
    String title,
    @JsonKey(name: 'author_name') String authorName,
  ) = _BookModel;

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);
}

// @JsonSerializable()
// class BookModel {
//   const BookModel({
//     required this.title,
//     required this.authorName,
//   });

//   final String title;

//   @JsonKey(name: 'author_name')
//   final String authorName;

//   factory BookModel.fromJson(Map<String, dynamic> json) =>
//       _$BookModelFromJson(json);
//   Map<String, dynamic> toJson() => _$BookModelToJson(this);
// }

//   BookModel.fromJson(Map<String, dynamic> json)
//       : title = json['title'],
//         authorName = json['author_name'];
// }
