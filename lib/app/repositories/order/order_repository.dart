import 'package:dw9delivery/app/models/payment_type_model.dart';

abstract interface class OrderRepository {
  Future<List<PaymentTypeModel>> getAllPaymentsType();
}
