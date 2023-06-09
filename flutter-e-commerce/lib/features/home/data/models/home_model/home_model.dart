import 'package:flutter_e_commerce/features/home/data/models/home_model/items_view_model.dart';

import 'categories_model.dart';

class HomeModel {
	bool status;
	String message;
	CategoriesModel? categories;
	ItemsViewModel? items;

	HomeModel({required this.status, required this.message, this.categories, this.items});

	@override
	String toString() {
		return 'HomeModel(status: $status, message: $message, categories: $categories)';
	}

	factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
				status: json['status'] as bool,
				message: json['message'] as String,
				categories: json['categories'] == null
						? null
						: CategoriesModel.fromJson(json['categories'] as Map<String, dynamic>),

				items: json['items'] == null
					? null
					: ItemsViewModel.fromJson(json['items'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'status': status,
				'message': message,
				'items': items?.toJson(),
			};
}
