class ModelBook {
  late final int id;
  late final dynamic price;
  late final String title;
  late final String description;
  late final String category;
  late final String image;
  ModelBook({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
  });
  factory ModelBook.fromjson(jsonData) {
    return ModelBook(
      id: jsonData['id'],
      title: jsonData['title'],
      price: jsonData['price'],
      category: jsonData['category'],
      description: jsonData['description'],
      image: jsonData['image'],
    );
  }
}

// class ModelRating {
//   late final dynamic rate;
//   late final int count;
//   ModelRating({required this.count, required this.rate});
//   factory ModelRating.fromjson(jsonData) {
//     return ModelRating(count: jsonData['count'], rate: jsonData['rate']);
//   }
// }

/// to do
//      //late final ModelRating rating;
//         //required this.rating
//  rating: ModelRating.fromjson(jsonData['rating']),
