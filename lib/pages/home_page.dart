import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:interinship_task/controller/home_controller.dart';
import 'package:provider/provider.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
   return  ChangeNotifierProvider(
    create: (BuildContext context) {
      Provider.of<HomeController>(context, listen:true).addList();
    },
    child: Consumer<HomeController>(
    builder: (context, model, index) =>
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Contacts"),
            actions: [
              Icon(Icons.search),
            ],
          ),
          body: ListView.builder(
              itemCount: 10,
              itemBuilder:(context, index){
                return ListTile(
                  leading:CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.transparent,
                    child: CachedNetworkImage(
                      imageUrl:"",
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey.shade200,
                      ),
                      errorWidget: (context, url, error) => CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey.shade200,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("ok"),
                      Text("hello")
                    ],
                  ),
                );
              }),
          drawer: const Drawer(),
        )
    )
    );

  }
}
