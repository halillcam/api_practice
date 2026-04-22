class BookShelfModel {
  String libraryName;
  String location;
  List<Books> books;

  BookShelfModel({required this.libraryName, required this.location, required this.books});

  //fromJson

  factory BookShelfModel.fromJson(Map<String, dynamic> json) {
    return BookShelfModel(
      libraryName: json['libraryName'],
      location: json['location'],
      books: (json['books'] as List).map((e) => Books.fromJson(e)).toList(),
    );
  }
  // toJson
  Map<String, dynamic> toJson() {
    return {
      'libraryName': libraryName,
      'location': location,
      'books': books.map((e) => e.toJson()).toList(),
    };
  }
}

class Books {
  String title;
  String author;
  int pages;

  Books({required this.title, required this.author, required this.pages});

  // fromJson
  factory Books.fromJson(Map<String, dynamic> json) {
    return Books(title: json['title'], author: json['author'], pages: json['pages']);
  }

  // toJson
  Map<String, dynamic> toJson() {
    return {'title': title, 'author': author, 'pages': pages};
  }
}
