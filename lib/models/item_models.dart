class ItemModels {
  ItemModels({
    required this.id,
    required this.name,
    required this.author,
  });

  final String id;
  final String name;
  final String author;
}

class BooksModel {
  const BooksModel({
    required this.bookName,
    // required this.bookAuthor,
  });

  final String bookName;
  // final String bookAuthor;

  BooksModel.fromJson(Map<String, dynamic> responseData)
      : bookName = responseData['docs']['0']['title'];
}
