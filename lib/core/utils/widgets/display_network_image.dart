
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dendalar/core/utils/loading/shimmer_loading.dart';
import 'package:flutter/material.dart';


class DisplayNetworkImage extends StatelessWidget {
  const DisplayNetworkImage({
    super.key,
    required this.imageUrl,
    this.imageWidth,
    this.imageHeight,
    this.iconSize,
    this.imageFit,
    this.radius,
  });
  final double? radius;
  final String? imageUrl;
  final double? imageWidth;
  final double? imageHeight;
  final double? iconSize;
  final BoxFit? imageFit;

  @override
  Widget build(BuildContext context) {

    return CachedNetworkImage(
      imageUrl: imageUrl??'',
      imageBuilder: (context, imageProvider) => Container(
        width: imageWidth,
        height: imageHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 6),
          image: DecorationImage(
            image: imageProvider,
            fit: imageFit ?? BoxFit.contain,
          ),
        ),
      ),
      placeholder: (context, url) => ShimmerLoading(
        width:imageWidth,
        height:imageHeight,
      ),
      errorWidget: (context, url, error) => Icon(
        Icons.error,
        color: Colors.blue.shade500,
        size: iconSize,
      ),
    );
  }
}