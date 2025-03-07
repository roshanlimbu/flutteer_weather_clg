import 'package:day4/features/home/model/weather.dart';
import 'package:day4/features/home/repo/weather_repo.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<WeatherModel>(
          future: WeatherRepo.getWeather(), // Fetch the weather data
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }

            // Check if snapshot.data is null
            if (snapshot.hasData) {
              final weather = snapshot.data!;
              return SizedBox(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        "assets/images/cloud.jpeg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 24,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.white),
                              Text(
                                "Kathmandu, Nepal",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Today, Sun",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            width: 180,
                            child: Stack(
                              children: [
                                Text(
                                  "${weather.temp_c}", 
                                  style: TextStyle(
                                    fontSize: 100,
                                    color: Colors.white,
                                  ),
                                ),
                                Positioned(
                                  right: 15,
                                  top: 40,
                                  child: Text(
                                    "°C",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }

            // If no data is available, show a message
            return Center(child: Text("No weather data available"));
          },
        ),
      ),
    );
  }
}