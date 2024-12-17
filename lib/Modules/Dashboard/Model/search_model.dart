class SearchModel {
  int? status;
  String? message;
  List<SearchData>? data;

  SearchModel({this.status, this.message, this.data});

  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <SearchData>[];
      json['data'].forEach((v) {
        data!.add(new SearchData.fromJson(v));
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

class SearchData {
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

  SearchData(
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

  SearchData.fromJson(Map<String, dynamic> json) {
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
