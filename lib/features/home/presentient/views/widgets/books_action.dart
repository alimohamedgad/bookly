// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bookly/features/home/data/models/book_model.dart';

import '../../../../../core/utils/functions/custom_url_launcher.dart';
import '../../../../../core/widget/custom_button.dart';

class CustomBooksAction extends StatelessWidget {
  final BookModel bookModel;
  const CustomBooksAction({
    Key? key,
    required this.bookModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 48,
              child: CustomButton(
                onPressed: () {},
                text: 'Free',
                textColor: Colors.black,
                backgroundColor: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 48,
              child: CustomButton(
                onPressed: () async {
                  launcherCustomURl(context, bookModel.volumeInfo.previewLink);
                },
                text: ' preview',
                textColor: Colors.white,
                backgroundColor: Colors.deepOrange,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
