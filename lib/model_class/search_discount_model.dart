// To parse this JSON data, do
//
//     final searchDiscountsModel = searchDiscountsModelFromJson(jsonString);

import 'dart:convert';

SearchDiscountsModel searchDiscountsModelFromJson(String str) => SearchDiscountsModel.fromJson(json.decode(str));

String searchDiscountsModelToJson(SearchDiscountsModel data) => json.encode(data.toJson());

class SearchDiscountsModel {
    SearchDiscountsModel({
        this.searchDiscounts,
    });

    List<SearchDiscount>? searchDiscounts;

    factory SearchDiscountsModel.fromJson(Map<String, dynamic> json) => SearchDiscountsModel(
        searchDiscounts: List<SearchDiscount>.from(json["searchDiscounts"].map((x) => SearchDiscount.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "searchDiscounts": List<dynamic>.from(searchDiscounts!.map((x) => x.toJson())),
    };
}

class SearchDiscount {
    SearchDiscount({
        this.id,
        this.code,
        this.description,
        this.descriptionEn,
        this.link,
        this.category,
        this.brand,
        this.expiresAt,
    });

    String? id;
    String? code;
    String? description;
    String? descriptionEn;
    String? link;
    Category? category;
    Brand? brand;
    DateTime? expiresAt;

    factory SearchDiscount.fromJson(Map<String, dynamic> json) => SearchDiscount(
        id: json["id"],
        code: json["code"] == null ? null : json["code"],
        description: json["description"],
        descriptionEn: json["descriptionEn"],
        link: json["link"],
        category: Category.fromJson(json["category"]),
        brand: Brand.fromJson(json["brand"]),
        expiresAt: DateTime.parse(json["expiresAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "code": code == null ? null : code,
        "description": description,
        "descriptionEn": descriptionEn,
        "link": link,
        "category": category!.toJson(),
        "brand": brand!.toJson(),
        "expiresAt": expiresAt!.toIso8601String(),
    };
}

class Brand {
    Brand({
        this.id,
        this.name,
        this.logo,
    });

    String? id;
    String? name;
    String? logo;

    factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
    };
}

class Category {
    Category({
        this.id,
        this.name,
        this.nameEn,
    });

    String? id;
    String? name;
    String? nameEn;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        nameEn: json["nameEn"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "nameEn": nameEn,
    };
}
