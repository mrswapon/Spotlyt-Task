class InterestModel {
  final int? code;
  final String? message;
  final Data? data;
  InterestModel({
    this.code,
    this.message,
    this.data,
  });

  factory InterestModel.fromJson(Map<String, dynamic> json) => InterestModel(
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
  final List<Interest>? interest;

  Data({
    this.interest,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    interest: json["attributes"] == null ? [] : List<Interest>.from(json["attributes"]!.map((x) => Interest.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "attributes": interest == null ? [] : List<dynamic>.from(interest!.map((x) => x.toJson())),
  };
}

class Interest {
  final String? id;
  final int? attributeId;
  final String? icon;
  final String? title;
  final int? v;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Interest({
    this.id,
    this.attributeId,
    this.icon,
    this.title,
    this.v,
    this.createdAt,
    this.updatedAt,
  });

  factory Interest.fromJson(Map<String, dynamic> json) => Interest(
    id: json["_id"],
    attributeId: json["id"],
    icon: json["icon"],
    title: json["title"],
    v: json["__v"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "id": attributeId,
    "icon": icon,
    "title": title,
    "__v": v,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}
