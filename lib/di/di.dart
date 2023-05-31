import 'package:get_it/get_it.dart';

import '../data_source/local/local_datasource.dart';
import '../data_source/remote/remote_datasource.dart';
import '../repository/user_repository.dart';

//global instance
// check internet connection or not
final getIt = GetIt.instance;

void initModule() {
  getIt.registerLazySingleton<LocalDataSource>(
    () => LocalDataSource(),
  );
  getIt.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSource(),
  );
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepository(
      getIt(),
      getIt(),
    ),
  );
}
