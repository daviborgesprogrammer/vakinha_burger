// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dw9delivery/app/core/rest_client/custom_dio.dart';
import 'package:dw9delivery/app/models/payment_type_model.dart';

import './order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final CustomDio dio;
  OrderRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<PaymentTypeModel>> getAllPaymentsType() async {
    final result = await dio.auth().get('/payment-types');
    return result.data
        .map<PaymentTypeModel>((p) => PaymentTypeModel.fromMap(p))
        .toList();
  }
}
