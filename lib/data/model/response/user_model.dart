class UserInfoModel {
  int id;
  String image;
  String name;
  String phone;
  String email;
  String address;

  UserInfoModel(
      {this.id,
        this.image,
        this.name,
        this.phone,
        this.email,
        this.address});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['address'] = this.address;
    return data;
  }
}
