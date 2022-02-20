// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../repositories/account_repositories.dart' as _i8;
import '../../repositories/book_repositories.dart' as _i12;
import '../../repositories/favorites_repositories.dart' as _i6;
import '../cubit/autorisation_cubit.dart' as _i4;
import '../data/remote_data_sources/books_remote_data_source.dart' as _i11;
import '../data/remote_data_sources/firebase_data_source.dart' as _i5;
import '../features/bottomnavigationbar/account/cubit/account_cubit.dart'
    as _i3;
import '../features/bottomnavigationbar/booklist/cubit/booklist_cubit.dart'
    as _i13;
import '../features/bottomnavigationbar/myfavorites/cubit/myfavorites_cubit.dart'
    as _i7;
import '../features/login_page/cubit/login_cubit.dart' as _i10;
import 'injection.dart' as _i14; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.AccountCubit>(() => _i3.AccountCubit());
  gh.factory<_i4.AuthorisationCubit>(() => _i4.AuthorisationCubit());
  gh.factory<_i5.FirebaseDataSource>(() => _i5.FirebaseDataSource());
  gh.factory<_i6.ItemRepository>(() => _i6.ItemRepository());
  gh.factory<_i7.MyfavoritesCubit>(
      () => _i7.MyfavoritesCubit(get<_i6.ItemRepository>()));
  gh.factory<String>(() => registerModule.baseUrl, instanceName: 'BaseUrl');
  gh.factory<_i8.AccountRepository>(
      () => _i8.AccountRepository(get<_i5.FirebaseDataSource>()));
  gh.lazySingleton<_i9.Dio>(
      () => registerModule.dio(get<String>(instanceName: 'BaseUrl')));
  gh.factory<_i10.LoginCubit>(
      () => _i10.LoginCubit(get<_i8.AccountRepository>()));
  gh.factory<_i11.BooksRemoteDataSource>(
      () => _i11.BooksRemoteDataSource(get<_i9.Dio>()));
  gh.factory<_i12.BooksRepository>(
      () => _i12.BooksRepository(get<_i11.BooksRemoteDataSource>()));
  gh.factory<_i13.BooklistCubit>(() => _i13.BooklistCubit(
      get<_i12.BooksRepository>(), get<_i6.ItemRepository>()));
  return get;
}

class _$RegisterModule extends _i14.RegisterModule {}
