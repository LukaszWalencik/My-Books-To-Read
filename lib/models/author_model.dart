import 'package:json_annotation/json_annotation.dart';
part 'author_model.g.dart';

@JsonSerializable()
class AuthorModel {
  const AuthorModel({
    required this.name,
  });

  final String name;

  factory AuthorModel.fromJson(Map<String, dynamic> json) =>
      _$AuthorModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorModelToJson(this);
}
