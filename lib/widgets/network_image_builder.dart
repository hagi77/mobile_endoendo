import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_endoendo/core/extension_functions.dart';
import 'package:mobile_endoendo/core/values.dart';

import 'exception_widget.dart';

class NetworkImageBuilder extends StatelessWidget {
  Future<Uint8List?> imageFuture;

  NetworkImageBuilder(this.imageFuture, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: imageFuture,
        builder: (context, snapshot) {
          if (snapshot.loaded) {
            return AnimatedSwitcher(
              child: Image(
                image: MemoryImage(snapshot.data as Uint8List),
                fit: BoxFit.fitHeight,
                width: 79,
                height: 79,
              ),
              duration: const Duration(milliseconds: shortAnim),
            );
          } else if (snapshot.hasError) {
            return AnimatedSwitcher(
                child: ExceptionWidget(message: AppLocalizations.of(context)?.generalException),
                duration: const Duration(milliseconds: shortAnim));
          } else {
            return AnimatedSwitcher(
              child: Container(
                width: 79,
                height: 79,
                padding: const EdgeInsets.all(marginSmall),
                alignment: Alignment.center,
                child: const CircularProgressIndicator.adaptive(),
              ),
              duration: const Duration(milliseconds: shortAnim),
            );
          }
        });
  }
}
