class PackageTypeModel {
  int id;
  String leaveType;

  PackageTypeModel({this.id, this.leaveType});

  PackageTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    leaveType = json['clientType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['clientType'] = this.leaveType;
    return data;
  }
}
