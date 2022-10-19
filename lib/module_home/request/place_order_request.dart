class PlaceOrderRequest {
  int? AddressId;
  int? ServiceId;
  String? eventName;
  String? eventDate;
  String? eventTime;
  int? numberOfGuest;
  String? contactName;
  String? contactPhone;
  List<int>? setupItem;
  List<OrderItem>? items = [];


  PlaceOrderRequest(
      this.AddressId,
      this.ServiceId,
      this.eventName,
      this.eventDate,
      this.eventTime,
      this.numberOfGuest,
      this.contactName,
      this.contactPhone,
      this.setupItem ,this.items);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['AddressId'] = this.AddressId;
    data['ServiceId'] = this.ServiceId;
    data['Event.EventName'] =this.eventName;
    data['Event.EventDate'] =this.eventDate;
    data['Event.EventTime'] =this.eventTime;
    data['Event.NumberOfGuestsId'] =this.numberOfGuest;
    data['SetupItems'] =this.setupItem;
    data['OrderItems'] = List<dynamic>.from(items!.map((x) => x.toJson()));
    return data;
  }

}

class OrderItem {
  int? id;
  int? quantity;

  OrderItem(this.id, this.quantity);

  Map<String, dynamic> toJson() {
    return {
      'itemId': id,
      'quantity':quantity
    };
  }
}