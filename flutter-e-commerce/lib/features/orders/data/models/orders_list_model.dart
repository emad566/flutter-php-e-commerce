import 'package:equatable/equatable.dart';

import 'order_model.dart';

class OrdersListModel extends Equatable {
  final bool status;
  final String message;
  final List<OrderModel> data;

  const OrdersListModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory OrdersListModel.fromJson(Map<String, dynamic> json) {
    return OrdersListModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: json['data']== null? [] : (json['data'] as List<dynamic>)
          .map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
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
