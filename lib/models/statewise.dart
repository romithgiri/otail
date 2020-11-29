import 'dart:convert';

List<StateWise> stateWiseFromJson(dynamic str) => List<StateWise>.from(str.map((x) => StateWise.fromJson(x)));

String stateWiseToJson(List<StateWise> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StateWise {
  StateWise({
    this.active,
    this.confirmed,
    this.deaths,
    this.deltaconfirmed,
    this.deltadeaths,
    this.deltarecovered,
    this.lastupdatedtime,
    this.migratedother,
    this.recovered,
    this.state,
    this.statecode,
    this.statenotes,
  });

  String active;
  String confirmed;
  String deaths;
  String deltaconfirmed;
  String deltadeaths;
  String deltarecovered;
  String lastupdatedtime;
  String migratedother;
  String recovered;
  String state;
  String statecode;
  String statenotes;

  factory StateWise.fromJson(Map<String, dynamic> json) => StateWise(
    active: json["active"],
    confirmed: json["confirmed"],
    deaths: json["deaths"],
    deltaconfirmed: json["deltaconfirmed"],
    deltadeaths: json["deltadeaths"],
    deltarecovered: json["deltarecovered"],
    lastupdatedtime: json["lastupdatedtime"],
    migratedother: json["migratedother"],
    recovered: json["recovered"],
    state: json["state"],
    statecode: json["statecode"],
    statenotes: json["statenotes"],
  );

  Map<String, dynamic> toJson() => {
    "active": active,
    "confirmed": confirmed,
    "deaths": deaths,
    "deltaconfirmed": deltaconfirmed,
    "deltadeaths": deltadeaths,
    "deltarecovered": deltarecovered,
    "lastupdatedtime": lastupdatedtime,
    "migratedother": migratedother,
    "recovered": recovered,
    "state": state,
    "statecode": statecode,
    "statenotes": statenotes,
  };
}
