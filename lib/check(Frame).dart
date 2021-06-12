import 'package:flutter/material.dart';

class checkFrame extends StatefulWidget {
  @override
  _checkFrameState createState() => _checkFrameState();
}

class _checkFrameState extends State<checkFrame> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
	appBar: AppBar(
		title: Text('Frame'),
		backgroundColor: Colors.green,
		),
	body: SingleChildScrollView(
		child: Column(
		children: [
		// Container(
		// 	child: Center(
		// 	child: Text(
		// 		'First widget',
		// 		style: TextStyle(
		// 		color: Colors.white,
		// 		),
		// 	),
		// 	),
		// 	color: Colors.blue,
		// 	height: 100,
		// 	width: 200,
		// ),
		 Container(
			child: Align(alignment:Alignment.bottomCenter,child: Text('000'),),
      // Center(
			// 	child: Text(
			// 	'Second widget',
			// 	style: TextStyle(
			// 		color: Colors.white,
			// 	),
			// 	),
			// ),
			color: Colors.amber,
			width: 200,
			),
		
		// Container(
		// 	child: Center(
		// 	child: Text(
		// 		'Third widget',
		// 		style: TextStyle(
		// 		color: Colors.white,
		// 		),
		// 	),
		// 	),
		// 	color: Colors.orange,
		// 	height: 100,
		// 	width: 200,
		// ),
		],
	)),
	);
  }
}

