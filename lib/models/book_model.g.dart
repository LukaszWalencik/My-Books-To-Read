// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BookModel _$$_BookModelFromJson(Map<String, dynamic> json) => _$_BookModel(
      (json['docs'] as List<dynamic>)
          .map((e) => Doc.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BookModelToJson(_$_BookModel instance) =>
    <String, dynamic>{
      'docs': instance.docs,
    };

_$_Doc _$$_DocFromJson(Map<String, dynamic> json) => _$_Doc(
      json['cover_i'] as int?,
      (json['author_name'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['title'] as String,
    );

Map<String, dynamic> _$$_DocToJson(_$_Doc instance) => <String, dynamic>{
      'cover_i': instance.coverI,
      'author_name': instance.authorName,
      'title': instance.title,
    };
