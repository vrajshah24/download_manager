class DownloadModel {
  final int? id;
  final String userid;
  final String date;
  final int status;

  DownloadModel(
      {this.id,
      required this.userid,
      required this.date,
      required this.status});
  toJson() {
    return {"id": id, "userid": userid, "date": date, "status": status};
  }

  fromJson(Map<String, dynamic> first) {
    return DownloadModel(
        userid: first['userid'], date: first['date'], status: first['status']);
  }
}
