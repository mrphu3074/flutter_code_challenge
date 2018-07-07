import 'package:flutter/material.dart';

class VideoModel {
	VideoModel({
		this.name,
		this.thumbnail,
		this.info,
		this.channelName,
		this.channelLogo,
		this.subscribers,
		this.viewCount
	});

	String name;
	ImageProvider thumbnail;
	String info;
	String channelName;
	ImageProvider channelLogo;
	String subscribers;
	String viewCount;
}


final VideoModel MOCK_VIDEO = new VideoModel(
	name: '30 Phút Cùng Quang Vinh | Exclusive Talk Show',
	info: '42K views - 1 year ago',
	thumbnail: AssetImage('assets/images/video_thumbnail.jpg'),
	channelName: 'Quang Vinh',
	channelLogo: AssetImage('assets/images/channel_logo.jpg'),
	subscribers: '230k',
	viewCount: '356k views'
);