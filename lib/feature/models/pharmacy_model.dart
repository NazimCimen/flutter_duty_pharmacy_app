class PharmacyModel {
  String? status;
  String? message;
  int? systemTime;
  int? rowCount;
  List<Data>? data;

  PharmacyModel(
      {this.status, this.message, this.systemTime, this.rowCount, this.data});

  PharmacyModel.fromJson(Map<String, dynamic> json) {
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
  String? eczaneAdi;
  String? adresi;
  String? semt;
  String? yolTarifi;
  String? telefon;
  String? telefon2;
  String? sehir;
  String? ilce;
  double? latitude;
  double? longitude;
  int? distanceMt;
  double? distanceKm;
  double? distanceMil;

  Data(
      {this.eczaneAdi,
      this.adresi,
      this.semt,
      this.yolTarifi,
      this.telefon,
      this.telefon2,
      this.sehir,
      this.ilce,
      this.latitude,
      this.longitude,
      this.distanceMt,
      this.distanceKm,
      this.distanceMil});

  Data.fromJson(Map<String, dynamic> json) {
    eczaneAdi = json['EczaneAdi'];
    adresi = json['Adresi'];
    semt = json['Semt'];
    yolTarifi = json['YolTarifi'];
    telefon = json['Telefon'];
    telefon2 = json['Telefon2'];
    sehir = json['Sehir'];
    ilce = json['ilce'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    distanceMt = json['distanceMt'];
    distanceKm = json['distanceKm'];
    distanceMil = json['distanceMil'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EczaneAdi'] = this.eczaneAdi;
    data['Adresi'] = this.adresi;
    data['Semt'] = this.semt;
    data['YolTarifi'] = this.yolTarifi;
    data['Telefon'] = this.telefon;
    data['Telefon2'] = this.telefon2;
    data['Sehir'] = this.sehir;
    data['ilce'] = this.ilce;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['distanceMt'] = this.distanceMt;
    data['distanceKm'] = this.distanceKm;
    data['distanceMil'] = this.distanceMil;
    return data;
  }
}
