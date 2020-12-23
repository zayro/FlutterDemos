import 'dart:convert';
import 'package:http/http.dart' as http;

class Servicios {
  Future getRequest() async {
    //replace your restFull API here.
    String url = "https://jsonplaceholder.typicode.com/posts";
    final response = await http.get(url);

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    var users = [];
    for (var singleUser in responseData) {
      var user = {
        "id": singleUser["id"],
        "userId": singleUser["userId"],
        "title": singleUser["title"],
        "body": singleUser["body"]
      };

      //Adding user to the list.
      users.add(user);
    }

    //print(users);
    return users;
  }
}

void main() {
  final invoke = new Servicios();
  print(invoke.getRequest().toString());
}
