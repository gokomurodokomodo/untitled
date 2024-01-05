class User{
  int? id;
  String? name;
  String? email;
  int? accountGroupId;
  int? timeUpTopNumber;
  int? limitImageUpload;
  bool? autoApprove;
  String? accessToken;

  User.fromJson(Map<String, dynamic> json) {
    id = json['data']['id'];
    name = json['data']['name'];
    email = json['data']['email'];
    accountGroupId = json['data']['account_group_id'];
    timeUpTopNumber = json['data']['time_up_top_number'];
    limitImageUpload = json['data']['limit_image_upload'];
    autoApprove = json['data']['auto_approve'];
    accessToken = json['meta']['token'];
  }
}