class WeatherModel{
  final String country;
  final String region;
  final double temp_c;

  WeatherModel({required this.country, required this.region, required this.temp_c});

  factory WeatherModel.fromJson(Map<String, dynamic> json){
    return WeatherModel(
      country: json['location''name'],
      region: json['location']['region'],
      temp_c: json['current']['temp_c'],
    );
  }

}
