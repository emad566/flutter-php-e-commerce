import 'package:equatable/equatable.dart';

class OrderModel extends Equatable {
	final String? ordersId;
	final String? ordersUsersid;
	final String? ordersStatus;
	final String? ordersPaymentmethod;
	final dynamic ordersAddress;
	final String? ordersPrice;
	final String? ordersTotalprice;
	final String? ordersType;
	final String? ordersPricedelivery;
	final dynamic ordersCoupon;
	final String? coupondiscount;
	final String? ordersDate;
	final dynamic addressId;
	final dynamic addressUserId;
	final dynamic addressName;
	final dynamic addressCity;
	final dynamic addressStreet;
	final dynamic addressLat;
	final dynamic addressLong;
	final int? ordersRating;
	final String? ordersNoteRating;

	const OrderModel({
		this.ordersId, 
		this.ordersUsersid, 
		this.ordersStatus, 
		this.ordersPaymentmethod, 
		this.ordersAddress, 
		this.ordersPrice, 
		this.ordersTotalprice, 
		this.ordersType, 
		this.ordersPricedelivery, 
		this.ordersCoupon, 
		this.coupondiscount, 
		this.ordersDate, 
		this.addressId, 
		this.addressUserId, 
		this.addressName, 
		this.addressCity, 
		this.addressStreet, 
		this.addressLat, 
		this.addressLong, 
		this.ordersRating,
		this.ordersNoteRating,
	});

	factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
				ordersId: json['orders_id'] as String?,
				ordersUsersid: json['orders_usersid'] as String?,
				ordersStatus: json['orders_status'] as String?,
				ordersPaymentmethod: json['orders_paymentmethod'] as String?,
				ordersAddress: json['orders_address'] as dynamic,
				ordersPrice: json['orders_price'] as String?,
				ordersTotalprice: json['orders_totalprice'] as String?,
				ordersType: json['orders_type'] as String?,
				ordersPricedelivery: json['orders_pricedelivery'] as String?,
				ordersCoupon: json['orders_coupon'] as dynamic,
				coupondiscount: json['coupondiscount'] as String?,
				ordersDate: json['orders_date'] as String?,
				addressId: json['address_id'] as dynamic,
				addressUserId: json['address_user_id'] as dynamic,
				addressName: json['address_name'] as dynamic,
				addressCity: json['address_city'] as dynamic,
				addressStreet: json['address_street'] as dynamic,
				addressLat: json['address_lat'] as dynamic,
				addressLong: json['address_long'] as dynamic,
				ordersRating: int.parse(json['orders_rating'] as String),
				ordersNoteRating: json['orders_noterating'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'orders_id': ordersId,
				'orders_usersid': ordersUsersid,
				'orders_status': ordersStatus,
				'orders_paymentmethod': ordersPaymentmethod,
				'orders_address': ordersAddress,
				'orders_price': ordersPrice,
				'orders_totalprice': ordersTotalprice,
				'orders_type': ordersType,
				'orders_pricedelivery': ordersPricedelivery,
				'orders_coupon': ordersCoupon,
				'coupondiscount': coupondiscount,
				'orders_date': ordersDate,
				'address_id': addressId,
				'address_user_id': addressUserId,
				'address_name': addressName,
				'address_city': addressCity,
				'address_street': addressStreet,
				'address_lat': addressLat,
				'address_long': addressLong,
				'orders_rating': ordersRating,
				'orders_noterating': ordersNoteRating,
			};

	@override
	List<Object?> get props {
		return [
				ordersId,
				ordersUsersid,
				ordersStatus,
				ordersPaymentmethod,
				ordersAddress,
				ordersPrice,
				ordersTotalprice,
				ordersType,
				ordersPricedelivery,
				ordersCoupon,
				coupondiscount,
				ordersDate,
				addressId,
				addressUserId,
				addressName,
				addressCity,
				addressStreet,
				addressLat,
				addressLong,
				ordersRating,
				ordersNoteRating,
		];
	}
}
