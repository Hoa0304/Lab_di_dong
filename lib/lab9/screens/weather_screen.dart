import 'package:flutter/material.dart';
import '../services/weather.dart';

class WeatherScreen extends StatefulWidget {
  final weatherData;

  WeatherScreen({this.weatherData});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late int temperature;
  late String cityName;
  late String weatherIcon;
  late String weatherMessage;

  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        cityName = 'Không thể lấy dữ liệu';
        weatherIcon = '🤷‍';
        weatherMessage = 'Thử lại sau!';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      cityName = weatherData['name'];
      int condition = weatherData['weather'][0]['id'];
      weatherIcon = WeatherModel().getWeatherIcon(condition);
      weatherMessage = WeatherModel().getMessage(temperature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Thời tiết')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              cityName,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              '$temperature°C',
              style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
            ),
            Text(
              weatherIcon,
              style: TextStyle(fontSize: 50),
            ),
            Text(
              weatherMessage,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
