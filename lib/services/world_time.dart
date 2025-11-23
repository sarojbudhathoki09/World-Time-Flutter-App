import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location;  // location name for the UI
  late String time;  //time of that location
  String flag;  //url to an asset flag icon
  String url; //location url for api endpoint
  bool? isDaytime; //true or false if day time or not

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void>  getTime() async {

    try{
      var urlNow = Uri.parse('https://timeapi.io/api/TimeZone/zone?timeZone=$url');
      http.Response response = await http.get(urlNow);
      Map data = jsonDecode(response.body);

      // get local time
      String datetime = data['currentLocalTime'];

      DateTime now = DateTime.parse(datetime);

      //set the time property
      isDaytime = now.hour > 6 && now.hour < 18 ? true: false;
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }


  }
}


