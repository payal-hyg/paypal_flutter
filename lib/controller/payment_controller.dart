import 'package:get/get.dart';
import '../model/payment_model.dart';

class PaymentController extends GetxController {
  var paymentModel = PaymentModel(
    total: '70',
    currency: 'USD',
    description: 'Flutter PayPal Payment',
  ).obs;

  void updatePaymentDetails(String total, String currency, String description) {
    paymentModel.value = PaymentModel(
      total: total,
      currency: currency,
      description: description,
    );
  }
}
