// To parse this JSON data, do
//
//     final brandModel = brandModelFromJson(jsonString);

import 'dart:convert';

BrandModel brandModelFromJson(String str) => BrandModel.fromJson(json.decode(str));

String brandModelToJson(BrandModel data) => json.encode(data.toJson());

class BrandModel {
    BrandModel({
        this.getAllBrands,
    });

    List<GetAllBrand>? getAllBrands = [];

    factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
        getAllBrands: List<GetAllBrand>.from(json["getAllBrands"].map((x) => GetAllBrand.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "getAllBrands": List<dynamic>.from(getAllBrands!.map((x) => x.toJson())),
    };
}

class GetAllBrand {
    GetAllBrand({
        this.id,
        this.slug,
        this.name,
        this.nameEn,
        this.logo,
    });

    String? id;
    String? slug;
    String? name;
    String? nameEn;
    String? logo;

    factory GetAllBrand.fromJson(Map<String, dynamic> json) => GetAllBrand(
        id: json["id"]??"",
        slug: json["slug"]??"",
        name: json["name"]??"",
        nameEn: json["nameEn"]??"",
        logo: json["logo"]??"",
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "nameEn": nameEn,
        "logo": logo,
    };
}
