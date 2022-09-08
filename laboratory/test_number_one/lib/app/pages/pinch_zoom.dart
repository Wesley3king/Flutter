import 'package:flutter/material.dart';

class MyPinchZoom extends StatefulWidget {
  const MyPinchZoom({super.key});

  @override
  State<MyPinchZoom> createState() => _MyPinchZoomState();
}

class _MyPinchZoomState extends State<MyPinchZoom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: PinchZoomImage(),
    );
  }
}

class PinchZoomImage extends StatefulWidget {
  const PinchZoomImage({super.key});

  @override
  State<PinchZoomImage> createState() => _PinchZoomImageState();
}

class _PinchZoomImageState extends State<PinchZoomImage>
    with SingleTickerProviderStateMixin {
  late TransformationController controller;
  late AnimationController animationController;
  Animation<Matrix4>? animation;
  final double minScale = 1;
  final double maxScale = 4;
  OverlayEntry? entry;

  @override
  void initState() {
    super.initState();

    controller = TransformationController();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(() => controller.value = animation!.value)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
         // removeOverlay();
        }
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teste de Zoom"),
      ),
      body: Center(child: buildImage()),
    );
  }

  Widget buildImage() {
    return InteractiveViewer(
      clipBehavior: Clip.none,
      panEnabled: false,
      minScale: minScale,
      maxScale: maxScale,
      onInteractionStart: (details) {
        if (details.pointerCount < 2) return;
        showOverlay(context);
      },
      onInteractionEnd: (details) {
        resetAnimation();
      },
      child: AspectRatio(
        aspectRatio: 1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
              'https://images.pexels.com/photos/3617500/pexels-photo-3617500.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
        ),
      ),
    );
  }

  void resetAnimation() {
    animation = Matrix4Tween(
      begin: controller.value,
      end: Matrix4.identity(),
    ).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));

    animationController.forward(from: 0);
  }

  void showOverlay(BuildContext context) {
    final renderBox = context.findRenderObject()! as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    final size = MediaQuery.of(context).size;
    entry = OverlayEntry(
      builder: (context) {
        return Positioned(
            left: offset.dx,
            top: offset.dy,
            width: size.width,
            child: buildImage());
      },
    );
    final overlay = Overlay.of(context)!;
    overlay.insert(entry!);
  }
}
