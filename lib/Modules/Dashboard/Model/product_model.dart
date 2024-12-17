class ProductModel {
  int? status;
  String? message;
  List<ProductData>? data;

  ProductModel({this.status, this.message, this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ProductData>[];
      json['data'].forEach((v) {
        data!.add(new ProductData.fromJson(v));
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

class ProductData {
  String? sId;
  String? name;
  int? price;
  double? rating;
  String? description;
  List<String>? sizechart;
  List<String>? colorchart;
  List<String>? image;
  CategoryId? categoryId;
  CategoryId? salecategoryId;
  String? gender;
  String? createdAt;
  String? updatedAt;

  ProductData(
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

  ProductData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    price = json['price'];
    rating = json['rating'];
    description = json['description'];
    sizechart = json['sizechart'].cast<String>();
    colorchart = json['colorchart'].cast<String>();
    image = json['image'].cast<String>();
    categoryId = json['category_id'] != null
        ? new CategoryId.fromJson(json['category_id'])
        : null;
    salecategoryId = json['salecategory_id'] != null
        ? new CategoryId.fromJson(json['salecategory_id'])
        : null;
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
    if (this.categoryId != null) {
      data['category_id'] = this.categoryId!.toJson();
    }
    if (this.salecategoryId != null) {
      data['salecategory_id'] = this.salecategoryId!.toJson();
    }
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
