import 'package:api_practice/Post.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class RemoteS
{
  Future<Prayer?> getP() async
  {
    var client = http.Client();

    var url = Uri.parse('http://api.aladhan.com/v1/timingsByCity?city=Tunis&country=Tunis&method=8');

    var rp = await client.get(url);

    if (rp.statusCode == 200)
      {

        var json = rp.body;

       return prayerFromJson(json);
      }

  }
}