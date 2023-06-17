class CategoryModel {
	String categoriesId;
	String categoriesName;
	String categoriesNameAr;
	String categoriesImage;
	String categoriesDatetime;

	CategoryModel({
		required this.categoriesId,
		required this.categoriesName,
		required this.categoriesNameAr,
		required this.categoriesImage,
		required this.categoriesDatetime,
	});

	@override
	String toString() {
		return 'Datum(categoriesId: $categoriesId, categoriesName: $categoriesName, categoriesNameAr: $categoriesNameAr, categoriesImage: $categoriesImage, categoriesDatetime: $categoriesDatetime)';
	}

	factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
				categoriesId: json['categories_id'] as String,
				categoriesName: json['categories_name'] as String,
				categoriesNameAr: json['categories_name_ar'] as String,
				categoriesImage: json['categories_image'] as String,
				categoriesDatetime: json['categories_datetime'] as String,
			);

	Map<String, dynamic> toJson() => {
				'categories_id': categoriesId,
				'categories_name': categoriesName,
				'categories_name_ar': categoriesNameAr,
				'categories_image': categoriesImage,
				'categories_datetime': categoriesDatetime,
			};
}
