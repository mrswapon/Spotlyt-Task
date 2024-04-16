

class ProfileModel {
  final String? fullName;
  final String? email;
  final String? role;
  final double? rand;
  final List<String>? interest;
  final bool? isEmailVerified;
  final String? nidStatus;
  final bool? isResetPassword;
  final bool? isInterest;
  final bool? isProfileCompleted;
  final bool? isDeleted;
  final String? address;
  final String? dataOfBirth;
  final dynamic nidNumber;
  final dynamic phoneNumber;
  final Image? image;
  final String? id;
  final String? referralCode;
  final String? claimedReferralCode;

  ProfileModel({
    this.fullName,
    this.email,
    this.role,
    this.rand,
    this.interest,
    this.isEmailVerified,
    this.nidStatus,
    this.isResetPassword,
    this.isInterest,
    this.isProfileCompleted,
    this.isDeleted,
    this.address,
    this.dataOfBirth,
    this.nidNumber,
    this.phoneNumber,
    this.image,
    this.id,
    this.referralCode,
    this.claimedReferralCode,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    fullName: json["fullName"],
    email: json["email"],
    role: json["role"],
    rand: json["rand"].runtimeType==int?json["rand"].toDouble():json["rand"],
    interest: json["interest"] == null ? [] : List<String>.from(json["interest"]!.map((x) => x)),
    nidStatus: json["nidStatus"],
    isEmailVerified: json["isEmailVerified"],
    isResetPassword: json["isResetPassword"],
    isInterest: json["isInterest"],
    isProfileCompleted: json["isProfileCompleted"],
    isDeleted: json["isDeleted"],
    address: json["address"],
    dataOfBirth: json["dataOfBirth"],
    nidNumber: json["nidNumber"],
    phoneNumber: json["phoneNumber"],
    image: json["image"] == null ? null : Image.fromJson(json["image"]),
    id: json["id"],
    referralCode: json["referralCode"],
    claimedReferralCode: json["claimedReferralCode"],
  );

  Map<String, dynamic> toJson() => {
    "fullName": fullName,
    "email": email,
    "role": role,
    "rand": rand,
    "interest": interest == null ? [] : List<dynamic>.from(interest!.map((x) => x)),
    "nidStatus": nidStatus,
    "isEmailVerified": isEmailVerified,
    "isResetPassword": isResetPassword,
    "isInterest": isInterest,
    "isProfileCompleted": isProfileCompleted,
    "isDeleted": isDeleted,
    "address": address,
    "dataOfBirth": dataOfBirth,
    "nidNumber": nidNumber,
    "phoneNumber": phoneNumber,
    "image": image?.toJson(),
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
