import 'package:catfacts/app/constants.dart';
import 'package:flutter/services.dart';

mixin RefreshImage {
  Future<Uint8List> toNew() async {
    Uint8List bytes =
        (await NetworkAssetBundle(Uri.parse(Constants.randomImageUrl))
                .load(Constants.randomImageUrl))
            .buffer
            .asUint8List();
    return bytes;
  }
}
