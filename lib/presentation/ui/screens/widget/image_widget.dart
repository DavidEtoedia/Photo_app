import 'package:flutter/material.dart';

class BackGroundImage extends StatelessWidget {
  final Widget child;
  final ImageProvider image;
  const BackGroundImage({Key? key, required this.child, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        children: [buildBackGround(), child],
      );

  Widget buildBackGround() {
    return ShaderMask(
      shaderCallback: (Rect bound) {
        return const LinearGradient(
          begin: Alignment.center,
          end: Alignment.topCenter,
          colors: [Colors.black12, Colors.black87],
          stops: [0.0, 1.0], // 10% purple, 80% transparent, 10% purple
        ).createShader(bound);
      },
      blendMode: BlendMode.dstOut,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: image, fit: BoxFit.cover)),
      ),
    );
  }
}
