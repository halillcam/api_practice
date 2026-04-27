class FakeStoreModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  // Rating? rating;

  FakeStoreModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    //this.rating,
  });

  FakeStoreModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    // rating = Rating.fromJson(json['rating']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      // 'rating': rating!.toJson(),
    };
  }
}

/*
class Rating {
  double? rate;
  int? count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(rate: json['rate'], count: json['count']);
  }

  Map<String, dynamic> toJson() {
    return {'rate': rate, 'count': count};
  }
}*/
