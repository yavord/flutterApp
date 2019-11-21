import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Post {
  final String body;
  final String title;
  final String test;

  Post({this.body, this.title, this.test});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      body: json['body'],
      title: json['title'],
      );
  }

  factory Post.fromJson2(Map<String, dynamic> json) {
    return Post(test: json['test2']);
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map['title'] = title;
    map['body'] = body;
    return map;
  }
}

Future<Post> fetchPost() async {
  final List urlTest = [
    'https://jsonplaceholder.typicode.com/posts/1', 
    'https://app.centryl.com/api/get-therapy/v1/get-therapy',
  ];
  final response = await http.get(urlTest[1]);

  if(response.statusCode == 200) {
    return Post.fromJson2(json.decode(response.body));
  } else {
    throw Exception('Error fetching data.');
  }
}