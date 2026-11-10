import 'package:attend_id/data_model/image_dimension_enum.dart';
import 'package:flutter/material.dart';

class AppAvatar extends StatelessWidget {
  final String assetImage;
  final double size;
  final double radius;
  final ImageDimension dimension;

  const AppAvatar({
    super.key,
    required this.assetImage,
    this.radius = 2,
    this.size = 90,
    this.dimension = ImageDimension.square,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dimension == ImageDimension.square
          ? size
          : dimension == ImageDimension.portrait
          ? size * 0.8
          : size * 1.3,

      height: size,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        image: DecorationImage(
          image: AssetImage(assetImage),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
