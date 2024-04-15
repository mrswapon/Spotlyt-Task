class RequesterHomeScreenModel {
  int? code;
  String? message;
  Data? data;

  RequesterHomeScreenModel({this.code, this.message, this.data});

  RequesterHomeScreenModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Attributes>? attributes;

  Data({this.attributes});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['attributes'] != null) {
      attributes = <Attributes>[];
      json['attributes'].forEach((v) {
        attributes!.add(Attributes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (attributes != null) {
      data['attributes'] = attributes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attributes {
  String? sId;
  String? id;
  String? name;
  List<String>? description;
  List<Categories>? categories;
  int? iV;

  Attributes(
      {this.sId,
        this.id,
        this.name,
        this.description,
        this.categories,
        this.iV});

  Attributes.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    name = json['name'];
    description = json['description'].cast<String>();
    if (json['Categories'] != null) {
      categories = <Categories>[];
      json['Categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    if (categories != null) {
      data['Categories'] = categories!.map((v) => v.toJson()).toList();
    }
    data['__v'] = iV;
    return data;
  }
}

class Categories {
  String? id;
  String? name;
  List<Service>? service;
  String? sId;

  Categories({this.id, this.name, this.service, this.sId});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['service'] != null) {
      service = <Service>[];
      json['service'].forEach((v) {
        service!.add(Service.fromJson(v));
      });
    }
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    if (service != null) {
      data['service'] = service!.map((v) => v.toJson()).toList();
    }
    data['_id'] = sId;
    return data;
  }
}

class Service {
  String? name;
  num? price;
  String? sId;
  String? subTitle;
  int? max;
  int?  min;

  Service({this.name, this.price, this.sId,this.min,this.max});

  Service.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    subTitle = json['sobTitle'];
    sId = json['_id'];
    max=json['max'];
    min=json['min'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['price'] = price;
    data['_id'] = sId;
    return data;
  }
}