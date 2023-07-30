import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'search_result_list_view.dart';
import 'search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchTextField(),
            SizedBox(height: 16),
            Text(
              'Search Result',
              style: Styles.style18,
            ),
            SizedBox(height: 16),
            SearchResultListView(),
          ],
        ),
      ),
    );
  }
}
