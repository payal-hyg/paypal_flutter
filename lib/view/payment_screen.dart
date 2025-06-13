import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import '../controller/payment_controller.dart';

class PaymentScreen extends StatelessWidget {
  final PaymentController controller = Get.put(PaymentController());

  PaymentScreen({super.key});

  void _startPayment(BuildContext context) {
    var payment = controller.paymentModel.value;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: "AaVR8p2zVm8T3RVFx6HGNGETApviIDHNqD0shm_ZWRnJCRUgtn5dN4zmgXVbBM7n8PfoOpfsBMcYYevp",
          secretKey: "ECgDxmna4RDPhMWXJ__8jfvzxlaZ5KJGxO8iUmE4y7GFEe6ow_R9EGabwfLBSJ9Z9vvrMPPjqsmrLIw2",
          transactions: [
            {
              "amount": {
                "total": payment.total,
                "currency":"USD",
                "details": {
                  "subtotal": payment.total,
                  "shipping": '0',
                  "shipping_discount": 0
                }
              },
              "description": payment.description,
            }
          ],
          note: "Contact us for any questions on your order.",
          // onSuccess: (Map params) {
          //   Get.snackbar("Payment Success", "Transaction completed!");
          //   print("Success: $params");
          // },
          // onError: (error) {
          //   Get.snackbar("Payment Error", error.toString());
          //   print("Error: $error");
          // },
          // onCancel: () {
          //   Get.snackbar("Payment Cancelled", "User cancelled the payment.");
          //   print("Cancelled");
          // },
onSuccess: (Map params) {
  Get.snackbar("Payment Success", "Thank you...Transaction completed!");
  print("Success: $params");

  
  Navigator.of(context).pop(); // WebView band karega
},
onCancel: () {
  Get.snackbar("Payment Cancelled", "User cancelled the payment.");
  print("Cancelled");
  Navigator.of(context).pop(); // WebView band karega
},

onError: (error) {
  Get.snackbar("Payment Error", error.toString());
  print("Error: $error");
  Navigator.of(context).pop(); // Error pe bhi WebView band karo
},


        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PayPal Payment"),
       
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _startPayment(context),
          child: const Text("Pay with PayPal"),
        ),
      ),
    );
  }
}
