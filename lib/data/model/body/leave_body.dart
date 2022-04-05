class LeaveBody {
  String leaveType;
  String startDate;
  String endDate;
  String reason;
  String remark;

  LeaveBody(
      {this.leaveType, this.startDate, this.endDate, this.reason, this.remark});

  LeaveBody.fromJson(Map<String, dynamic> json) {
    leaveType = json['leaveType'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    reason = json['reason'];
    remark = json['remark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['leaveType'] = this.leaveType;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['reason'] = this.reason;
    data['remark'] = this.remark;
    return data;
  }
}
