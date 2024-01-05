class ViewedCar {
  int? id;
  int? moduleType;
  String? title;
  int? price;
  int? year;
  int? kmUsed;
  String? origin;
  String? province;
  String? transmission;
  String? bodyType;
  String? gearBox;
  String? humanTime;
  String? status;
  String? fuel;
  String? accountType;
  Media? media;

  ViewedCar(
      {this.id,
        this.moduleType,
        this.title,
        this.price,
        this.year,
        this.kmUsed,
        this.origin,
        this.province,
        this.transmission,
        this.bodyType,
        this.gearBox,
        this.humanTime,
        this.status,
        this.fuel,
        this.accountType,
        this.media});

  ViewedCar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    moduleType = json['module_type'];
    title = json['title'];
    price = json['price'];
    year = json['year'];
    kmUsed = json['km_used'];
    origin = json['origin'];
    province = json['province'];
    transmission = json['transmission'];
    bodyType = json['body_type'];
    gearBox = json['gear_box'];
    humanTime = json['humanTime'];
    status = json['status'];
    fuel = json['fuel'];
    accountType = json['account_type'];
    media = json['media'] != null ? Media.fromJson(json['media']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['module_type'] = moduleType;
    data['title'] = title;
    data['price'] = price;
    data['year'] = year;
    data['km_used'] = kmUsed;
    data['origin'] = origin;
    data['province'] = province;
    data['transmission'] = transmission;
    data['body_type'] = bodyType;
    data['gear_box'] = gearBox;
    data['humanTime'] = humanTime;
    data['status'] = status;
    data['fuel'] = fuel;
    data['account_type'] = accountType;
    if (media != null) {
      data['media'] = media!.toJson();
    }
    return data;
  }
}

class Media {
  int? total;
  List<String>? thumbMedium;
  List<String>? thumbLarge;

  Media({this.total, this.thumbMedium, this.thumbLarge});

  Media.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    thumbMedium = json['thumb_medium'].cast<String>();
    thumbLarge = json['thumb_large'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['thumb_medium'] = thumbMedium;
    data['thumb_large'] = thumbLarge;
    return data;
  }
}