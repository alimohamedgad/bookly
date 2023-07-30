// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/features/home/presentient/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:bookly/core/utils/app_router.dart';

import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';

class NewestItem extends StatelessWidget {
  final BookModel? bookModel;
  const NewestItem({
    Key? key,
    this.bookModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRouter.kBookDetailsView, extra: bookModel);
      },
      child: SizedBox(
        height: 100,
        child: Row(
          children: [
            CustomBookImage(
                imageURl: bookModel!.volumeInfo.imageLinks!.thumbnail),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${bookModel!.volumeInfo.title}',
                    style: Styles.style16,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    bookModel!.volumeInfo.authors![0],
                    style: Styles.style14,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Text(
                        'Free',
                        style: Styles.style18,
                      ),
                      const Spacer(),
                      BookRating(bookModel: bookModel),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
