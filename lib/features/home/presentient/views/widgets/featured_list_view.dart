import 'package:bookly/features/home/presentient/manger/featured_books/featured_books_cubit.dart';
import 'package:bookly/features/home/presentient/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widget/cusotm_loading_indicator.dart';
import '../../../../../core/widget/custom_error_widget.dart';

class FeaTuredListView extends StatelessWidget {
  const FeaTuredListView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: height * 0.3,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      context.push(AppRouter.kBookDetailsView,
                          extra: state.books[index]);
                    },
                    child: CustomBookImage(
                        imageURl: state
                            .books[index].volumeInfo.imageLinks?.thumbnail),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksError) {
          return CustomErrorWidget(msgError: state.msgError);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
