class DownloadModel {
  final int? id;
  final String userid;
  final String url;
  final String date;
  final int status;

  DownloadModel(
      {this.id,
      required this.userid,
      required this.url,
      required this.date,
      required this.status});
  toJson() {
    return {
      "id": id,
      "url": url,
      "user_id": userid,
      "date": date,
      "status": status
    };
  }

  static fromJson(Map<String, dynamic> first) {
    return DownloadModel(
        userid: first['user_id'],
        url: first['url'],
        date: first['date'],
        status: first['status']);
  }
}
