import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:flutter/material.dart';

class SkeletonList extends StatelessWidget {
  const SkeletonList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => ListTileShimmer(
        isDisabledAvatar: false,
        isPurplishMode: true,
        isRectBox: true,
        colors: [Colors.grey[300]!, Colors.grey[100]!],
        hasBottomBox: true,
      ),
    );
  }
}