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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.toJson();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tasks != null) {
      data['tasks'] = this.tasks!.map((v) => v.toJson()).toList();
    }
    data['page'] = this.page;
    data['limit'] = this.limit;
    data['totalPages'] = this.totalPages;
    data['totalResults'] = this.totalResults;
    return data;
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
    price = json['price'].runtimeType==int?json['price'].toDouble():json['price'];
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




  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    if (this.userId != null) {
      data['userId'] = this.userId!.toJson();
    }
    if (this.taskId != null) {
      data['taskId'] = this.taskId!.toJson();
    }
    data['status'] = this.status;
    data['price'] = this.price;
    if (this.image != null) {
      data['image'] = this.image!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
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
  String? updatedAt;
  Timeline? timeline;
  int? iV;



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
        this.updatedAt,
        this.timeline,
        this.iV});

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
    updatedAt = json['updatedAt'];
    timeline = json["timeline"] == null ? null : Timeline.fromJson(json["timeline"]);
    iV = json['__v'];
  }





  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['taskLink'] = this.taskLink;
    data['userId'] = this.userId;
    data['type'] = this.type;
    data['serviceId'] = this.serviceId;
    data['status'] = this.status;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    // data['timeline'] = this.timeline;
    return data;
  }


}

class Timeline {
  final DateTime? start;
  final DateTime? end;

  Timeline({
    this.start,
    this.end,
  });

  factory Timeline.fromJson(Map<String, dynamic> json) => Timeline(
    start: json["start"] == null ? null : DateTime.parse(json["start"]),
    end: json["end"] == null ? null : DateTime.parse(json["end"]),
  );

  Map<String, dynamic> toJson() => {
    "start": start?.toIso8601String(),
    "end": end?.toIso8601String(),
  };
}
