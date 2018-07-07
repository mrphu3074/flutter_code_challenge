import 'package:flutter/material.dart';

class VideoCard extends StatelessWidget {
	VideoCard({
		this.title,
		this.subtitle,
		this.thumbnail,
		this.channelLogo,
		this.onTap
	});

	final String title;
	final String subtitle;
	final ImageProvider thumbnail;
	final ImageProvider channelLogo;
	final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
	    onTap: onTap,
	    child: Container(
		    child: Column(
			    children: <Widget>[
				    Padding(
					    padding: const EdgeInsets.all(16.0),
					    child: AspectRatio(
						    aspectRatio: 16/9,
						    child: Image(image: thumbnail, fit: BoxFit.cover,),
					    ),
				    ),
				    ListTile(
					    leading: CircleAvatar(
						    backgroundImage: channelLogo,
					    ),
					    title: Text(title),
					    subtitle: Text(subtitle),
				    ),
				    Container(
					    height: 1.0,
					    color: Colors.grey[300],
				    )
			    ],
		    ),
	    ),
    );
  }
}
