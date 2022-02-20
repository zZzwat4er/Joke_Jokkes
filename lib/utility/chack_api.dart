import 'dart:convert';
import 'joke.dart';
import 'package:http/http.dart';

class ChackAPI {
  static const String _jokeBaseUri = 'https://api.chucknorris.io/jokes/';

  static Future<Joke> getRandomJoke(String? category) async {
    final json = await get(Uri.parse(category == null? '${_jokeBaseUri}random' : '${_jokeBaseUri}random?category=$category'));
    final joke = Joke.fromJson(jsonDecode(json.body) as Map<String, Object?>);
    return joke;
  }

  static Future<List<String>> getCategoryes() async{
    final jsonT = await get(Uri.parse('${_jokeBaseUri}categories'));
    final categoryes = json.decode(jsonT.body);
    final ret = (categoryes as List<dynamic>).map((e) => e as String,).toList(growable: true);
    ret.insert(0, 'none');
    return ret;
  }
}
