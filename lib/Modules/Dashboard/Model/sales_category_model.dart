class SalesCategoryModel {
  int? status;
  String? message;
  List<SalesCategoryData>? data;

  SalesCategoryModel({this.status, this.message, this.data});

  SalesCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <SalesCategoryData>[];
      json['data'].forEach((v) {
        data!.add(new SalesCategoryData.fromJson(v));
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

class SalesCategoryData {
  String? sId;
  String? name;
  String? createdBy;
  String? createdAt;
  String? updatedAt;

  SalesCategoryData(
      {this.sId, this.name, this.createdBy, this.createdAt, this.updatedAt});

  SalesCategoryData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
