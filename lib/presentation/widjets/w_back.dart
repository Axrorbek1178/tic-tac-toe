
import 'package:flutter/material.dart';
import 'package:tik_tok_toe/presentation/resourses/colors.dart';

class WBack extends StatelessWidget {
  final Widget child;
  const WBack({Key? key,required this.child,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.gradientStart,
              AppColors.gradientEnd,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
      child: child,
    );
  }
}
