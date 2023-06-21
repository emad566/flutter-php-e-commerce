import 'package:equatable/equatable.dart';

import 'notification_model.dart';

class NotificationsListModel extends Equatable {
	final bool status;
	final String message;
	final List<NotificationModel> data;

	const NotificationsListModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory NotificationsListModel.fromJson(Map<String, dynamic> json) {
		return NotificationsListModel(
			status: json['status'] as bool,
			message: json['message'] as String,
			data: (json['data'] as List<dynamic>)
						.map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toJson() => {
				'status': status,
				'message': message,
				'data': data.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object> get props => [status, message, data];
}
