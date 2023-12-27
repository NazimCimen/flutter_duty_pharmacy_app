class CitiesModel {
  String? status;
  String? message;
  int? systemTime;
  int? rowCount;
  List<Data>? data;

  CitiesModel(
      {this.status, this.message, this.systemTime, this.rowCount, this.data});

  CitiesModel.fromJson(Map<String, dynamic> json) {
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
  String? sehirAd;
  String? sehirSlug;

  Data({this.sehirAd, this.sehirSlug});

  Data.fromJson(Map<String, dynamic> json) {
    sehirAd = json['SehirAd'];
    sehirSlug = json['SehirSlug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SehirAd'] = this.sehirAd;
    data['SehirSlug'] = this.sehirSlug;
    return data;
  }
}
