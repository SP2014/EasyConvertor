import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NumberPad extends HookWidget {
  final Function onPressed;
  const NumberPad({ @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: []),
      child: Column(
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
      child: Row(children: digits.map((e) => _digitView(e)).toList()),
    );
  }

  Widget _digitView(String key) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(4.0),
        onTap: () => onPressed(key),
        child: Center(
          child: Text(key,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              )),
        ),
      ),
    );
  }
}
