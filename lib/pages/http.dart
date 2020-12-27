import 'dart:convert';

import 'package:flutter/material.dart';
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

class HttpPage extends StatefulWidget {
  @override
  _HttpPageState createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
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

  Future postRequest() async {
    String url = "https://biolab.ga/biolab-api/oauth/token";

    final data = {
      'username': "miguel.ospina@softlond.co",
      'password': "240690",
      'grant_type': 'password',
      'client_id': 'spring-security-oauth2-read-write-client'
    };
    final response = await http.post(url, body: data, headers: {
      'Authorization':
          'Basic c3ByaW5nLXNlY3VyaXR5LW9hdXRoMi1yZWFkLXdyaXRlLWNsaWVudDpzcHJpbmctc2VjdXJpdHktb2F1dGgyLXJlYWQtd3JpdGUtY2xpZW50LXBhc3N3b3JkMTIzNA=='
    });

    var responseData = json.decode(response.body);

    print("responseData");
    print(responseData);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    postRequest();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Http Get Request."),
          leading: Icon(
            Icons.get_app,
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: FutureBuilder(
            future: getRequest(),
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (ctx, index) => ListTile(
                    title: Text(snapshot.data[index].title),
                    subtitle: Text(snapshot.data[index].body),
                    contentPadding: EdgeInsets.only(bottom: 20.0),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
