import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notification/api_service.dart';
import 'package:http/http.dart' as http;
import 'package:notification/user.dart';

import 'json_placeholder_test.mocks.dart';


@GenerateMocks([http.Client])
void main(){
  ApiServices apiServices = ApiServices();
  
  group("fetch users", (){
    test("returns a Post if the http call completes successfully", () async {
      var client = MockClient();
      when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'))).thenAnswer((_) async {
        return http.Response('{ "userId": 1, "id": 2, "title": "Wellboy", "body": "0" }', 200);
      });
      
      expect(await apiServices.getJson(client), isA<User>());
    });

    test('throws exception on bad request', () async {
      var client = MockClient();
      when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'))).thenAnswer((_) async{
        return http.Response('bad request', 404);
      });
      expect( apiServices.getJson(client), throwsException);
    });
  });
}