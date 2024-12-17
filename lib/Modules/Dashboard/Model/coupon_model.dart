class CouponModel {
  int? status;
  String? message;
  List<CouponData>? data;

  CouponModel({this.status, this.message, this.data});

  CouponModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CouponData>[];
      json['data'].forEach((v) {
        data!.add(new CouponData.fromJson(v));
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

class CouponData {
  String? sId;
  String? title;
  String? subtitle;
  String? descreption;
  int? amount;
  String? createdBy;
  String? createdAt;
  String? updatedAt;

  CouponData(
      {this.sId,
      this.title,
      this.subtitle,
      this.descreption,
      this.amount,
      this.createdBy,
      this.createdAt,
      this.updatedAt});

  CouponData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    subtitle = json['subtitle'];
    descreption = json['descreption'];
    amount = json['amount'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['descreption'] = this.descreption;
    data['amount'] = this.amount;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
