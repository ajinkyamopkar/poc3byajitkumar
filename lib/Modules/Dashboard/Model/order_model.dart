class OrderModel {
  int? status;
  String? message;
  Data? data;

  OrderModel({this.status, this.message, this.data});

  OrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? userId;
  String? createdAt;
  List<Product>? product;
  String? updatedAt;

  Data({this.sId, this.userId, this.createdAt, this.product, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(new Product.fromJson(v));
      });
    }
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    if (this.product != null) {
      data['product'] = this.product!.map((v) => v.toJson()).toList();
    }
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Product {
  ProductId? productId;
  int? qty;
  String? size;
  String? createdAt;
  String? sId;

  Product({this.productId, this.qty, this.size, this.createdAt, this.sId});

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'] != null
        ? new ProductId.fromJson(json['product_id'])
        : null;
    qty = json['qty'];
    size = json['size'];
    createdAt = json['createdAt'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productId != null) {
      data['product_id'] = this.productId!.toJson();
    }
    data['qty'] = this.qty;
    data['size'] = this.size;
    data['createdAt'] = this.createdAt;
    data['_id'] = this.sId;
    return data;
  }
}

class ProductId {
  String? sId;
  String? name;
  int? price;
  List<String>? image;
  String? gender;

  ProductId({this.sId, this.name, this.price, this.image, this.gender});

  ProductId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    price = json['price'];
    image = json['image'].cast<String>();
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['image'] = this.image;
    data['gender'] = this.gender;
    return data;
  }
}
