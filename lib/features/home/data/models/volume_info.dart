// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'image_links.dart';

class VolumeInfo extends Equatable {
  final String? title;
  final List<dynamic>? authors;
  final String? publisher;
  final String? description;
  final String? previewLink;
  final dynamic averageRating;
  final dynamic ratingsCount;

  final int? pageCount;
  final List<dynamic>? categories;
  final ImageLinks? imageLinks;

  const VolumeInfo({
    this.title,
    this.authors,
    this.publisher,
    this.description,
    this.previewLink,
    this.averageRating,
    this.ratingsCount,
    this.pageCount,
    this.categories,
    this.imageLinks,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
        title: json['title'] as String?,
        authors: json['authors'] as List<dynamic>?,
        publisher: json['publisher'] as String?,
        description: json['description'] as String?,
        previewLink: json['previewLink'] as String?,
        averageRating: json['averageRating'] as dynamic,
        ratingsCount: json['ratingsCount'] as dynamic,
        pageCount: json['pageCount'] as int?,
        categories: json['categories'] as List<dynamic>?,
        imageLinks: json['imageLinks'] == null
            ? null
            : ImageLinks.fromJson(json['imageLinks'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'authors': authors,
        'publisher': publisher,
        'description': description,
        'pageCount': pageCount,
        'ratingsCount': ratingsCount,
        'averageRating': averageRating,
        'imageLinks': imageLinks?.toJson(),
        'categories': categories,
        'previewLink': previewLink
      };

  @override
  List<Object?> get props {
    return [
      title,
      authors,
      publisher,
      averageRating,
      ratingsCount,
      description,
      pageCount,
      imageLinks,
      categories,
      previewLink,
    ];
  }
}
