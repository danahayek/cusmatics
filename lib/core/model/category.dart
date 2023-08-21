
class CategoryModel{
  String? image;
  String? title;
  String? price;
  String? oldPrice;
  String? city;
  String? description;
  String? category;
  Rating? rating;
  int? id;

  CategoryModel(this.image,
      this.title,
      this.price,
      this.oldPrice,
      this.city
      );

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
  }
}