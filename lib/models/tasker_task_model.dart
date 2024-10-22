import 'dart:convert';

class TaskerTaskModel {
  int? code;
  String? message;
  Data? data;

  TaskerTaskModel({this.code, this.message, this.data});

  TaskerTaskModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }


}

class Data {
  Attributes? attributes;

  Data({this.attributes});

  Data.fromJson(Map<String, dynamic> json) {
    attributes = json['attributes'] != null
        ? new Attributes.fromJson(json['attributes'])
        : null;
  }


}

class Attributes {
  List<Tasks>? tasks;
  int? page;
  int? limit;
  int? totalPages;
  int? totalResults;

  Attributes(
      {this.tasks, this.page, this.limit, this.totalPages, this.totalResults});

  Attributes.fromJson(Map<String, dynamic> json) {
    if (json['tasks'] != null) {
      tasks = <Tasks>[];
      json['tasks'].forEach((v) {
        tasks!.add(new Tasks.fromJson(v));
      });
    }
    page = json['page'];
    limit = json['limit'];
    totalPages = json['totalPages'];
    totalResults = json['totalResults'];
  }


}

class Tasks {
  String? sId;
  String? name;
  UserId? userId;
  TaskId? taskId;
  String? status;
  double? price;
  List<Image>? image;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Tasks(
      {this.sId,
        this.name,
        this.userId,
        this.taskId,
        this.status,
        this.price,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Tasks.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    userId =
    json['userId'] != null ? new UserId.fromJson(json['userId']) : null;
    taskId =
    json['taskId'] != null ? new TaskId.fromJson(json['taskId']) : null;
    status = json['status'];
    price = json['price'].runtimeType == int?json['price'].toDouble():json['price'];
    if (json['image'] != null) {
      image = <Image>[];
      json['image'].forEach((v) {
        image!.add(new Image.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }





}

class UserId {
  String? fullName;
  String? email;
  Image? image;
  String? role;
  double? rand;
  int? phoneNumber;
  String? nidStatus;
  List<Null>? interest;
  String? address;
  String? referralCode;
  bool? isEmailVerified;
  bool? isResetPassword;
  bool? isInterest;
  bool? isProfileCompleted;
  bool? isDeleted;
  String? createdAt;
  Null oneTimeCode;
  String? id;

  UserId(
      {this.fullName,
        this.email,
        this.image,
        this.role,
        this.rand,
        this.phoneNumber,
        this.nidStatus,
        this.interest,
        this.address,
        this.referralCode,
        this.isEmailVerified,
        this.isResetPassword,
        this.isInterest,
        this.isProfileCompleted,
        this.isDeleted,
        this.createdAt,
        this.oneTimeCode,
        this.id});

  UserId.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    email = json['email'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    role = json['role'];
    rand = json["rand"].runtimeType == int?json["rand"].toDouble():json["rand"];
    phoneNumber = json['phoneNumber'];
    nidStatus = json['nidStatus'];
    address = json['address'];
    referralCode = json['referralCode'];
    isEmailVerified = json['isEmailVerified'];
    isResetPassword = json['isResetPassword'];
    isInterest = json['isInterest'];
    isProfileCompleted = json['isProfileCompleted'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    oneTimeCode = json['oneTimeCode'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['role'] = this.role;
    data['rand'] = this.rand;
    data['phoneNumber'] = this.phoneNumber;
    data['nidStatus'] = this.nidStatus;
    data['address'] = this.address;
    data['referralCode'] = this.referralCode;
    data['isEmailVerified'] = this.isEmailVerified;
    data['isResetPassword'] = this.isResetPassword;
    data['isInterest'] = this.isInterest;
    data['isProfileCompleted'] = this.isProfileCompleted;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['oneTimeCode'] = this.oneTimeCode;
    data['id'] = this.id;
    return data;
  }
}

class Image {
  String? url;
  String? path;

  Image({this.url, this.path});

  Image.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['path'] = this.path;
    return data;
  }
}

class TaskId {
  String? sId;
  String? name;
  String? taskLink;
  String? userId;
  String? type;
  String? serviceId;
  String? status;
  int? quantity;
  double? price;
  String? createdAt;
  DateTime? startDate;
  DateTime? endDate;




  TaskId(
      {this.sId,
        this.name,
        this.taskLink,
        this.userId,
        this.type,
        this.serviceId,
        this.status,
        this.quantity,
        this.price,
        this.createdAt,
        this.endDate,
        this.startDate
      });

  TaskId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    taskLink = json['taskLink'];
    userId = json['userId'];
    type = json['type'];
    serviceId = json['serviceId'];
    status = json['status'];
    quantity = json['quantity'];
    price = json['price'].runtimeType==int?json['price'].toDouble():json['price'];
    createdAt = json['createdAt'];
    startDate=json["timelinesStart"] == null
        ? null
        : DateTime.parse(json["timelinesStart"]);
    endDate=json["timelinesEnd"] == null
        ? null
        : DateTime.parse(json["timelinesEnd"]);

  }







}


