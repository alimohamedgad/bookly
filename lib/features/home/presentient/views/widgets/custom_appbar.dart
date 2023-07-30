import 'package:bookly/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_img.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        children: [
          Image.asset(
            AppImg.logo,
            height: 18,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              context.push(AppRouter.kSearchView);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
    );
  }
}
