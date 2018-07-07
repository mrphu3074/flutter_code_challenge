import 'package:flutter/material.dart';
import 'package:youtube_app/widgets/video_reaction_button.dart';
import 'package:youtube_app/model.dart';

class VideoInfoSliverList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
	    delegate: SliverChildListDelegate([
		    Padding(
			    padding: const EdgeInsets.only(
					    top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
			    child: Text(
				    MOCK_VIDEO.name,
				    style: Theme
						    .of(context)
						    .textTheme
						    .subhead
						    .copyWith(
						    color: Colors.black,
						    fontWeight: FontWeight.w400),
				    maxLines: 2,
				    overflow: TextOverflow.ellipsis,
			    ),
		    ),
		    Padding(
			    padding: const EdgeInsets.only(left: 16.0),
			    child: Text(MOCK_VIDEO.info, style: Theme
					    .of(context)
					    .textTheme
					    .caption),
		    ),
		    Row(
			    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
			    children: <Widget>[
				    VideoReactionButton(
					    icon: Icons.thumb_up,
					    label: '133',
				    ),
				    VideoReactionButton(
					    icon: Icons.thumb_down,
					    label: '6',
				    ),
				    VideoReactionButton(
					    icon: Icons.share,
					    label: 'Share',
				    ),
				    VideoReactionButton(
					    icon: Icons.file_download,
					    label: 'Download',
				    ),
				    VideoReactionButton(
					    icon: Icons.playlist_add,
					    label: 'Add to',
				    ),
			    ],
		    ),
		    Container(
			    padding: EdgeInsets.symmetric(
					    vertical: 8.0, horizontal: 16.0),
			    margin: EdgeInsets.only(top: 16.0),
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
			    child: Row(
				    mainAxisAlignment: MainAxisAlignment.spaceBetween,
				    children: <Widget>[
					    Row(
						    children: <Widget>[
							    CircleAvatar(
								    backgroundImage: MOCK_VIDEO.channelLogo,),
							    Column(
								    crossAxisAlignment: CrossAxisAlignment
										    .start,
								    children: <Widget>[
									    Text(MOCK_VIDEO.channelName),
									    Text("${MOCK_VIDEO
											    .subscribers} subscribers")
								    ],)
						    ],
					    ),
					    FlatButton.icon(
							    onPressed: () {},
							    icon: Icon(
								    Icons.play_circle_outline,
								    color: Colors.red,
							    ),
							    label: Text(
								    "Subscribe".toUpperCase(),
								    style: TextStyle(color: Colors.red),
							    )
					    )
				    ],
			    ),
		    ),
		    Padding(
			    padding: const EdgeInsets.symmetric(horizontal: 16.0),
			    child: Row(
				    mainAxisAlignment: MainAxisAlignment.spaceBetween,
				    children: <Widget>[
					    Text("Up next"),
					    Row(children: <Widget>[
						    Text("Auto play"),
						    Switch(value: true,
							    activeColor: Colors.blue,
							    onChanged: (_) {
								    return true;
							    },)
					    ],)
				    ],
			    ),
		    ),
	    ]),
    );
  }
}
