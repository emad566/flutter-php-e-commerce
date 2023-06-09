import 'package:flutter_e_commerce/features/home/data/models/home_model/item_view_model.dart';

class ItemsViewModel {
	bool status;
	String message;
	List<ItemViewModel>? data;

	ItemsViewModel({required this.status, required this.message, this.data});

	@override
	String toString() {
		return 'ItemsViewModel(status: $status, message: $message, data: $data)';
	}

	factory ItemsViewModel.fromJson(Map<String, dynamic> json) => ItemsViewModel(
				status: json['status'] as bool,
				message: json['message'] as String,
				data: (json['data'] as List<dynamic>?)
						?.map((e) => ItemViewModel.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'status': status,
				'message': message,
				'data': data?.map((e) => e.toJson()).toList(),
			};
}
