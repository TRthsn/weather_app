class Weather {
  String? name;
  double? temprature;
  String? condition;

  Weather({this.name, this.temprature, this.condition});

  Weather.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    temprature = json['main']['temp'].toDouble();
    condition = json['weather'][0]['main'];
  }
}
