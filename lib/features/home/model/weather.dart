class WeatherModel {
  final String country;
  final String region;
  final double celsius;

  WeatherModel({
    required this.country,
    required this.region,
    required this.celsius,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      country: json['location']['country'],
      region: json['location']['region'],
      celsius: json['current']['temp_c'],
    );
  }
}