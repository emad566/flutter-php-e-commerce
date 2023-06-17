import 'category_model.dart';

class CategoriesModel {
	bool status;
	String message;
	List<CategoryModel>? data;

	CategoriesModel({required this.status, required this.message, this.data});

	@override
	String toString() {
		return 'Categories(status: $status, message: $message, data: $data)';
	}

	factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
				status: json['status'] as bool,
				message: json['message'] as String,
				data: (json['data'] as List<dynamic>?)
						?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'status': status,
				'message': message,
				'data': data?.map((e) => e.toJson()).toList(),
			};
}
