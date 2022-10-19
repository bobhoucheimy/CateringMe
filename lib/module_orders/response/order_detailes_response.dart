class OrderDetailsResponse {
  OrderDetailsResponse({
    this.id,
    this.profileId,
    this.addressId,
    this.addressTitle,
    this.country,
    this.street,
    this.buildingName,
    this.floorNumber,
    this.total,
    this.orderStatus,
    this.orderStatusAr,
    this.eventDate,
    this.eventName,
    this.numberOfGuests,
  });

  int? id;
  int? profileId;
  int? addressId;
  String? addressTitle;
  String? country;
  String? street;
  String? buildingName;
  int? floorNumber;
  num? total;
  String? orderStatus;
  String? orderStatusAr;
  DateTime? eventDate;
  String? eventName;
  String? numberOfGuests;

  factory OrderDetailsResponse.fromJson(Map<String, dynamic> json) => OrderDetailsResponse(
    id: json["id"],
    profileId: json["profileId"],
    addressId: json["addressId"],
    addressTitle: json["addressTitle"],
    country: json["country"],
    street: json["street"],
    buildingName: json["buildingName"],
    floorNumber: json["floorNumber"],
    total: json["total"],
    orderStatus: json["orderStatus"],
    orderStatusAr: json["orderStatusAR"],
    eventDate: DateTime.parse(json["eventDate"]),
    eventName: json["eventName"],
    numberOfGuests: json["numberOfGuests"],
  );
}
