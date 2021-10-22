import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'values.dart';

const textThemes = TextTheme(
  headline1: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700, color: primaryTextColor),
  headline2: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700, color: primaryTextColor),
  headline3: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700, color: primaryTextColor),
  bodyText1: TextStyle(fontSize: 16.0, color: primaryTextColor),
  bodyText2: TextStyle(fontSize: 14.0, color: primaryTextColor),
  caption: TextStyle(fontSize: 12.0, color: primaryTextColor),
);

MarkdownStyleSheet getMarkdownStyleSheet(BuildContext context) =>
    MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
        blockSpacing: marginMedium,
        horizontalRuleDecoration: ShapeDecoration(shape: Border.all(color: Colors.black12)));

const primaryColor = Colors.blue;
const surfaceColor = Colors.white;
final toolbarBgkColor = Colors.grey[300];
final chipBgkColor = Colors.grey[200];
const primaryTextColor = Colors.black;
