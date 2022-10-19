
class WebServiceResponse {
  int _code;
  String _errorMessage;
  Data _data;
  WebServiceResponse(this._code, this._errorMessage, this._data);
  factory WebServiceResponse.fromJson(Map<String, dynamic> item) {
    return WebServiceResponse(
      item['statusCode'],
      item['errorMessage'],
      ///first data
      Data.fromJson(item['data'])  ,
    );
  }
  get data => _data;
  String get errorMessage => _errorMessage;
  int get code => _code;
}

class Data {
  dynamic insideData;
  Data(
      { this.insideData,
      });
  ///inside data
  factory Data.fromJson(Map<String, dynamic> json) => Data(
    insideData: json["data"],
  );
}