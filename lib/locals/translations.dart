import 'package:thetamedbot/locals/trans_data.dart';

class Translations {
  DataTrans dataTrans = DataTrans();

  String text(String key) {
    return dataTrans.localizedValues['en'][key] ?? "******";
  }
}
