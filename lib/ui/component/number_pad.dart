import 'package:easy_convertor/ui/component/nue_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NumberPad extends HookWidget {
  final Function onPressed;
  const NumberPad({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: []),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _createDigits(['9', '8', '7']),
          _createDigits(['6', '5', '4']),
          _createDigits(['3', '2', '1']),
          _createDigits(['.', '0', ',']),
        ],
      ),
    );
  }

  Widget _createDigits(List<String> digits) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: digits
              .map((e) => NeuButton(
                    text: e,
                    onPressed: () => onPressed(e),
                    textColor: Colors.white,
                  ))
              .toList(),
        ),
        //children: digits.map((e) => _digitView(e)).toList()),
      ),
    );
  }

  Widget _digitView(String key) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(4.0),
          onTap: () => onPressed(key),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(key,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            ),
          ),
        ),
      ),
    );
  }
}
