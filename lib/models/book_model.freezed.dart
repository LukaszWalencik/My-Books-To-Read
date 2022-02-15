// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'book_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookModel _$BookModelFromJson(Map<String, dynamic> json) {
  return _BookModel.fromJson(json);
}

/// @nodoc
class _$BookModelTearOff {
  const _$BookModelTearOff();

  _BookModel call(List<Doc> docs) {
    return _BookModel(
      docs,
    );
  }

  BookModel fromJson(Map<String, Object?> json) {
    return BookModel.fromJson(json);
  }
}

/// @nodoc
const $BookModel = _$BookModelTearOff();

/// @nodoc
mixin _$BookModel {
  List<Doc> get docs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookModelCopyWith<BookModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookModelCopyWith<$Res> {
  factory $BookModelCopyWith(BookModel value, $Res Function(BookModel) then) =
      _$BookModelCopyWithImpl<$Res>;
  $Res call({List<Doc> docs});
}

/// @nodoc
class _$BookModelCopyWithImpl<$Res> implements $BookModelCopyWith<$Res> {
  _$BookModelCopyWithImpl(this._value, this._then);

  final BookModel _value;
  // ignore: unused_field
  final $Res Function(BookModel) _then;

  @override
  $Res call({
    Object? docs = freezed,
  }) {
    return _then(_value.copyWith(
      docs: docs == freezed
          ? _value.docs
          : docs // ignore: cast_nullable_to_non_nullable
              as List<Doc>,
    ));
  }
}

/// @nodoc
abstract class _$BookModelCopyWith<$Res> implements $BookModelCopyWith<$Res> {
  factory _$BookModelCopyWith(
          _BookModel value, $Res Function(_BookModel) then) =
      __$BookModelCopyWithImpl<$Res>;
  @override
  $Res call({List<Doc> docs});
}

/// @nodoc
class __$BookModelCopyWithImpl<$Res> extends _$BookModelCopyWithImpl<$Res>
    implements _$BookModelCopyWith<$Res> {
  __$BookModelCopyWithImpl(_BookModel _value, $Res Function(_BookModel) _then)
      : super(_value, (v) => _then(v as _BookModel));

  @override
  _BookModel get _value => super._value as _BookModel;

  @override
  $Res call({
    Object? docs = freezed,
  }) {
    return _then(_BookModel(
      docs == freezed
          ? _value.docs
          : docs // ignore: cast_nullable_to_non_nullable
              as List<Doc>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BookModel implements _BookModel {
  _$_BookModel(this.docs);

  factory _$_BookModel.fromJson(Map<String, dynamic> json) =>
      _$$_BookModelFromJson(json);

  @override
  final List<Doc> docs;

  @override
  String toString() {
    return 'BookModel(docs: $docs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BookModel &&
            const DeepCollectionEquality().equals(other.docs, docs));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(docs));

  @JsonKey(ignore: true)
  @override
  _$BookModelCopyWith<_BookModel> get copyWith =>
      __$BookModelCopyWithImpl<_BookModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookModelToJson(this);
  }
}

abstract class _BookModel implements BookModel {
  factory _BookModel(List<Doc> docs) = _$_BookModel;

  factory _BookModel.fromJson(Map<String, dynamic> json) =
      _$_BookModel.fromJson;

  @override
  List<Doc> get docs;
  @override
  @JsonKey(ignore: true)
  _$BookModelCopyWith<_BookModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Doc _$DocFromJson(Map<String, dynamic> json) {
  return _Doc.fromJson(json);
}

/// @nodoc
class _$DocTearOff {
  const _$DocTearOff();

  _Doc call(@JsonKey(name: 'cover_i') int? coverI,
      @JsonKey(name: 'author_name') List<String>? authorName, String title) {
    return _Doc(
      coverI,
      authorName,
      title,
    );
  }

  Doc fromJson(Map<String, Object?> json) {
    return Doc.fromJson(json);
  }
}

/// @nodoc
const $Doc = _$DocTearOff();

/// @nodoc
mixin _$Doc {
  @JsonKey(name: 'cover_i')
  int? get coverI => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_name')
  List<String>? get authorName => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DocCopyWith<Doc> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocCopyWith<$Res> {
  factory $DocCopyWith(Doc value, $Res Function(Doc) then) =
      _$DocCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'cover_i') int? coverI,
      @JsonKey(name: 'author_name') List<String>? authorName,
      String title});
}

/// @nodoc
class _$DocCopyWithImpl<$Res> implements $DocCopyWith<$Res> {
  _$DocCopyWithImpl(this._value, this._then);

  final Doc _value;
  // ignore: unused_field
  final $Res Function(Doc) _then;

  @override
  $Res call({
    Object? coverI = freezed,
    Object? authorName = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      coverI: coverI == freezed
          ? _value.coverI
          : coverI // ignore: cast_nullable_to_non_nullable
              as int?,
      authorName: authorName == freezed
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$DocCopyWith<$Res> implements $DocCopyWith<$Res> {
  factory _$DocCopyWith(_Doc value, $Res Function(_Doc) then) =
      __$DocCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'cover_i') int? coverI,
      @JsonKey(name: 'author_name') List<String>? authorName,
      String title});
}

/// @nodoc
class __$DocCopyWithImpl<$Res> extends _$DocCopyWithImpl<$Res>
    implements _$DocCopyWith<$Res> {
  __$DocCopyWithImpl(_Doc _value, $Res Function(_Doc) _then)
      : super(_value, (v) => _then(v as _Doc));

  @override
  _Doc get _value => super._value as _Doc;

  @override
  $Res call({
    Object? coverI = freezed,
    Object? authorName = freezed,
    Object? title = freezed,
  }) {
    return _then(_Doc(
      coverI == freezed
          ? _value.coverI
          : coverI // ignore: cast_nullable_to_non_nullable
              as int?,
      authorName == freezed
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Doc implements _Doc {
  _$_Doc(@JsonKey(name: 'cover_i') this.coverI,
      @JsonKey(name: 'author_name') this.authorName, this.title);

  factory _$_Doc.fromJson(Map<String, dynamic> json) => _$$_DocFromJson(json);

  @override
  @JsonKey(name: 'cover_i')
  final int? coverI;
  @override
  @JsonKey(name: 'author_name')
  final List<String>? authorName;
  @override
  final String title;

  @override
  String toString() {
    return 'Doc(coverI: $coverI, authorName: $authorName, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Doc &&
            const DeepCollectionEquality().equals(other.coverI, coverI) &&
            const DeepCollectionEquality()
                .equals(other.authorName, authorName) &&
            const DeepCollectionEquality().equals(other.title, title));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(coverI),
      const DeepCollectionEquality().hash(authorName),
      const DeepCollectionEquality().hash(title));

  @JsonKey(ignore: true)
  @override
  _$DocCopyWith<_Doc> get copyWith =>
      __$DocCopyWithImpl<_Doc>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DocToJson(this);
  }
}

abstract class _Doc implements Doc {
  factory _Doc(
      @JsonKey(name: 'cover_i') int? coverI,
      @JsonKey(name: 'author_name') List<String>? authorName,
      String title) = _$_Doc;

  factory _Doc.fromJson(Map<String, dynamic> json) = _$_Doc.fromJson;

  @override
  @JsonKey(name: 'cover_i')
  int? get coverI;
  @override
  @JsonKey(name: 'author_name')
  List<String>? get authorName;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$DocCopyWith<_Doc> get copyWith => throw _privateConstructorUsedError;
}
