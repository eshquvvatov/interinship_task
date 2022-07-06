import 'package:flutter/material.dart';

import 'get_api_page.dart';

class MyStateManagement extends StatelessWidget {
  const MyStateManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myProvider=MyStateManagementProvider.watch(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text("MyStateManagementProvider"),
      ),
      body:myProvider.isLoading?Center(
        child: CircularProgressIndicator()
      ):
          ListView.builder(
             itemCount:myProvider.posts.length,
              itemBuilder: (context,index){
            return Card(
              child: Text(myProvider.posts[index].body!),
            );
          })
    );
  }
}

class MyStateManagementProvider extends InheritedNotifier<MyProvider> {
  const MyStateManagementProvider({
    Key? key,
    required MyProvider model,
    required Widget child,
  }) : super(key: key, notifier: model, child: child);

  static MyProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<MyStateManagementProvider>()
        ?.notifier;
  }

  static MyProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<MyStateManagementProvider>()
        ?.widget;
    return widget is MyStateManagementProvider ? widget.notifier : null;
  }
}
