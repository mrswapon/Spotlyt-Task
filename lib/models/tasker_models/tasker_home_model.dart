class TaskerHomeModel {
  final String? id;
  final Name? name;
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

  TaskerHomeModel({
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

  factory TaskerHomeModel.fromJson(Map<String, dynamic> json) => TaskerHomeModel(
    id: json["_id"],
    name: nameValues.map[json["name"]]!,
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

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": nameValues.reverse[name],
    "taskLink": taskLink,
    "userId": userId?.toJson(),
    "type": type,
    "serviceId": serviceId?.toJson(),
    "status": status,
    "quantity": quantity,
    "price": price,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

enum Name {
  REQUEST_COMMENTS,
  REQUEST_FOLLOWERS,
  REQUEST_LIKES,
  REQUEST_SHARING_TO_STORY
}

final nameValues = EnumValues({
  "Request Comments": Name.REQUEST_COMMENTS,
  "Request Followers": Name.REQUEST_FOLLOWERS,
  "Request Likes": Name.REQUEST_LIKES,
  "Request sharing to story": Name.REQUEST_SHARING_TO_STORY
});

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

  Map<String, dynamic> toJson() => {
    "_id": id,
    "id": serviceIdId,
    "name": name,
    "type": type,
    "description": description == null ? [] : List<dynamic>.from(description!.map((x) => x)),
    "Categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
    "__v": v,
  };
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

  Map<String, dynamic> toJson() => {
    "id": categoryId,
    "name": name,
    "service": service == null ? [] : List<dynamic>.from(service!.map((x) => x.toJson())),
    "_id": id,
  };
}

class Service {
  final Name? name;
  final double? price;
  final SobTitle? sobTitle;
  final String? id;

  Service({
    this.name,
    this.price,
    this.sobTitle,
    this.id,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    name: nameValues.map[json["name"]]!,
    price: json["price"]?.toDouble(),
    sobTitle: sobTitleValues.map[json["sobTitle"]]!,
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": nameValues.reverse[name],
    "price": price,
    "sobTitle": sobTitleValues.reverse[sobTitle],
    "_id": id,
  };
}

enum SobTitle {
  PER_COMMENT,
  PER_FOLLOWER,
  PER_LIKE,
  PER_STORY
}

final sobTitleValues = EnumValues({
  "Per Comment": SobTitle.PER_COMMENT,
  "Per Follower": SobTitle.PER_FOLLOWER,
  "Per Like": SobTitle.PER_LIKE,
  "Per Story": SobTitle.PER_STORY
});

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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}