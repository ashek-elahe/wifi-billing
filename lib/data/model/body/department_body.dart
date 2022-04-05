class DepartmentBody {
  int id;
  String departmentType;

  DepartmentBody({this.id, this.departmentType});

  DepartmentBody.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    departmentType = json['departmentType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['departmentType'] = this.departmentType;
    return data;
  }
}
