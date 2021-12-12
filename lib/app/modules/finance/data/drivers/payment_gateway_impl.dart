import 'package:mpesa_sdk_dart/mpesa_sdk_dart.dart';

import '../../../../core/data/util/constants/mpesa.dart';
import 'payment_gateway.dart';

class PaymentGatewayImpl implements IPaymentGateway {
  @override
  Future<bool> performC2BPayment(double value, String phone) async {
    String token = MpesaConfig.getBearerToken(mpesaApiKey, mpesaPublicKey);

    String apiHost = 'api.sandbox.vm.co.mz';

    PaymentRequest payload = PaymentRequest(
      inputTransactionReference: 'T12344C',
      inputCustomerMsisdn: phone,
      inputAmount: value,
      inputThirdPartyReference: '11114',
      inputServiceProviderCode: mpesaBusinessShortCode,
    );

    final result = await MpesaTransaction.c2b(token, apiHost, payload);

    if (result.statusCode == 201) return true;
    return false;
  }
}
