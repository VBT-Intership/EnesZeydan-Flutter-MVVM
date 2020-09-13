import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:password_generator/model/websites.dart';
import 'package:password_generator/view/list_websites.dart';
import 'package:http/http.dart' as http;

abstract class WebsitesListViewModel extends State<WebsitesList> {
  final baseUrl = "https://fir-task-3c81f.firebaseio.com/";

  List<Website> website = [];

  @override
  void initState() {
    super.initState();
    callItems();
  }

  Future<void> callItems() async {
    await getWebsite();
  }

  Future<void> getWebsite() async {
    final response = await http.get("$baseUrl/-MG8bOaqwdm8ch05vhA5");
    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonBody = jsonDecode(response.body);
        if (jsonBody is List)
          website = jsonBody.map((e) => Website.fromJson(e)).toList();
        break;
      default:
    }
  }
}
