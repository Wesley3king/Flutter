import 'package:flutter/material.dart';

class MyZoom extends StatefulWidget {
  const MyZoom({super.key});

  @override
  State<MyZoom> createState() => _MyZoomState();
}

class _MyZoomState extends State<MyZoom> with SingleTickerProviderStateMixin {
  // Zoom with double Click
  late TransformationController controller;
  TapDownDetails? tapDownDetails;

  late AnimationController animationController;
  Animation<Matrix4>? animation;

  @override
  void initState() {
    super.initState();

    controller = TransformationController();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addListener(() {
        controller.value = animation!.value;
      });
  }

  @override
  void dispose() {
    controller.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(12.0),
      child: buildImage(),
    );
  }

  Widget buildImage() => GestureDetector(
        onDoubleTap: () {
          final position = tapDownDetails!.localPosition;
          final double scale = 3.0;
          final x = -position.dx * (scale - 1);
          final y = -position.dy * (scale - 1);
          final zoomed = Matrix4.identity()
            ..translate(x, y)
            ..scale(scale);

          final end =
              controller.value.isIdentity() ? zoomed : Matrix4.identity();
          //controller.value = value;

          animation = Matrix4Tween(
            begin: controller.value,
            end: end,
          ).animate(
              CurveTween(curve: Curves.easeOut).animate(animationController));

          animationController.forward(from: 0);
        },
        onDoubleTapDown: (details) => tapDownDetails = details,
        child: InteractiveViewer(
          clipBehavior: Clip.none,
          panEnabled: false,
          transformationController: controller,
          scaleEnabled: false,
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              'https://images.pexels.com/photos/698907/pexels-photo-698907.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
}

// class TransformationController extends {}
