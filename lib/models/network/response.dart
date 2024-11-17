class ResponseModel {
  ResponseModel({
    this.statusCode,
    this.msg,
    this.data,
  });

  ResponseModel.fromJson(dynamic json) {
    statusCode = int.tryParse(json['statusCode'].toString());
    msg = json['msg']?.toString();
    data = json['data'];
  }

  int? statusCode;
  String? msg;
  dynamic data;

  ResponseModel copyWith({
    int? statusCode,
    String? msg,
    dynamic data,
  }) =>
      ResponseModel(
        statusCode: statusCode ?? this.statusCode,
        msg: msg ?? this.msg,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = statusCode;
    map['msg'] = msg;
    map['data'] = data;
    return map;
  }
}
