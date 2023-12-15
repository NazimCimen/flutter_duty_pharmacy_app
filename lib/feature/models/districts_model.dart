class DistrictModel {
  String? status;
  String? message;
  int? systemTime;
  int? rowCount;
  List<Data>? data;

  DistrictModel(
      {this.status, this.message, this.systemTime, this.rowCount, this.data});

  DistrictModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    systemTime = json['systemTime'];
    rowCount = json['rowCount'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['systemTime'] = this.systemTime;
    data['rowCount'] = this.rowCount;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? ilceAd;
  String? ilceSlug;

  Data({this.ilceAd, this.ilceSlug});

  Data.fromJson(Map<String, dynamic> json) {
    ilceAd = json['ilceAd'];
    ilceSlug = json['ilceSlug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ilceAd'] = this.ilceAd;
    data['ilceSlug'] = this.ilceSlug;
    return data;
  }
}
