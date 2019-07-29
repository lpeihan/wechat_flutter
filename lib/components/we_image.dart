import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WeImage extends StatelessWidget {
  final String image;
  final double width;
  final double height;
  final double radius;
  final BoxFit fit;

  const WeImage({
    Key key,
    @required this.image,
    this.width = 50.0,
    this.height = 50.0,
    this.radius = 4.0,
    this.fit = BoxFit.cover
  }) :
  assert(image != null),
  super(key: key);

  bool get isImageFromNet {
    return image.startsWith('http');
  }

  _fadeImage() {
    return FadeInImage(
      placeholder: AssetImage('assets/images/default.png'),
      image: CachedNetworkImageProvider(image),
      fit: fit,
    );
  }

  @override
  Widget build(BuildContext context) {
    BorderRadius _borderRadius = BorderRadius.all(Radius.circular(radius));

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: _borderRadius,
      ),
      child: ClipRRect(
        borderRadius: _borderRadius,
        child: isImageFromNet ? _fadeImage()
          : Image.asset(image, fit: BoxFit.cover,),
      ),
    );
  }
}