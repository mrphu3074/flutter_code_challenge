import 'package:flutter/material.dart';
import 'package:youtube_app/model.dart';
import 'package:youtube_app/widgets/video_card.dart';

class HomeScreen extends StatefulWidget {
	HomeScreen({this.onVideoPressed});

	final VoidCallback onVideoPressed;

	@override
	_HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
	int currentBottomIndex;

	@override
	void initState() {
		super.initState();

		currentBottomIndex = 0;
	}

	handleBottomBarChange(index) {
		setState(() {
		  currentBottomIndex = index;
		});
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				backgroundColor: Colors.white,
				leading: Icon(Icons.play_circle_filled, color: Colors.red, size: 40.0,),
				title: Text("Youtube", style: Theme
						.of(context)
						.textTheme
						.headline
						.copyWith(fontWeight: FontWeight.bold),),
				actions: <Widget>[
					IconButton(
						icon: Icon(Icons.videocam, color: Colors.grey[700],),
						onPressed: () {},
					),
					IconButton(
						icon: Icon(Icons.search, color: Colors.grey[700]), onPressed: () {},
					),
					Padding(
						padding: EdgeInsets.only(right: 8.0),
						child: CircleAvatar(
							child: Text("P"),
						),
					)
				],
			),
			bottomNavigationBar: BottomNavigationBar(
					type: BottomNavigationBarType.fixed,
					currentIndex: currentBottomIndex,
					fixedColor: Colors.red,
					onTap: handleBottomBarChange,
					items: [
						BottomNavigationBarItem(
								icon: Icon(Icons.home), title: Text("Home")
						),
						BottomNavigationBarItem(
								icon: Icon(Icons.whatshot), title: Text("Trending")
						),
						BottomNavigationBarItem(
								icon: Icon(Icons.subscriptions), title: Text("Subscriptions")
						),
						BottomNavigationBarItem(
								icon: Icon(Icons.mail), title: Text("Inbox")
						)
					]
			),
			body: ListView.builder(
				itemCount: 100,
				itemBuilder: (context, index) {
					return VideoCard(
						title: MOCK_VIDEO.name,
						subtitle: '${MOCK_VIDEO.channelName} - ${MOCK_VIDEO.info}',
						thumbnail: MOCK_VIDEO.thumbnail,
						channelLogo: MOCK_VIDEO.channelLogo,
						onTap: widget.onVideoPressed,
					);
				},
			),
		);
	}
}
