import 'dart:convert';

import 'package:notification/user.dart';
import 'package:http/http.dart' as http;

class ApiServices {

  Future<User> getJson(http.Client client) async {

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    var res = await client.get(uri);
    if(res.statusCode == 200){
      var data = json.decode(res.body);

      return User.fromJson(data);
    }

    else{
      throw Exception('something went wrong');
    }
  }
}