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

  static getAllLocallyDownloaded(DownloadModel downloadModel) async {
    var db = await openDatabase(databaseName);
    var res = await db.transaction((txn) {
      return txn.rawQuery("Select * from $downloadMaster where status = 1");
    });
    return res;
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
