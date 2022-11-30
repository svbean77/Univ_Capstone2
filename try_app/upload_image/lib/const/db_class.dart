class UploadData {
  List<Result>? result;

  UploadData({this.result});

  UploadData.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  int? freeid;
  String? freetitle;
  String? freecontent;
  String? freefilename;
  String? freefilepath;
  String? freewriter;

  Result(
      {this.freeid,
        this.freetitle,
        this.freecontent,
        this.freefilename,
        this.freefilepath,
        this.freewriter});

  Result.fromJson(Map<String, dynamic> json) {
    freeid = json['freeid'];
    freetitle = json['freetitle'];
    freecontent = json['freecontent'];
    freefilename = json['freefilename'];
    freefilepath = json['freefilepath'];
    freewriter = json['freewriter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['freeid'] = this.freeid;
    data['freetitle'] = this.freetitle;
    data['freecontent'] = this.freecontent;
    data['freefilename'] = this.freefilename;
    data['freefilepath'] = this.freefilepath;
    data['freewriter'] = this.freewriter;
    return data;
  }
}