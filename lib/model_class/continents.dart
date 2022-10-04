import 'dart:convert';

Continents continentsFromJson(String str) => Continents.fromJson(json.decode(str));

String continentsToJson(Continents data) => json.encode(data.toJson());

class Continents {
    Continents({
        this.continents,
    });

    List<Continent>? continents;

    factory Continents.fromJson(Map<String, dynamic> json) => Continents(
        continents: List<Continent>.from(json["continents"].map((x) => Continent.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "continents": List<dynamic>.from(continents!.map((x) => x.toJson())),
    };
}

class Continent {
    Continent({
        this.name,
        this.code,
    });

    String? name;
    String? code;

    factory Continent.fromJson(Map<String, dynamic> json) => Continent(
        name: json["name"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
    };
}
