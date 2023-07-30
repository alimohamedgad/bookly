// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/features/home/presentient/views/widgets/book_rating.dart';

import 'books_action.dart';
import 'custom_book_details_appbar.dart';
import 'custom_book_item.dart';
import 'similar_list_view.dart';

class BookDetailsBody extends StatelessWidget {
  final BookModel bookModel;
  const BookDetailsBody({
    Key? key,
    required this.bookModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomBookDetailsAppBar(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * .22),
                    child: CustomBookImage(
                      imageURl: bookModel.volumeInfo.imageLinks!.thumbnail,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    bookModel.volumeInfo.title ?? '',
                    style: Styles.style18,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    bookModel.volumeInfo.authors?[0] ?? '',
                    style: Styles.style20.copyWith(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: Colors.white.withOpacity(0.8),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  BookRating(
                    mainAxisAlignment: MainAxisAlignment.center,
                    bookModel: bookModel,
                  ),
                  const SizedBox(height: 30),
                  CustomBooksAction(bookModel: bookModel),
                  const Expanded(child: SizedBox(height: 5)),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'You can also like',
                      style: Styles.style16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SimilarListView(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
