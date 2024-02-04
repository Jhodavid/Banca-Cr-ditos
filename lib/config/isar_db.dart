import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';


import 'package:banca_creditos/domain/entities/user_entity.dart';



class IsarDB {
  static Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([
          UserEntitySchema
        ],
        inspector: true,
        directory: dir.path
      );
    }

    return Future.value(Isar.getInstance());
  }
}