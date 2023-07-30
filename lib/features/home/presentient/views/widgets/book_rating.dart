// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bookly/features/home/data/models/book_model.dart';

import '../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final BookModel? bookModel;
  const BookRating({
    Key? key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.bookModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          size: 14,
          color: Colors.yellow,
        ),
        const SizedBox(width: 6),
        Text(
          '${bookModel!.volumeInfo.ratingsCount ?? 0}',
          style: Styles.style14,
        ),
        const SizedBox(width: 3),
        Text(
          '(${bookModel!.volumeInfo.averageRating ?? 0})',
          style: Styles.style14.copyWith(color: Colors.white.withOpacity(0.5)),
        ),
      ],
    );
  }
}
