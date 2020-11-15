import 'package:flutter/cupertino.dart';
import 'package:thetamedbot/locals/trans_data.dart';

class Translations {
  final Locale locale;
  Translations({@required this.locale});
  DataTrans dataTrans = DataTrans();

  String text(String key) {
    return dataTrans.localizedValues[locale.languageCode][key] ??
        dataTrans.localizedValues['en'][key] ??
        "******";
  }
}