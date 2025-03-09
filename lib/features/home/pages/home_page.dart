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
        child: FutureBuilder(
          future: WeatherRepo.getWeatherData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error.toString()}");
            }

            final weatherModel = snapshot.data;

            return SizedBox(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/cloud.jpeg',
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
                            Icon(Icons.location_on),
                            Text(
                              "${weatherModel?.region}, ${weatherModel?.country} ",
                            ),
                          ],
                        ),

                        SizedBox(height: 8),

                        Text("Today, Sun"),

                        // SizedBox(height: 12),
                        SizedBox(
                          width: 280,
                          child: Stack(
                            children: [
                              Text(
                                "${weatherModel?.celsius}",
                                style: TextStyle(fontSize: 100),
                              ),
                              Positioned(
                                right: -5,
                                top: 30,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,

                                        border: Border.all(width: 3),

                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Text(
                                      "C",
                                      style: TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.w500,
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
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}