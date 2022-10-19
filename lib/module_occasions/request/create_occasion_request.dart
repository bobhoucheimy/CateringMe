class CreateOccasionRequest {
  int? id;
  String title;
  String dateTime;

  CreateOccasionRequest({this.id,required this.title,required this.dateTime});

  Map<String, dynamic> toJson() {
    return {'id': id ?? 0, 'Title': title, "Date": dateTime};
  }
}
