import 'package:flutter/material.dart';
import 'package:youtube_app/model.dart';

class VideoRelatedSliverList extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return SliverList(
			delegate: SliverChildListDelegate(List.generate(10, (i) {
				return Padding(
					padding: const EdgeInsets.symmetric(
							horizontal: 16.0, vertical: 8.0),
					child: Row(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: <Widget>[
							Container(
								width: 160.0,
								child: AspectRatio(
									aspectRatio: 16 / 9,
									child: Image(image: MOCK_VIDEO.thumbnail,
										fit: BoxFit.cover,),
								),
							),
							Expanded(
								child: Padding(
									padding: const EdgeInsets.only(left: 16.0),
									child: Column(
										crossAxisAlignment: CrossAxisAlignment
												.start,
										children: <Widget>[
											Text(MOCK_VIDEO.name, maxLines: 3,
												overflow: TextOverflow.ellipsis,),
											Text(MOCK_VIDEO.channelName, style: Theme
													.of(context)
													.textTheme
													.caption),
											Text(MOCK_VIDEO.viewCount, style: Theme
													.of(context)
													.textTheme
													.caption),
										],
									),
								),
							),
							GestureDetector(
								child: Icon(Icons.more_vert),
							)
						],),
				);
			})),
		);
	}
}
