class ReelItem {
  int? id;
  String? description;
  String? createdAt;
  Account? account;
  String? imageUrl;

  ReelItem(
      {this.id, this.description, this.createdAt, this.account, this.imageUrl});

  ReelItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    createdAt = json['created_at'];
    account =
    json['account'] != null ? Account.fromJson(json['account']) : null;
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['created_at'] = createdAt;
    if (account != null) {
      data['account'] = account!.toJson();
    }
    data['image_url'] = imageUrl;
    return data;
  }
}

class Account {
  int? id;
  String? name;
  String? username;
  String? email;
  Avatar? avatar;

  Account({this.id, this.name, this.username, this.email, this.avatar});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    avatar =
    json['avatar'] != null ? Avatar.fromJson(json['avatar']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    if (avatar != null) {
      data['avatar'] = avatar!.toJson();
    }
    return data;
  }
}

class Avatar {
  String? imageThumb;

  Avatar({this.imageThumb});

  Avatar.fromJson(Map<String, dynamic> json) {
    imageThumb = json['image_thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image_thumb'] = imageThumb;
    return data;
  }
}