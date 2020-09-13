import 'package:flutter/material.dart';
import 'package:password_generator/model/websites.dart';
import 'package:password_generator/view_model/websites_view_model.dart';

class WebsitesListView extends WebsitesListViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView.builder(
        itemCount: website.length,
        itemBuilder: (context, index) => ListTileHttp(website[index]),
      ),
    );
  }

  ListTile ListTileHttp(Website site) {
    return ListTile(
      leading: Container(
        child: Image.network(site.logoUrl),
      ),
      title: Center(
        child: Text(site.siteName),
      ),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    title: Text("Password-Generator"),
  );
}
