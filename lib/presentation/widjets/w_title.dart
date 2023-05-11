import 'package:flutter/material.dart';
import 'package:tik_tok_toe/presentation/resourses/colors.dart';

class WTitle extends StatelessWidget {
  final String title;

  const WTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(color: Colors.white, fontSize: 42, shadows: [
        Shadow(
          color: AppColors.shadow,
          blurRadius: 15.0,
        )
      ]),
    );
  }
}
