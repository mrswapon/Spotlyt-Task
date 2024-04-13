

class TaskerHomeModel {
  final int? code;
  final String? message;
  final Data? data;

  TaskerHomeModel({
    this.code,
    this.message,
    this.data,
  });

  factory TaskerHomeModel.fromJson(Map<String, dynamic> json) => TaskerHomeModel(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );


}

class Data {
  final Attributes? attributes;

  Data({
    this.attributes,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    attributes: json["attributes"] == null ? null : Attributes.fromJson(json["attributes"]),
  );


}

class Attributes {
  final List<Task>? tasks;
  final String? page;
  final int? limit;
  final int? totalPages;
  final int? totalResults;

  Attributes({
    this.tasks,
    this.page,
    this.limit,
    this.totalPages,
    this.totalResults,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    tasks: json["tasks"] == null ? [] : List<Task>.from(json["tasks"]!.map((x) => Task.fromJson(x))),
    page: json["page"],
    limit: json["limit"],
    totalPages: json["totalPages"],
    totalResults: json["totalResults"],
  );


}

class Task {
  final String? id;
  final String? name;
  final String? taskLink;
  final UserId? userId;
  final String? type;
  final ServiceId? serviceId;
  final String? status;
  final int? quantity;
  final double? price;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Task({
    this.id,
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
    this.v,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json["_id"],
    name: json["name"],
    taskLink: json["taskLink"],
    userId: json["userId"] == null ? null : UserId.fromJson(json["userId"]),
    type: json["type"],
    serviceId: json["serviceId"] == null ? null : ServiceId.fromJson(json["serviceId"]),
    status: json["status"],
    quantity: json["quantity"],
    price: json["price"]?.toDouble(),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );


}



class ServiceId {
  final String? id;
  final String? serviceIdId;
  final String? name;
  final String? type;
  final List<String>? description;
  final List<Category>? categories;
  final int? v;

  ServiceId({
    this.id,
    this.serviceIdId,
    this.name,
    this.type,
    this.description,
    this.categories,
    this.v,
  });

  factory ServiceId.fromJson(Map<String, dynamic> json) => ServiceId(
    id: json["_id"],
    serviceIdId: json["id"],
    name: json["name"],
    type: json["type"],
    description: json["description"] == null ? [] : List<String>.from(json["description"]!.map((x) => x)),
    categories: json["Categories"] == null ? [] : List<Category>.from(json["Categories"]!.map((x) => Category.fromJson(x))),
    v: json["__v"],
  );


}

class Category {
  final String? categoryId;
  final String? name;
  final List<Service>? service;
  final String? id;

  Category({
    this.categoryId,
    this.name,
    this.service,
    this.id,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categoryId: json["id"],
    name: json["name"],
    service: json["service"] == null ? [] : List<Service>.from(json["service"]!.map((x) => Service.fromJson(x))),
    id: json["_id"],
  );


}

class Service {
  final String? name;
  final double? price;
  final String? sobTitle;
  final String? id;

  Service({
    this.name,
    this.price,
    this.sobTitle,
    this.id,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    name:json["name"]!,
    price: json["price"]?.toDouble(),
    sobTitle: json["sobTitle"],
    id: json["_id"],
  );


}


class UserId {
  final String? fullName;
  final String? email;
  final Image? image;
  final String? role;
  final int? rand;
  final int? phoneNumber;
  final String? nidStatus;
  final List<dynamic>? interest;
  final String? referralCode;
  final bool? isEmailVerified;
  final bool? isResetPassword;
  final bool? isInterest;
  final bool? isProfileCompleted;
  final bool? isDeleted;
  final DateTime? createdAt;
  final dynamic oneTimeCode;
  final String? address;
  final String? dataOfBirth;
  final dynamic nidNumber;
  final String? id;

  UserId({
    this.fullName,
    this.email,
    this.image,
    this.role,
    this.rand,
    this.phoneNumber,
    this.nidStatus,
    this.interest,
    this.referralCode,
    this.isEmailVerified,
    this.isResetPassword,
    this.isInterest,
    this.isProfileCompleted,
    this.isDeleted,
    this.createdAt,
    this.oneTimeCode,
    this.address,
    this.dataOfBirth,
    this.nidNumber,
    this.id,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
    fullName: json["fullName"],
    email: json["email"],
    image: json["image"] == null ? null : Image.fromJson(json["image"]),
    role: json["role"],
    rand: json["rand"],
    phoneNumber: json["phoneNumber"],
    nidStatus: json["nidStatus"],
    interest: json["interest"] == null ? [] : List<dynamic>.from(json["interest"]!.map((x) => x)),
    referralCode: json["referralCode"],
    isEmailVerified: json["isEmailVerified"],
    isResetPassword: json["isResetPassword"],
    isInterest: json["isInterest"],
    isProfileCompleted: json["isProfileCompleted"],
    isDeleted: json["isDeleted"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    oneTimeCode: json["oneTimeCode"],
    address: json["address"],
    dataOfBirth: json["dataOfBirth"],
    nidNumber: json["nidNumber"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "fullName": fullName,
    "email": email,
    "image": image?.toJson(),
    "role": role,
    "rand": rand,
    "phoneNumber": phoneNumber,
    "nidStatus": nidStatus,
    "interest": interest == null ? [] : List<dynamic>.from(interest!.map((x) => x)),
    "referralCode": referralCode,
    "isEmailVerified": isEmailVerified,
    "isResetPassword": isResetPassword,
    "isInterest": isInterest,
    "isProfileCompleted": isProfileCompleted,
    "isDeleted": isDeleted,
    "createdAt": createdAt?.toIso8601String(),
    "oneTimeCode": oneTimeCode,
    "address": address,
    "dataOfBirth": dataOfBirth,
    "nidNumber": nidNumber,
    "id": id,
  };
}

class Image {
  final String? url;
  final String? path;

  Image({
    this.url,
    this.path,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    url: json["url"],
    path: json["path"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "path": path,
  };
}

