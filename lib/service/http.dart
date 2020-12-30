import 'dart:convert';
import 'package:http/http.dart' as http;

//Creating a class user to store the data;
class User {
  final int id;
  final int userId;
  final String title;
  final String body;

  User({
    this.id,
    this.userId,
    this.title,
    this.body,
  });
}

class HttpFireBase {
//Applying get request.

  Future<List<User>> getRequest() async {
    //replace your restFull API here.
    String url = "https://jsonplaceholder.typicode.com/posts";
    final response = await http.get(url);

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<User> users = [];
    for (var singleUser in responseData) {
      User user = User(
          id: singleUser["id"],
          userId: singleUser["userId"],
          title: singleUser["title"],
          body: singleUser["body"]);

      //Adding user to the list.
      users.add(user);
    }
    return users;
  }

  Future<void> postRequest(data) async {
    print("init");
    //String url =  "https://semillero-flutter-259fd-default-rtdb.firebaseio.com/personas.json";

    String url = "https://webzav-7bee5.firebaseio.com/persona.json";

    final response = await http.post(url,
        body: data,
        headers: {'contentType': 'application/json; charset=utf-8'});

    var responseData = json.decode(response.body);

    print("responseData");
    print(responseData);
  }
}
/*
void main() async {
  final test = HttpFireBase();
  await test.getRequest();
}
*/
