import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/rendering.dart';
class ReusableClass {
  static raisedButton(String text, Function onpressed) {
    return Container(
        width: 180,
        child: RaisedButton(
          onPressed: () {
            onpressed();
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
          padding: const EdgeInsets.all(0.0),
          child: Ink(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFF00b09b),
                Color(0xFF96c93d),
              ]),
              borderRadius: BorderRadius.all(Radius.circular(80.0)),
            ),
            child: Container(
              constraints: const BoxConstraints(
                  minWidth: 88.0,
                  minHeight: 36.0), // min sizes for Material buttons
              alignment: Alignment.center,
              child: Text(
                text,
                // textAlign: TextAlign.center,
              ),
            ),
          ),
        ));
  }
  static textField(String hint, {obscure, prefix, suffix,textinputaction}) {
    return Container(
      padding: EdgeInsets.all(12),
      //  decoration: BoxDecoration(border: OutlineInputBorder()),
      // transform:Matrix4.translationValues(-10, -12, 0),
      child: TextField(
          obscureText: obscure,
         textInputAction: textinputaction,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.green)),
              hintText: hint,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.green)),
              prefixIcon: prefix,
              suffix: suffix)),
    );
  }
  static appbar(String text, bool center, {right, left}) {
    return AppBar(
      title: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: center,
      backgroundColor: Colors.green,
      actions: [right],
      leading: left,
    );
  }
  static setRootView(Widget widget) { 
    return runApp(MaterialApp(
      home: widget,
      navigatorKey: GlobalKey<NavigatorState>(debugLabel: "HomeScreen"),
    ));
  }
  static text(String text) {
    return Align(
      alignment: AlignmentDirectional.bottomStart,
      child: Text(
        text,
        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
      ),
    );
  }
  static dialogOption(String text, {onpressed}) {
    return Container(
        child: SimpleDialogOption(
      child: Text(text),
      onPressed: () {
        onpressed();
      },
    ));
  }
  static radio(String text, value, onchanged) {
    return Container(
        child: RadioListTile(
      value: text,
      groupValue: value,
      onChanged: onchanged,
      title: Text(text),
    ));
  }
  static textbuttonIcon(String text, IconData icon, onpressed) {
    return Container(
        child: TextButton(
            onPressed: onpressed,
            child: Column(children: [
              Icon(
                icon,
                //color: Colors.black,
              ),
              Text(
                text,
                style: TextStyle(color: Colors.green),
              ),
            ])));
  }
  static capture(GlobalKey key) async {
    RenderRepaintBoundary boundary=key.currentContext!.findRenderObject() as  RenderRepaintBoundary;
    var image = await boundary.toImage();
    final directory = (await getExternalStorageDirectory())!.path;
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final pngBytes = byteData!.buffer.asUint8List();
    File imgFile = new File('$directory/Snapseed.png');
    imgFile.writeAsBytes(pngBytes);
    return imgFile;
  }
}
