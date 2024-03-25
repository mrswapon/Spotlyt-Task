class ProfileModel {
  int? code;
  String? message;
  Data? data;

  ProfileModel({this.code, this.message, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
  String? fullName;
  String? email;
  Image? image;
  String? role;
  int? rand;
  List<String>? interest;
  Null? oneTimeCode;
  bool? isEmailVerified;
  bool? isResetPassword;
  bool? isInterest;
  bool? isProfileCompleted;
  bool? isDeleted;
  String? address;
  String? dataOfBirth;
  int? nidNumber;
  int? phoneNumber;
  String? id;

  Attributes(
      {this.fullName,
        this.email,
        this.image,
        this.role,
        this.rand,
        this.interest,
        this.oneTimeCode,
        this.isEmailVerified,
        this.isResetPassword,
        this.isInterest,
        this.isProfileCompleted,
        this.isDeleted,
        this.address,
        this.dataOfBirth,
        this.nidNumber,
        this.phoneNumber,
        this.id});

  Attributes.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    email = json['email'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    role = json['role'];
    rand = json['rand'];
    interest = json['interest'].cast<String>();
    oneTimeCode = json['oneTimeCode'];
    isEmailVerified = json['isEmailVerified'];
    isResetPassword = json['isResetPassword'];
    isInterest = json['isInterest'];
    isProfileCompleted = json['isProfileCompleted'];
    isDeleted = json['isDeleted'];
    address = json['address'];
    dataOfBirth = json['dataOfBirth'];
    nidNumber = json['nidNumber'];
    phoneNumber = json['phoneNumber'];
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
    data['interest'] = this.interest;
    data['oneTimeCode'] = this.oneTimeCode;
    data['isEmailVerified'] = this.isEmailVerified;
    data['isResetPassword'] = this.isResetPassword;
    data['isInterest'] = this.isInterest;
    data['isProfileCompleted'] = this.isProfileCompleted;
    data['isDeleted'] = this.isDeleted;
    data['address'] = this.address;
    data['dataOfBirth'] = this.dataOfBirth;
    data['nidNumber'] = this.nidNumber;
    data['phoneNumber'] = this.phoneNumber;
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