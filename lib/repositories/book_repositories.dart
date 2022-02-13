import 'package:http/http.dart' as http;
import 'package:my_books_to_read/app/data/remote_data_sources/books_remote_data_source.dart';
import 'package:my_books_to_read/models/book_model.dart';

class BooksRepository {
  BooksRepository(this._booksRemoteDataSource);
  final BooksRemoteDataSource _booksRemoteDataSource;

  Future<BookModel?> getBooksModel({required String title}) async {
    final responseData =
        await _booksRemoteDataSource.getBooksData(bookName: title);

    final name = responseData['docs'][0]['title'] as String;

    _booksRemoteDataSource.getBooksData(bookName: name);

    return BookModel(title: name);

    //   final url = Uri.parse('http://openlibrary.org/search.json?q=lord');
    //   final response = await http.post(url);
    //   final bookModel = BookModel.fromJson(response.body);
    //   print('Response status: ${response.statusCode}');
    //   print('Response body: ${response.body}');
    //   print(response);
    //   return bookModel.toString();
    // }
  }
}
