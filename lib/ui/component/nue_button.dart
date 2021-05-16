import 'package:easy_convertor/ui/component/neumorphic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

import 'concave_decoration.dart';

class NeuButton extends HookWidget {
  final bool isPill;
  final VoidCallback onPressed;
  final String text;
  final Color textColor;
  final double textSize;
  NeuButton(
      {Key key,
      @required this.text,
      this.isPill = false,
      this.textColor,
      this.textSize,
      @required this.onPressed})
      : super(key: key);

  // void _onPointerDown(PointerDownEvent event){

  // }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final squareSideLength = width / 5;
    final buttonWidth = squareSideLength * (isPill ? 2.2 : 1);
    final buttonSize = Size(buttonWidth, squareSideLength);
    final _isPressed = useState(false);
    //final neuTheme = useProvider(neuThemeStateProvider);

    final innerShadow = ConcaveDecoration(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonSize.width)),
        colors: darkNeumorphicTheme.innerShadowColors,
        depression: 10);

    final outerShadow = BoxDecoration(
        border: Border.all(color: darkNeumorphicTheme.borderColor),
        borderRadius: BorderRadius.circular(buttonSize.width),
        color: darkNeumorphicTheme.buttonColor,
        boxShadow: darkNeumorphicTheme.outerShadow);

    return SizedBox(
        height: buttonSize.height,
        width: buttonSize.width,
        child: Listener(
          onPointerDown: (_) {
            _isPressed.value = true;
            onPressed();
          },
          onPointerUp: (_) {
            _isPressed.value = false;
          },
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 50),
                padding: EdgeInsets.all(width / 12),
                decoration: _isPressed.value ? innerShadow : outerShadow,
              ),
              Align(
                alignment: Alignment(isPill ? -0.6 : 0, 0),
                child: Text(text,
                    style: GoogleFonts.montserrat(
                      fontSize: textSize ?? 30,
                      fontWeight: FontWeight.w200,
                      color: textColor ??
                          Theme.of(context).textTheme.bodyText1.color,
                    )),
              )
            ],
          ),
        ));
  }
}
