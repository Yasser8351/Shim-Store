// To parse this JSON data, do
//
//     final galleryImagesModel = galleryImagesModelFromJson(jsonString);

import 'dart:convert';

GalleryImagesModel galleryImagesModelFromJson(String str) => GalleryImagesModel.fromJson(json.decode(str));

String galleryImagesModelToJson(GalleryImagesModel data) => json.encode(data.toJson());

class GalleryImagesModel {
    GalleryImagesModel({
        this.getGalleryImages,
    });

    List<GetGalleryImage>? getGalleryImages;

    factory GalleryImagesModel.fromJson(Map<String, dynamic> json) => GalleryImagesModel(
        getGalleryImages: List<GetGalleryImage>.from(json["getGalleryImages"].map((x) => GetGalleryImage.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "getGalleryImages": List<dynamic>.from(getGalleryImages!.map((x) => x.toJson())),
    };
}

class GetGalleryImage {
    GetGalleryImage({
        this.id,
        this.link,
        this.linkEn,
        this.href,
    });

    String? id;
    String? link;
    String? linkEn;
    String? href;

    factory GetGalleryImage.fromJson(Map<String, dynamic> json) => GetGalleryImage(
        id: json["id"],
        link: json["link"],
        linkEn: json["linkEn"],
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "link": link,
        "linkEn": linkEn,
        "href": href,
    };
}
