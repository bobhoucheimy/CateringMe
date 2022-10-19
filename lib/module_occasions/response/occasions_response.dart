class OccasionsResponse {
   OccasionsResponse({
     this.id,
     this.title,
     this.date,
   });

    int? id;
   String? title;
   String? date;


     OccasionsResponse.fromJson(Map<String, dynamic> json)  {
       title =  json["title"];
       id = json["id"];
       if(json["date"] != null){
         String ddate = json["date"];
         date = ddate.split('T').first;
       }

     }
 }
