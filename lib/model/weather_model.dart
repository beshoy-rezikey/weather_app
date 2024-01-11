class WheatherModel {
  final String cityname;
  final DateTime date;
  final String? image;
  final double ?temp;
  final double ? maxTemp;
  final double? minTemp;
  final String weatherComdition;

  WheatherModel(
      {required this.cityname,
      required this.date,
      this.image,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherComdition});

  factory WheatherModel.fromJson(Map <String ,dynamic> json) {
    return WheatherModel(
        image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
        cityname: json['location']['name'],
        date: DateTime.parse(json['current']['last_updated']),
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        weatherComdition: json['forecast']['forecastday'][0]['day']['condition']
            ['text']);
  }
}
