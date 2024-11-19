class Productmodel {
  int id;
  String title;
  String description;
  String category;
  double price;
  double discountPercentage;
  double rating;
  int stock;
  List<dynamic> tags;
  String brand;
  String sku;
  int weight;
  Map<String, dynamic> dimensions;
  String warrantyInformation;
  String shippingInformation;
  String availabilityStatus;
  List<dynamic> reviews;
  String returnPolicy;
  int minimumOrderQuantity;
  Map<String, dynamic> meta;
  List<dynamic> images;
  String thumbnail;

  Productmodel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    required this.thumbnail,
  });

  factory Productmodel.fromJson(Map<String, dynamic> productData) {
    return Productmodel(
      id: productData["id"],
      title: productData["title"] ?? "",
      description: productData["description"] ?? "",
      category: productData["category"] ?? "",
      price: (productData["price"] ?? 0).toDouble(),
      discountPercentage: (productData["discountPercentage"] ?? 0).toDouble(),
      rating: (productData["rating"] ?? 0).toDouble(),
      stock: productData["stock"] ?? 0,
      tags: productData["tags"] ?? [],
      brand: productData["brand"] ?? "",
      sku: productData["sku"] ?? "",
      weight: productData["weight"] ?? 0,
      dimensions: productData["dimensions"] ?? {},
      warrantyInformation: productData["warrantyInformation"] ?? "",
      shippingInformation: productData["shippingInformation"] ?? "",
      availabilityStatus: productData["availabilityStatus"] ?? "",
      reviews: productData["reviews"] ?? [],
      returnPolicy: productData["returnPolicy"] ?? "",
      minimumOrderQuantity: productData["minimumOrderQuantity"] ?? 0,
      meta: productData["meta"] ?? {},
      images: productData["images"] ?? [],
      thumbnail: productData["thumbnail"] ?? "",
    );
  }


  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "category": category,
      "price": price,
      "discountPercentage": discountPercentage,
      "rating": rating,
      "stock": stock,
      "tags": tags,
      "brand": brand,
      "sku": sku,
      "weight": weight,
      "dimensions": dimensions,
      "warrantyInformation": warrantyInformation,
      "shippingInformation": shippingInformation,
      "availabilityStatus": availabilityStatus,
      "reviews": reviews,
      "returnPolicy": returnPolicy,
      "minimumOrderQuantity": minimumOrderQuantity,
      "meta": meta,
      "images": images,
      "thumbnail": thumbnail,
    };
  }
}
