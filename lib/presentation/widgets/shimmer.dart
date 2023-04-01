import 'package:catfacts/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../resources/value_manager.dart';

Shimmer getShimmerEffect() {
  return Shimmer.fromColors(
    baseColor: ColorManager.shimmerBase,
    highlightColor: ColorManager.shimmerLight,
    child: Center(
      child: Column(
        children: [
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s10),
              color: ColorManager.white,
            ),
          ),
          const SizedBox(
            height: AppPadding.p10,
          ),
          Container(
            width: 400,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s10),
              color: ColorManager.white,
            ),
          ),
        ],
      ),
    ),
  );
}
