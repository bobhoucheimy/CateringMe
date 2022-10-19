class CreateCreditRequest {
  String? token;
  String name;
  String cvv;

  CreateCreditRequest({required this.token,required this.name,required this.cvv});

  Map<String, dynamic> toJson() {
    return {'token': token ?? 0, 'name': name, "cvv": cvv};
  }
}
