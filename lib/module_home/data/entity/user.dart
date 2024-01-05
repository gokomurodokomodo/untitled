class User {
  int? id;
  String? username;
  int? notifyType;
  String? email;
  String? avatar;
  String? facebookId;
  String? googleId;
  String? profileUrl;
  String? description;
  String? name;
  String? phone;
  String? phone2;
  String? address;
  int? provinceId;
  int? status;
  int? type;
  String? idsCompare;
  String? idsLike;
  String? idsViewed;
  int? accountGroupId;
  String? expiredAt;
  Null lastLogin;
  String? createdAt;
  String? updatedAt;
  int? countUpTop;
  String? lastTimeUpTop;
  int? isPublicPhone;
  int? isPublicEmail;

  User(
      {this.id,
        this.username,
        this.notifyType,
        this.email,
        this.avatar,
        this.facebookId,
        this.googleId,
        this.profileUrl,
        this.description,
        this.name,
        this.phone,
        this.phone2,
        this.address,
        this.provinceId,
        this.status,
        this.type,
        this.idsCompare,
        this.idsLike,
        this.idsViewed,
        this.accountGroupId,
        this.expiredAt,
        this.lastLogin,
        this.createdAt,
        this.updatedAt,
        this.countUpTop,
        this.lastTimeUpTop,
        this.isPublicPhone,
        this.isPublicEmail,});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    notifyType = json['notify_type'];
    email = json['email'];
    avatar = json['avatar'];
    facebookId = json['facebook_id'];
    googleId = json['google_id'];
    profileUrl = json['profileUrl'];
    description = json['description'];
    name = json['name'];
    phone = json['phone'];
    phone2 = json['phone2'];
    address = json['address'];
    provinceId = json['province_id'];
    status = json['status'];
    type = json['type'];
    idsCompare = json['ids_compare'];
    idsLike = json['ids_like'];
    idsViewed = json['ids_viewed'];
    accountGroupId = json['account_group_id'];
    expiredAt = json['expired_at'];
    lastLogin = json['last_login'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    countUpTop = json['count_up_top'];
    lastTimeUpTop = json['last_time_up_top'];
    isPublicPhone = json['is_public_phone'];
    isPublicEmail = json['is_public_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['notify_type'] = notifyType;
    data['email'] = email;
    data['avatar'] = avatar;
    data['facebook_id'] = facebookId;
    data['google_id'] = googleId;
    data['profileUrl'] = profileUrl;
    data['description'] = description;
    data['name'] = name;
    data['phone'] = phone;
    data['phone2'] = phone2;
    data['address'] = address;
    data['province_id'] = provinceId;
    data['status'] = status;
    data['type'] = type;
    data['ids_compare'] = idsCompare;
    data['ids_like'] = idsLike;
    data['ids_viewed'] = idsViewed;
    data['account_group_id'] = accountGroupId;
    data['expired_at'] = expiredAt;
    data['last_login'] = lastLogin;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['count_up_top'] = countUpTop;
    data['last_time_up_top'] = lastTimeUpTop;
    data['is_public_phone'] = isPublicPhone;
    data['is_public_email'] = isPublicEmail;
    return data;
  }
}