import 'dart:convert';
import 'package:http/http.dart' as http;

class Gpt {
  Future<String> getData(String prompt) async {
    String link = "https://api.openai.com/v1/chat/completions";
    var uri = Uri.parse(link);
    var header = {
        "Content-Type": "application/json" ,
        "Authorization": "pretend a key here " ,
    };
      var body = {
        "model": "gpt-4o-mini",
        "messages": [
            {
                "role": "system",
                "content": "You are a helpful assistant."
            },
            {
                "role": "user",
                "content": "Write a haiku that explains the concept of recursion."
            }
        ]
    };
    var request = await http.post(
      uri,
      headers: header,
      body: json.encode(body),
    );
    var response = json.decode(request.body);
    String content = response["choices"][0]["message"]["content"];
    print(content);
    return content;

  }
}