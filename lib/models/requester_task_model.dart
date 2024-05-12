// To parse this JSON data, do
//
//     final requesterTaskModel = requesterTaskModelFromJson(jsonString);

class RequesterTaskModel {
  final String? id;
  final String? name;
  final String? taskLink;
  final UserId? userId;
  final String? type;
  final ServiceId? serviceId;
  final String? status;
  final int? quantity;
  final int? count;
  final double? price;
  final DateTime? createdAt;
  final DateTime? startDate;
  final DateTime? endDate;


  RequesterTaskModel({
    this.id,
    this.name,
    this.taskLink,
    this.userId,
    this.type,
    this.serviceId,
    this.status,
    this.quantity,
    this.count,
    this.price,

    this.createdAt,
    this.endDate,
    this.startDate

  });

  factory RequesterTaskModel.fromJson(Map<String, dynamic> json) =>
      RequesterTaskModel(
        id: json["_id"],
        name: json["name"]!,
        taskLink: json["taskLink"],
        userId: json["userId"] == null ? null : UserId.fromJson(json["userId"]),
        type: json["type"]!,
        serviceId: json["serviceId"] == null
            ? null
            : ServiceId.fromJson(json["serviceId"]),
        status: json["status"]!,
        quantity: json["quantity"],
        count: json["count"],
        price: json["price"]?.toDouble(),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        startDate: json["timelinesStart"] == null
            ? null
            : DateTime.parse(json["timelinesStart"]),
        endDate: json["timelinesEnd"] == null
            ? null
            : DateTime.parse(json["timelinesEnd"]),

      );
}

class ServiceId {
  final String? id;
  final String? serviceIdId;
  final String? name;
  final String? type;
  final List<String>? description;
  final List<Category>? categories;

  ServiceId({
    this.id,
    this.serviceIdId,
    this.name,
    this.type,
    this.description,
    this.categories,
  });

  factory ServiceId.fromJson(Map<String, dynamic> json) => ServiceId(
        id: json["_id"]!,
        serviceIdId: json["id"],
        name: json["name"]!,
        type: json["type"]!,
        description: json["description"] == null
            ? []
            : List<String>.from(json["description"]!.map((x) => x)),
        categories: json["Categories"] == null
            ? []
            : List<Category>.from(
                json["Categories"]!.map((x) => Category.fromJson(x))),
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
        name: json["name"]!,
        service: json["service"] == null
            ? []
            : List<Service>.from(
                json["service"]!.map((x) => Service.fromJson(x))),
        id: json["_id"]!,
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
        name: json["name"]!,
        price: json["price"]?.toDouble(),
        sobTitle: json["sobTitle"]!,
        id: json["_id"],
      );
}

class UserId {
  final String? fullName;
  final Image? image;
  final String? id;

  UserId({
    this.fullName,
    this.image,
    this.id,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        fullName: json["fullName"]!,
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        id: json["id"]!,
      );
}

class Image {
  final String? url;
  final String? path;

  Image({
    this.url,
    this.path,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"]!,
        path: json["path"]!,
      );
}
