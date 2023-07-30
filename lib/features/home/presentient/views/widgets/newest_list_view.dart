import 'package:bookly/core/widget/cusotm_loading_indicator.dart';
import 'package:bookly/core/widget/custom_error_widget.dart';
import 'package:bookly/features/home/presentient/manger/newest_books/newest_books_cubit.dart';
import 'package:bookly/features/home/presentient/views/widgets/newest_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestListView extends StatelessWidget {
  const NewestListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: NewestItem(bookModel: state.books[index]),
              );
            },
          );
        } else if (state is NewestBooksError) {
          return CustomErrorWidget(msgError: state.msgError);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
