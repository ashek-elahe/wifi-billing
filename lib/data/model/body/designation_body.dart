class DesignationBody {
  int id;
  String designationType;

  DesignationBody({this.id, this.designationType});

  DesignationBody.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    designationType = json['designationType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['designationType'] = this.designationType;
    return data;
  }
}
