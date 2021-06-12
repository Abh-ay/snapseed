import 'package:flutter/material.dart';
GlobalKey globalKey=GlobalKey();

class StackToImage extends StatefulWidget {
  final Function(GlobalKey key) builder;

  const StackToImage({Key? key, required this.builder}) : super(key: key);
  @override
  _StackToImageState createState() => _StackToImageState();
}

class _StackToImageState extends State<StackToImage> {
  
  @override
 Widget build(BuildContext context) {
    return RepaintBoundary(
      key:  globalKey,
      child: widget.builder(globalKey),
      
    );
  }
}