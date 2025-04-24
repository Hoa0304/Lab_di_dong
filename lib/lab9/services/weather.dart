import './networking.dart';
import './location.dart';

const apiKey = '53269d7af57e9fe46010e590d9dc4c2f';
const weatherApiURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper =
        NetworkHelper(url: '$weatherApiURL?q=$cityName&appid=$apiKey&units=metric&lang=vi');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    if (location.latitude == null || location.longitude == null) {
      return null;
    }

    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$weatherApiURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric&lang=vi');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 500) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '❄️';
    } else if (condition < 800) {
      return '☁️';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 30) {
      return 'Thời tiết nóng!';
    } else if (temp > 20) {
      return 'Thời tiết dễ chịu!';
    } else if (temp > 10) {
      return 'Thời tiết mát mẻ!';
    } else {
      return 'Thời tiết lạnh!';
    }
  }
}
