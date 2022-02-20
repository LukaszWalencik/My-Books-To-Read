// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_remote_data_source.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _BooksRemoteDataSource implements BooksRemoteDataSource {
  _BooksRemoteDataSource(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://openlibrary.org/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<BookModel?> getBooks(bookName) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>?>(
        _setStreamType<BookModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/search.json?q=${bookName}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
        _result.data == null ? null : BookModel.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
