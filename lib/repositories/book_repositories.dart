import 'package:http/http.dart' as http;
import 'package:my_books_to_read/app/data/remote_data_sources/books_remote_data_source.dart';
import 'package:my_books_to_read/models/book_model.dart';

class BooksRepository {
  BooksRepository(this._booksRemoteDataSource);
  final BooksRemoteDataSource _booksRemoteDataSource;
  Future<String> getBooksModel() async {
    _booksRemoteDataSource.getBooksData(bookName: 'lords');
    return '';
    // final url = Uri.parse('http://openlibrary.org/search.json?q=lord');
    // final response = await http.post(url);
    // final bookModel = BooksModel.fromJson(response.body);
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    // print(response);
    // return bookModel.toString();
  }
}
