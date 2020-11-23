
class UserHistory{
  String driverFirstName;
  String startStreet;
  String startZone;
  String deliveryStreet;
  String deliveryZone;
  String dateDelivery;
  String driverPhone;
  String travelStatus;

  UserHistory(this.driverFirstName, this.startStreet, this.startZone, this.deliveryStreet, this.deliveryZone, this.dateDelivery, this.driverPhone, this.travelStatus);

  UserHistory.fromJson(Map<String, dynamic> json){
    driverFirstName = json['driverFirstName'];
    startStreet = json['startStreet'];
    startZone = json['startZone'];
    deliveryStreet = json['deliveryStreet'];
    deliveryZone = json['deliveryZone'];
    dateDelivery = json['dateDelivery'];
    driverPhone = json['driverPhone'];
    travelStatus = json['travelStatus'];
  }

}