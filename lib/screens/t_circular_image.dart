import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage(
      {super.key,
      this.fit = BoxFit.cover,
      required this.image,
      this.isNetworkImage = false,
      this.overlayColor,
      this.backgroundColor,
      this.width = 56,
      this.height = 56,
      this.padding = 16});

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        child: Center(
            child: isNetworkImage
                ? CachedNetworkImage(
                    fit: fit,
                    color: overlayColor,
                    imageUrl: image,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  )
                : Image(
                    image: AssetImage(image),
                    fit: fit,
                    color: overlayColor,
                  )),
      ),
    );
  }
}
