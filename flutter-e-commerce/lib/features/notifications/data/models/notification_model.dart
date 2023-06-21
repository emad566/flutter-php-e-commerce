import 'package:equatable/equatable.dart';

class NotificationModel extends Equatable {
	final String notificationId;
	final String notificationUserid;
	final String notificationTitle;
	final String notificationBody;
	final String notificationCreatedAt;

	const NotificationModel({
		required this.notificationId,
		required this.notificationUserid,
		required this.notificationTitle,
		required this.notificationBody,
		required this.notificationCreatedAt,
	});

	factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
				notificationId: json['notification_id'] as String,
				notificationUserid: json['notification_userid'] as String,
				notificationTitle: json['notification_title'] as String,
				notificationBody: json['notification_body'] as String,
				notificationCreatedAt: json['notification_created_at'] as String,
			);

	Map<String, dynamic> toJson() => {
				'notification_id': notificationId,
				'notification_userid': notificationUserid,
				'notification_title': notificationTitle,
				'notification_body': notificationBody,
				'notification_created_at': notificationCreatedAt,
			};

	@override
	List<Object> get props {
		return [
				notificationId,
				notificationUserid,
				notificationTitle,
				notificationBody,
				notificationCreatedAt,
		];
	}
}
