class NotificationModel {
  final int? code;
  final String? message;
  final Data? data;

  NotificationModel({
    this.code,
    this.message,
    this.data,
  });
}

class Data {
  final Attributes? attributes;

  Data({
    this.attributes,
  });
}

class Attributes {
  final List<Result>? results;
  final int? page;
  final int? limit;
  final int? totalPages;
  final int? totalResults;
  final int? unReadCount;

  Attributes({
    this.results,
    this.page,
    this.limit,
    this.totalPages,
    this.totalResults,
    this.unReadCount,
  });
}

class Result {
  final String? id;
  final String? receiverId;
  final String? message;
  final String? role;
  final String? type;
  final bool? viewStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Result({
    this.id,
    this.receiverId,
    this.message,
    this.role,
    this.type,
    this.viewStatus,
    this.createdAt,
    this.updatedAt,
    this.v,
  });
}
