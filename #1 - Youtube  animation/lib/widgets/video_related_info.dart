import 'package:flutter/material.dart';
import 'package:youtube_app/widgets/comment_sliver_list.dart';
import 'package:youtube_app/widgets/comment_sliver_form.dart';
import 'package:youtube_app/widgets/video_related_sliver_list.dart';
import 'package:youtube_app/widgets/video_info_sliver_list.dart';
import 'package:youtube_app/model.dart';

class VideoRelatedInfo extends AnimatedWidget {
	VideoRelatedInfo({
		Key key,
		Animation animation,
		this.height,
		this.onDismiss
	}) : super(key: key, listenable: animation);

	final double height;
	final VoidCallback onDismiss;

	get containerHeight {
		return new Tween(begin: height, end: 0.0)
				.animate(listenable)
				.value;
	}

	get containerOpacity {
		return new Tween(begin: 1.0, end: 0.0)
				.animate(listenable)
				.value;
	}

	Widget getFullContent() {
		return Opacity(
			opacity: containerOpacity,
			child: SizedBox(
				height: containerHeight,
				child: Material(
					child: CustomScrollView(
						slivers: <Widget>[
							VideoInfoSliverList(),
							VideoRelatedSliverList(),
							CommentSliverForm(),
							CommentSliverList()
						],
					),
				),
			),
		);
	}

	Widget getMinimizedContent() {
		return Row(
			mainAxisAlignment: MainAxisAlignment.start,
			children: <Widget>[
				Expanded(
					flex: 3,
					child: Padding(
						padding: const EdgeInsets.only(left: 8.0),
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							mainAxisAlignment: MainAxisAlignment.center,
							children: <Widget>[
								Text(MOCK_VIDEO.name, maxLines: 1,
									overflow: TextOverflow.ellipsis,),
								SizedBox(height: 8.0,),
								Text(MOCK_VIDEO.channelName, maxLines: 1,
										overflow: TextOverflow.ellipsis),
							],),
					),
				),
				Expanded(
					flex: 2,
					child: Row(
						children: <Widget>[
							IconButton(icon: Icon(Icons.pause), onPressed: () {},),
							IconButton(icon: Icon(Icons.close), onPressed: onDismiss,)
						],
					),)
			],
		);
	}


	@override
	Widget build(BuildContext context) {
		Animation animation = listenable;

		if (animation.value == 1.0) return getMinimizedContent();
		return getFullContent();
	}
}