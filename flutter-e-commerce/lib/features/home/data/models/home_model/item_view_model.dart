class ItemViewModel {
	String itemsId;
	String itemsCat;
	String itemsName;
	String itemsNameAr;
	String itemsDesc;
	String itemsDescAr;
	String itemsImage;
	String itemsCount;
	String itemsActive;
	double itemsPrice;
	String itemsDiscount;
	String itemsDate;
	String categoriesId;
	String categoriesName;
	String categoriesNameAr;
	String categoriesImage;
	String categoriesDatetime;
	bool favorite;
	int cartCount;
	double itemsPriceDiscount;

	ItemViewModel({
		required this.itemsId,
		required this.itemsCat,
		required this.itemsName,
		required this.itemsNameAr,
		required this.itemsDesc,
		required this.itemsDescAr,
		required this.itemsImage,
		required this.itemsCount,
		required this.itemsActive,
		required this.itemsPrice,
		required this.itemsDiscount,
		required this.itemsDate,
		required this.categoriesId,
		required this.categoriesName,
		required this.categoriesNameAr,
		required this.categoriesImage,
		required this.categoriesDatetime,
		required this.favorite,
		required this.cartCount,
		required this.itemsPriceDiscount,
	});

	@override
	String toString() {
		return 'ItemViewModel(itemsId: $itemsId, itemsCat: $itemsCat, itemsName: $itemsName, itemsNameAr: $itemsNameAr, itemsDesc: $itemsDesc, itemsDescAr: $itemsDescAr, itemsImage: $itemsImage, itemsCount: $itemsCount, itemsActive: $itemsActive, itemsPrice: $itemsPrice, itemsDiscount: $itemsDiscount, itemsDate: $itemsDate, categoriesId: $categoriesId, categoriesName: $categoriesName, categoriesNameAr: $categoriesNameAr, categoriesImage: $categoriesImage, categoriesDatetime: $categoriesDatetime)';
	}

	factory ItemViewModel.fromJson(Map<String, dynamic> json) => ItemViewModel(
		itemsId: json['items_id'] as String,
		itemsCat: json['items_cat'] as String,
		itemsName: json['items_name'] as String,
		itemsNameAr: json['items_name_ar'] as String,
		itemsDesc: json['items_desc'] as String,
		itemsDescAr: json['items_desc_ar'] as String,
		itemsImage: json['items_image'] as String,
		itemsCount: json['items_count'] as String,
		itemsActive: json['items_active'] as String,
		itemsPrice: double.parse(json['items_price'] as String),
		itemsDiscount: json['items_discount'] as String,
		itemsDate: json['items_date'] as String,
		categoriesId: json['categories_id'] as String,
		categoriesName: json['categories_name'] as String,
		categoriesNameAr: json['categories_name_ar'] as String,
		categoriesImage: json['categories_image'] as String,
		categoriesDatetime: json['categories_datetime'] as String,
		favorite: json['favorite'] == "1"? true : false,
		cartCount: int.parse(json['cart_count'] as String),
		itemsPriceDiscount: double.parse(json['items_price_discount'] as String),
	);

	Map<String, dynamic> toJson() => {
				'items_id': itemsId,
				'items_cat': itemsCat,
				'items_name': itemsName,
				'items_name_ar': itemsNameAr,
				'items_desc': itemsDesc,
				'items_desc_ar': itemsDescAr,
				'items_image': itemsImage,
				'items_count': itemsCount,
				'items_active': itemsActive,
				'items_price': itemsPrice,
				'items_discount': itemsDiscount,
				'items_date': itemsDate,
				'categories_id': categoriesId,
				'categories_name': categoriesName,
				'categories_name_ar': categoriesNameAr,
				'categories_image': categoriesImage,
				'categories_datetime': categoriesDatetime,
				'favorite': categoriesDatetime,
				'cart_count': cartCount,
				'items_price_discount': itemsPriceDiscount,
			};
}
