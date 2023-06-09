import 'categories_model.dart';

class HomeModel {
	bool status;
	String message;
	CategoriesModel? categories;

	HomeModel({required this.status, required this.message, this.categories});

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
			);

	Map<String, dynamic> toJson() => {
				'status': status,
				'message': message,
				'categories': categories?.toJson(),
			};
}
