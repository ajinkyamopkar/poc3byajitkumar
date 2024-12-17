class FavModel {
  int? status;
  String? message;
  List<FavData>? data;

  FavModel({this.status, this.message, this.data});

  FavModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <FavData>[];
      json['data'].forEach((v) {
        data!.add(new FavData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FavData {
  String? sId;
  ProductId? productId;
  CategoryId? categoryId;
  String? userId;
  String? createdAt;
  String? updatedAt;

  FavData(
      {this.sId,
      this.productId,
      this.categoryId,
      this.userId,
      this.createdAt,
      this.updatedAt});

  FavData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    productId = json['product_id'] != null
        ? new ProductId.fromJson(json['product_id'])
        : null;
    categoryId = json['category_id'] != null
        ? new CategoryId.fromJson(json['category_id'])
        : null;
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.productId != null) {
      data['product_id'] = this.productId!.toJson();
    }
    if (this.categoryId != null) {
      data['category_id'] = this.categoryId!.toJson();
    }
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ProductId {
  String? sId;
  String? name;
  int? price;
  double? rating;
  String? description;
  List<String>? sizechart;
  List<String>? colorchart;
  List<String>? image;
  String? categoryId;
  String? salecategoryId;
  String? gender;
  String? createdAt;
  String? updatedAt;

  ProductId(
      {this.sId,
      this.name,
      this.price,
      this.rating,
      this.description,
      this.sizechart,
      this.colorchart,
      this.image,
      this.categoryId,
      this.salecategoryId,
      this.gender,
      this.createdAt,
      this.updatedAt});

  ProductId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    price = json['price'];
    rating = json['rating'];
    description = json['description'];
    sizechart = json['sizechart'].cast<String>();
    colorchart = json['colorchart'].cast<String>();
    image = json['image'].cast<String>();
    categoryId = json['category_id'];
    salecategoryId = json['salecategory_id'];
    gender = json['gender'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['rating'] = this.rating;
    data['description'] = this.description;
    data['sizechart'] = this.sizechart;
    data['colorchart'] = this.colorchart;
    data['image'] = this.image;
    data['category_id'] = this.categoryId;
    data['salecategory_id'] = this.salecategoryId;
    data['gender'] = this.gender;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class CategoryId {
  String? sId;
  String? name;

  CategoryId({this.sId, this.name});

  CategoryId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}
