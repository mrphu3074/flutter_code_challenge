import 'package:flutter/material.dart';

class VideoReactionButton extends StatelessWidget {
	VideoReactionButton({this.label, this.icon});

	final String label;
	final IconData icon;

	@override
	Widget build(BuildContext context) {
		Color color = Colors.grey[600];
		return Column(
			children: <Widget>[
				IconButton(
					icon: Icon(icon, color: color,),
					onPressed: () {},
				),
				Text(label, style: TextStyle(
						color: color,
						fontWeight: FontWeight.w500
				))
			],
		);
	}
}
