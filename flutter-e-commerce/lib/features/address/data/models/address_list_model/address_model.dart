import 'package:equatable/equatable.dart';

class AddressModel extends Equatable {
	final String addressId;
	final String addressUserId;
	final String addressName;
	final String addressCity;
	final String addressStreet;
	final String addressLat;
	final String addressLong;

	const AddressModel({
		required this.addressId,
		required this.addressUserId,
		required this.addressName,
		required this.addressCity,
		required this.addressStreet,
		required this.addressLat,
		required this.addressLong,
	});

	factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
				addressId: json['address_id'] as String,
				addressUserId: json['address_user_id'] as String,
				addressName: json['address_name'] as String,
				addressCity: json['address_city'] as String,
				addressStreet: json['address_street'] as String,
				addressLat: json['address_lat'] as String,
				addressLong: json['address_long'] as String,
			);

	Map<String, dynamic> toJson() => {
				'address_id': addressId,
				'address_user_id': addressUserId,
				'address_name': addressName,
				'address_city': addressCity,
				'address_street': addressStreet,
				'address_lat': addressLat,
				'address_long': addressLong,
			};

	@override
	List<Object?> get props {
		return [
				addressId,
				addressUserId,
				addressName,
				addressCity,
				addressStreet,
				addressLat,
				addressLong,
		];
	}
}
