import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'main.dart';

class EveryDaySoftState extends HookConsumerWidget {
  var count = 1;
  var myApp = MyApp();

  Widget build(BuildContext context, WidgetRef ref) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("EveryDaySoft_Example"),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Container(
                  color: count * 180 > screenHeight
                      ? (count % 2 == 0)
                          ? Colors.yellow
                          : Colors.white
                      : Colors.grey,
                  child: ListView.builder(
                    itemCount: count,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        child: GestureDetector(
                          onTap: () {
                            ref.watch(myApp.counterStateProvider);
                            count = ref
                                .read(myApp.counterStateProvider.state)
                                .state = count + 1;
                          },
                          child: Container(
                            height: 150,
                            decoration: new BoxDecoration(
                              color: (index % 2 == 0)
                                  ? Colors.white
                                  : Colors.yellow,
                            ),
                            child: Row(
                              children: <Widget>[
                                Text("List"),
                                Text("$index"),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
