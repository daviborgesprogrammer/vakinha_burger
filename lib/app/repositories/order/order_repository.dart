import 'package:dw9delivery/app/dto/order_dto.dart';
import 'package:dw9delivery/app/models/payment_type_model.dart';

abstract interface class OrderRepository {
  Future<List<PaymentTypeModel>> getAllPaymentsType();
  Future<void> saveOrder(OrderDto order);
}
