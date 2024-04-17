

class WalletModel {
  final int? code;
  final String? message;
  final Data? data;

  WalletModel({
    this.code,
    this.message,
    this.data,
  });

  factory WalletModel.fromJson(Map<String, dynamic> json) => WalletModel(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  final List<Attribute>? attributes;

  Data({
    this.attributes,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    attributes: json["attributes"] == null ? [] : List<Attribute>.from(json["attributes"]!.map((x) => Attribute.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "attributes": attributes == null ? [] : List<dynamic>.from(attributes!.map((x) => x.toJson())),
  };
}

class Attribute {
  final String? id;
  final UserId? userId;
  final String? bankName;
  final String? accountNumber;
  final String? accountType;
  final int? withdrawalAmount;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Attribute({
    this.id,
    this.userId,
    this.bankName,
    this.accountNumber,
    this.accountType,
    this.withdrawalAmount,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
    id: json["_id"],
    userId: json["userId"] == null ? null : UserId.fromJson(json["userId"]),
    bankName: json["bankName"],
    accountNumber: json["accountNumber"],
    accountType: json["accountType"],
    withdrawalAmount: json["withdrawalAmount"],
    status: json["status"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userId": userId?.toJson(),
    "bankName": bankName,
    "accountNumber": accountNumber,
    "accountType": accountType,
    "withdrawalAmount": withdrawalAmount,
    "status": status,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class UserId {
  final String? fullName;
  final String? email;
  final Image? image;
  final String? role;
  final num? rand;
  final String? id;

  UserId({
    this.fullName,
    this.email,
    this.image,
    this.role,
    this.rand,
    this.id,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
    fullName: json["fullName"],
    email: json["email"],
    image: json["image"] == null ? null : Image.fromJson(json["image"]),
    role: json["role"],
    rand: json["rand"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "fullName": fullName,
    "email": email,
    "image": image?.toJson(),
    "role": role,
    "rand": rand,
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
