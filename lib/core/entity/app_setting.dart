class AppSetting {
  final int? id;
  final String? name;
  final String? slug;

  AppSetting.fromJson(dynamic json)
      : id = json?['id'],
  // nam_san_xuat name + slug la int
        name = json?['name'].toString(),
        slug = json?['slug'].toString();
}