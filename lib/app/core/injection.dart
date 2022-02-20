import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:my_books_to_read/app/core/injection.config.dart';

final injection = GetIt.instance;

@InjectableInit()
void njectionDependecies() => $initGetIt(injection);

@module
abstract class RegisterModule {
  @Named("BaseUrl")
  String get baseUrl => 'http://openlibrary.org/';

  @lazySingleton
  Dio dio(@Named('BaseUrl') String url) => Dio(BaseOptions(baseUrl: url));
}
