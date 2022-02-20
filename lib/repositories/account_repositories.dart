import 'package:injectable/injectable.dart';
import 'package:my_books_to_read/app/data/remote_data_sources/firebase_data_source.dart';

@injectable
class AccountRepository {
  AccountRepository(this.firebaseDataSource);

  final FirebaseDataSource firebaseDataSource;

  Future<void> signOut() async {
    await firebaseDataSource.signOut();
  }

  Future<void> signUp(String email, String password) async {
    await firebaseDataSource.signUp(email, password);
  }

  Future<void> signIn(String email, String password) async {
    await firebaseDataSource.singIn(email, password);
  }
}
