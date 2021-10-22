import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_endoendo/core/theme.dart';
import 'package:mobile_endoendo/core/values.dart';

class PaddedChip extends StatelessWidget {
  final String label;

  const PaddedChip({required this.label, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: marginTiny),
      child: Chip(
        labelStyle: Theme.of(context).textTheme.bodyText2,
        label: Text(label),
        labelPadding: const EdgeInsets.all(superTiny),
        backgroundColor: chipBgkColor,
      ));
}
