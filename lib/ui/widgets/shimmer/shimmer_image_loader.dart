import 'package:flutter/material.dart';
import 'package:games_app/ui/shared/themes/bloc/theme_bloc.dart';
import 'package:games_app/ui/shared/themes/themes.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShimmerImageLoader extends StatelessWidget {
  const ShimmerImageLoader({
    Key? key,
    required this.height,
    this.margin = EdgeInsets.zero,
    this.borderRadius = 0
  }) : super(key: key);

  final double height;
  final EdgeInsetsGeometry? margin;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          final isDark = state.when(
            light: () => false,
            dark: () => true
          );
          return Shimmer.fromColors(
            child: Container(
              margin: margin!,
              width: double.infinity,
              height: height,
              decoration: BoxDecoration(
                color: !isDark ? Colors.grey.shade400 : kDarkSecondaryColor,
                borderRadius: BorderRadius.circular(borderRadius!),
              ),
            ),
            baseColor: !isDark ? Colors.grey.shade400 : kDarkSecondaryColor,
            highlightColor: !isDark ? Colors.grey.shade400 : kDarkPrimaryColor,
          );
        },
      ),
    );
  }
}
