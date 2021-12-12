abstract class IPaymentGateway {
  Future<bool> performC2BPayment(double value, String phone);
}
