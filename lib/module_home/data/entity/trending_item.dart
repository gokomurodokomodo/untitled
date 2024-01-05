class TrendingItem{
  int? count;
  String? name;
  int? id;

  TrendingItem({this.count, this.name, this.id});

  TrendingItem.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['name'] = name;
    data['id'] = id;
    return data;
  }
}