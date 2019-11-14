//user_key: 7f53356061563612971605e2a9241763

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Meta meta;
  List<Datum> data;

  Welcome({
    this.meta,
    this.data,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) =>
      Welcome(
        meta: Meta.fromJson(json["meta"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() =>
      {
        "meta": meta.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String uid;
  Category category;

  Datum({
    this.uid,
    this.category,
  });

  factory Datum.fromJson(Map<String, dynamic> json) =>
      Datum(
        uid: json["uid"],
        category: categoryValues.map[json["category"]],
      );

  Map<String, dynamic> toJson() =>
      {
        "uid": uid,
        "category": categoryValues.reverse[category],
      };
}

enum Category { MEDICAL, VISION, DENTAL, THERAPY, SERVICES }

final categoryValues = EnumValues({
  "dental": Category.DENTAL,
  "medical": Category.MEDICAL,
  "services": Category.SERVICES,
  "therapy": Category.THERAPY,
  "vision": Category.VISION
});

class Meta {
  String dataType;
  int total;
  int count;
  int skip;
  int limit;
  String fieldsRequested;

  Meta({
    this.dataType,
    this.total,
    this.count,
    this.skip,
    this.limit,
    this.fieldsRequested,
  });

  factory Meta.fromJson(Map<String, dynamic> json) =>
      Meta(
        dataType: json["data_type"],
        total: json["total"],
        count: json["count"],
        skip: json["skip"],
        limit: json["limit"],
        fieldsRequested: json["fields_requested"],
      );

  Map<String, dynamic> toJson() =>
      {
        "data_type": dataType,
        "total": total,
        "count": count,
        "skip": skip,
        "limit": limit,
        "fields_requested": fieldsRequested,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

class DoctorList extends StatelessWidget {

  Future<Welcome> fetchPost() async {
    final response = await http.get(
        'https://api.betterdoctor.com/2016-03-01/specialties?fields=uid%2Ccategory&user_key=7f53356061563612971605e2a9241763');

    if (response.statusCode == 200) {
      return welcomeFromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            'Specific Speciality',
            style: TextStyle(
              color: Colors.black,
              fontSize: 26.0,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue[500],
        ),
        body: Container(
          color: Colors.transparent,
          child: FlatButton(
            child: Text(
                'Test'
            ),
            color: Colors.blue[500],
          ),
        )
    );
  }
}

