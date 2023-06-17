import 'package:equatable/equatable.dart';

import 'address_model.dart';

class AddressListModel extends Equatable {
	final bool status;
	final String message;
	final List<AddressModel> data;

	const AddressListModel({
		required this.status,
		required this.message,
		required this.data
	});

	factory AddressListModel.fromJson(Map<String, dynamic> json) {
		return AddressListModel(
			status: json['status'] as bool,
			message: json['message'] as String,
			data: (json['data'] as List<dynamic>)
						.map((e) => AddressModel.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toJson() => {
				'status': status,
				'message': message,
				'data': data.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [status, message, data];
}
