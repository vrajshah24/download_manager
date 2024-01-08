import 'package:download_manager/Database/local/tables.dart';

String createTableforDownloadMaster =
    "create table if not exists $downloadMaster(id INTEGER , url TEXT , date TEXT,user_id TEXT,status INTEGER, PRIMARY KEY(id AUTOINCREMENT))";
