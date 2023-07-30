// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String msgError;
  const CustomErrorWidget({
    Key? key,
    required this.msgError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      msgError,
      style: Styles.style18,
    );
  }
}
