import 'package:download_manager/Database/local/models/downloadModel.dart';
import 'package:download_manager/Database/local/tables.dart';
import 'package:sqflite/sqflite.dart';

class DownloadManagerDatabase {
  static createDownloadLog(DownloadModel downloadModel) async {
    var db = await openDatabase(databaseName);
    var res = await db.transaction((txn) {
      return txn.insert(downloadMaster, downloadModel.toJson());
    });
    return res;
  }

  static getAllLocallyDownloaded() async {
    var db = await openDatabase(databaseName);
    var res = await db.transaction((txn) {
      return txn.rawQuery("Select * from $downloadMaster where status = 0");
    });
    print(res);
    if (res.isEmpty) {
      return [];
    } else {
      return res.map((e) => DownloadModel.fromJson(e)).toList();
    }
  }

  static getAllRemotelyDownloaded() async {
    var db = await openDatabase(databaseName);
    var res = await db.transaction((txn) {
      return txn.rawQuery("Select * from $downloadMaster where status = 1");
    });
    if (res.isEmpty) {
      return [];
    } else {
      return res.map((e) => DownloadModel.fromJson(e)).toList();
    }
  }

  static updateStatusToDownloaded(int id) async {
    var db = await openDatabase(databaseName);
    var res = await db.transaction((txn) {
      return txn
          .rawQuery("Update $downloadMaster set status =  1  where id = $id");
    });
    return res;
  }
}
