import 'package:flutter/material.dart';
import 'package:interinship_task/services/animations.dart';
import 'package:provider/provider.dart';

import 'provider.dart';

class Home_task_keyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Home_task_keyProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.watch<Home_task_keyProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Example How to use key"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              NumberCard(
                  child: '1',
                  function: () {
                    provider.addElementList("1", 0);
                  }),
              NumberCard(
                  child: '2',
                  function: () {
                    provider.addElementList("2", 1);
                  }),
              NumberCard(
                  child: '3',
                  function: () {
                    provider.addElementList("3", 2);
                  }),
            ],
          ),
          Row(
            children: [
              NumberCard(
                  child: '4',
                  function: () {
                    provider.addElementList("4", 3);
                  }),
              NumberCard(
                  child: '5',
                  function: () {
                    provider.addElementList("5", 4);
                  }),
              NumberCard(
                  child: '6',
                  function: () {
                    provider.addElementList("6", 5);
                  }),
            ],
          ),
          Row(
            children: [
              NumberCard(
                  child: '7',
                  function: () {
                    provider.addElementList("7", 6);
                  }),
              NumberCard(
                  child: '8',
                  function: () {
                    provider.addElementList("8", 7);
                  }),
              NumberCard(
                  child: '9',
                  function: () {
                    provider.addElementList("9", 8);
                  }),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: BottomSheet(
            backgroundColor: Colors.grey,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            ),
            builder: (BuildContext context) {
              if (provider.isTap) {
                return FadeAnimation(
                  keyText: PageStorageKey(provider.tapIndex),
                  delay: 1,
                  child: ListTile(
                    leading:
                        Text(provider.numbers[provider.tapIndex].toString()),
                    title: Text(
                        provider.numbersText[provider.tapIndex].toString()),
                  ),
                );
              }
              return ListView.builder(
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: provider.numbers.length,
                  itemBuilder: (context, index) {
                    return FadeAnimation(
                      delay: 1,
                      child: ListTile(
                        leading: Text(provider.numbers[index].toString()),
                        title: Text(provider.numbersText[index].toString()),
                      ),
                    );
                  });
            },
            onClosing: () {
              Navigator.pop(context);
            },
          ))
        ],
      ),
    );
  }

  Widget NumberCard({required Function() function, required String child}) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: OutlinedButton(
        onPressed: function,
        child: Text(child),
      ),
    ));
  }
}
