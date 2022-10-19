class AddressResponse {
  AddressResponse({
     this.id,
     this.city,
     this.country,
     this.street,
     this.buildingName,
    this.title,
    this.floorNumber ,
    this.latitude,
    this.longitude,
    this.isSelected = false
   });

    int? id;
   String? city;
   String? country;
   String? street;
   String? buildingName;
   String? title;
   String? longitude;
   String? latitude;
   int? floorNumber;
   bool?  isSelected;


  AddressResponse.fromJson(Map<String, dynamic> json)  {
       country =  json["country"];
       id = json["id"];
       city = json["city"];
       buildingName = json["buildingName"];
       street = json["street"];
       title = json["title"];
       longitude = json["longitude"];
       latitude = json["latitude"];
       floorNumber = json["floorNumber"];
       isSelected = false;
     }
 }
