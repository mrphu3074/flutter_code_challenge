import 'package:flutter/material.dart';
import 'package:youtube_app/model.dart';

class CommentSliverForm extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return SliverList(
			delegate: SliverChildListDelegate([
				Container(
					padding: const EdgeInsets.all(16.0),
					decoration: BoxDecoration(
							border: Border(
									top: BorderSide(color: Colors.grey[300],
											width: 1.0,
											style: BorderStyle.solid),
									bottom: BorderSide(color: Colors.grey[300],
											width: 1.0,
											style: BorderStyle.solid)
							)
					),
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: <Widget>[
							Row(
								mainAxisAlignment: MainAxisAlignment
										.spaceBetween,
								children: <Widget>[
									Text("Comments  23", style: Theme
											.of(context)
											.textTheme
											.body1
											.copyWith(
											fontSize: 18.0
									),),
									Icon(Icons.tune, color: Colors.grey,)
								],
							),
							SizedBox(height: 8.0,),
							Row(children: <Widget>[
								CircleAvatar(
									backgroundImage: MOCK_VIDEO.channelLogo,),
								SizedBox(width: 8.0,),
								Expanded(
									child: TextField(
										decoration: InputDecoration(
												border: InputBorder.none,
												hintText: "Add a public comment..."
										),
									),
								)
							],)
						],),
				),
			]),
		);
	}
}
