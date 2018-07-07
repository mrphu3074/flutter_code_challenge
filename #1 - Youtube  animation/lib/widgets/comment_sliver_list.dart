import 'package:flutter/material.dart';
import 'package:youtube_app/model.dart';

class CommentSliverList extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return SliverList(
			delegate: SliverChildListDelegate(
					List.generate(20, (index) {
						return Container(
							padding: EdgeInsets.symmetric(
									horizontal: 16.0, vertical: 16.0),
							decoration: BoxDecoration(
									border: Border(bottom: BorderSide(
											color: Colors.grey[300],
											width: 1.0,
											style: BorderStyle.solid))
							),
							child: Row(
								crossAxisAlignment: CrossAxisAlignment.start,
								children: <Widget>[
									CircleAvatar(
										backgroundImage: MOCK_VIDEO.channelLogo,
									),
									SizedBox(width: 8.0,),
									Expanded(
										child: Column(
											crossAxisAlignment: CrossAxisAlignment
													.start,
											children: <Widget>[
												Text("Phu Nguyen - 4 hours ago",
													style: Theme
															.of(context)
															.textTheme
															.caption,),
												Text(
													"The stage name 'Passenger' gives the idea of an ordinary, relatable person. And that's what your music is- relatable to ordinary folk.",
													maxLines: 2,
													overflow: TextOverflow.ellipsis,),
												Row(
													mainAxisAlignment: MainAxisAlignment
															.spaceBetween,
													children: <Widget>[
														Row(
															children: <Widget>[
																IconButton(icon: Icon(
																	Icons.thumb_up, size: 18.0,
																	color: Colors.grey,
																),
																	onPressed: () {},),
																IconButton(icon: Icon(
																		Icons.thumb_down,
																		size: 18.0, color: Colors.grey),
																		onPressed: () {}),
																IconButton(icon: Icon(
																		Icons.comment, size: 18.0,
																		color: Colors.grey),
																		onPressed: () {}),
															],
														),
														IconButton(icon: Icon(
															Icons.more_vert, size: 18.0,
															color: Colors.grey[700],),
																onPressed: () {}),
													],
												)
											],
										),
									)
								],
							),
						);
					})),
		);
	}
}
