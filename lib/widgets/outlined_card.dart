import 'package:flutter/material.dart';
import 'package:mobile_endoendo/core/values.dart';

class OutlinedCard extends Card {
  OutlinedCard({Key? key, required Widget child})
      : super(
          key: key,
          child: child,
          shape: RoundedRectangleBorder(
              side: const BorderSide(
                  color: Colors.black, width: outlineThickness, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(outlineRadius)),
          clipBehavior: Clip.hardEdge,
          elevation: 0,
        );
}
