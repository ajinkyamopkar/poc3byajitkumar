class CarousalModel {
  int? status;
  String? message;
  List<CarousalData>? data;

  CarousalModel({this.status, this.message, this.data});

  CarousalModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CarousalData>[];
      json['data'].forEach((v) {
        data!.add(new CarousalData.fromJson(v));
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

class CarousalData {
  String? sId;
  String? title;
  String? subtitle;
  String? image;
  String? createdBy;
  String? createdAt;
  String? updatedAt;

  CarousalData(
      {this.sId,
      this.title,
      this.subtitle,
      this.image,
      this.createdBy,
      this.createdAt,
      this.updatedAt});

  CarousalData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    subtitle = json['subtitle'];
    image = json['image'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['image'] = this.image;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
