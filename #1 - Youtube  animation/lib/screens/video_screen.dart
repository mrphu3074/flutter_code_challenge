import 'package:flutter/material.dart';
import 'package:youtube_app/model.dart';
import 'package:youtube_app/widgets/video_related_info.dart';

typedef DragUpdateCallback(double value);
typedef DragEndCallback(double value);

const double _bottomNavigationBarHeight = 56.0;
const double _spacing = 8.0;
const double _minimizedPlayerHeight = 80.0;

class VideoScreen extends AnimatedWidget {
	VideoScreen({
		Key key,
		Animation animation,
		this.status,
		this.screenWidth,
		this.screenHeight,
		this.onDragUpdate,
		this.onDragEnd,
		this.onDismiss
	})
			: super(key: key, listenable: animation);
	final String status;
	final double screenWidth;
	final double screenHeight;
	final DragUpdateCallback onDragUpdate;
	final DragEndCallback onDragEnd;
	final VoidCallback onDismiss;


	Animation getVideoRelativeRect(BuildContext context) {
		double bottomHeight = _bottomNavigationBarHeight + _spacing;
		RelativeRect hiddenRect = new RelativeRect.fromLTRB(
				0.0,
				screenHeight,
				0.0,
				0.0
		);
		RelativeRect fullSizeRect = new RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0);
		RelativeRect minimizedRect = new RelativeRect.fromLTRB(
				_spacing,
				screenHeight - bottomHeight - _minimizedPlayerHeight,
				_spacing,
				bottomHeight
		);

		RelativeRectTween tween = new RelativeRectTween(
				begin: hiddenRect,
				end: fullSizeRect
		);

		if (status == 'full') {
			tween = new RelativeRectTween(
					begin: fullSizeRect,
					end: minimizedRect
			);
		} else if (status == 'minimized') {
			tween = new RelativeRectTween(
					begin: minimizedRect,
					end: hiddenRect
			);
		}

		return tween.animate(listenable);
	}

	handleVerticalDragUpdate(DragUpdateDetails details) {
		onDragUpdate(details.primaryDelta / screenHeight);
	}

	handleVerticalDragEnd(DragEndDetails details) {
		onDragEnd(details.velocity.pixelsPerSecond.dy / screenHeight);
	}

	Widget getHiddenContent() {
		return Container(
			color: Colors.white,
			child: Container(
				alignment: Alignment.topLeft,
				height: playerHeight,
				child: Image(image: MOCK_VIDEO.thumbnail, fit: BoxFit.cover),
			),
		);
	}

	Widget getFullContent() {
		Widget player = Container(
			alignment: Alignment.topLeft,
			height: new Tween(
					begin: playerHeight, end: _minimizedPlayerHeight)
					.animate(listenable)
					.value,
			child: Image(image: MOCK_VIDEO.thumbnail, fit: BoxFit.cover),
		);
		Widget subContent = VideoRelatedInfo(
			animation: listenable,
			height: videoInfoHeight,
			onDismiss: onDismiss,
		);
		return GestureDetector(
			onVerticalDragUpdate: handleVerticalDragUpdate,
			onVerticalDragEnd: handleVerticalDragEnd,
			child: Container(
				color: Colors.white,
				child: Column(
					mainAxisAlignment: MainAxisAlignment.start,
					children: <Widget>[
						player,
						subContent
					],
				),
			),
		);
	}

	get playerHeight {
		double playerRatio = 16 / 9;
		return screenWidth / playerRatio;
	}

	get videoInfoHeight {
		return screenHeight - playerHeight;
	}

	Widget getMinimizedContent() {
		double videoHeight = new Tween(
				begin: playerHeight,
				end: _minimizedPlayerHeight
		).animate(listenable).value;

		return GestureDetector(
			onVerticalDragUpdate: handleVerticalDragUpdate,
			onVerticalDragEnd: handleVerticalDragEnd,
			child: Material(
				child: Row(
					mainAxisAlignment: MainAxisAlignment.start,
					children: <Widget>[
						Container(
							alignment: Alignment.topLeft,
							height: videoHeight,
							child: Image(image: MOCK_VIDEO.thumbnail, fit: BoxFit.cover),
						),
						Expanded(child: VideoRelatedInfo(
							animation: listenable,
							height: videoInfoHeight,
							onDismiss: onDismiss,
						),)
					],
				),
			),
		);
	}

	@override
	Widget build(BuildContext context) {
		Animation animation = listenable;
		Widget content;

		if (status == 'full') {
			if (animation.value == 1.0) {
				content = getMinimizedContent();
			} else {
				content = getFullContent();
			}
		} else {
			content = getHiddenContent();
		}

		return PositionedTransition(
			rect: getVideoRelativeRect(context),
			child: content,
		);
	}
}