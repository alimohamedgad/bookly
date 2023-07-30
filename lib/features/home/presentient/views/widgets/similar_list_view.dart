import 'package:bookly/core/widget/cusotm_loading_indicator.dart';
import 'package:bookly/core/widget/custom_error_widget.dart';
import 'package:bookly/features/home/presentient/manger/similar_books/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_item.dart';

class SimilarListView extends StatelessWidget {
  const SimilarListView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: height * 0.17,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                  child: CustomBookImage(
                    imageURl:
                        state.books[index].volumeInfo.imageLinks?.thumbnail,
                  ),
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(msgError: state.msgError);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
