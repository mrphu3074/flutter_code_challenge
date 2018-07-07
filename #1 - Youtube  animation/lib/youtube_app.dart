import 'package:flutter/material.dart';
import 'package:youtube_app/screens/home_screen.dart';
import 'package:youtube_app/screens/video_screen.dart';

class YoutubeApp extends StatefulWidget {
	@override
	_YoutubeAppState createState() => _YoutubeAppState();
}

class _YoutubeAppState extends State<YoutubeApp>
		with SingleTickerProviderStateMixin {
	AnimationController controller;
	Animation animation;
	String videoScreenStatus;


	@override
	void initState() {
		super.initState();

		videoScreenStatus = 'hidden';
		controller = new AnimationController(
				vsync: this,
				duration: Duration(milliseconds: 500)
		);
		animation = new CurvedAnimation(parent: controller, curve: Curves.linear)
			..addListener(() {
				setState(() {});
			});
	}

	@override
	void dispose() {
		controller.dispose();
		super.dispose();
	}

	handleVideoItemPressed() {
		controller.fling(velocity: 2.0)
			..whenComplete(() {
				setState(() {
					controller.value = 0.0;
					videoScreenStatus = 'full';
				});
			});
	}

	handleDismissVideoScreen() {
		setState(() {
			videoScreenStatus = 'hidden';
			controller.value = 0.0;
		});
	}

	handleVideoScreenDragUpdate(delta) {
		setState(() {
			controller.value += delta;
		});
	}

	handleVideoScreenDragEnd(flingVelocity) {
		if (flingVelocity > 0) {
			controller.fling(velocity: 2.0);
		} else if (flingVelocity < 0) {
			controller.fling(velocity: -2.0);
		} else {
			if (controller.value > 0.4) {
				controller.fling(velocity: 2.0);
			} else {
				controller.fling(velocity: -2.0);
			}
		}
	}

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: "Youtube",
			debugShowCheckedModeBanner: false,
			home: LayoutBuilder(builder: (context, constraints) {
				return Stack(
					children: <Widget>[
						HomeScreen(onVideoPressed: handleVideoItemPressed,),
						VideoScreen(
								animation: animation,
								status: videoScreenStatus,
								screenWidth: constraints.maxWidth,
								screenHeight: constraints.maxHeight,
								onDragUpdate: handleVideoScreenDragUpdate,
								onDragEnd: handleVideoScreenDragEnd,
								onDismiss: handleDismissVideoScreen
						)
					],
				);
			}),
		);
	}
}
