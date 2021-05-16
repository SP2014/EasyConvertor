import 'package:easy_convertor/ui/component/container_with_loading.dart';
import 'package:easy_convertor/ui/component/number_pad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Easy Convertor"),
        actions: [],
      ),
      body: ContainerWithLoading(child: HookBuilder(builder: (context) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Time
              // Distance
              // Scientific
              // Weight
              //
              Expanded(flex: 1, child: Container()),
              Expanded(child: NumberPad(
                onPressed: (v) {
                  print("Pressed: $v");
                },
              ))
            ],
          ),
        );
      })),
    );
  }
}
