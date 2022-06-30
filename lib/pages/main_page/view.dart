import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'provider.dart';

class Main_pagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Main_pageProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final model = context.watch<Main_pageProvider>();

    if (!model.isLoading) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Contacts"),
          actions: const [
            Icon(Icons.search),
          ],
        ),
        body: Row(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: model.users!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.transparent,
                          child: CachedNetworkImage(
                            imageUrl: "",
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.blue.shade200,
                            ),
                            errorWidget: (context, url, error) => CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.blue.shade200,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model.users![index].title,
                              style: const TextStyle(color: Colors.red),
                            ),
                            Text(model.users![index].body)
                          ],
                        ),
                      );
                    })),
          ],
        ),
        drawer: const Drawer(),
      );
    }
    return Container(
      color: Colors.white,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
