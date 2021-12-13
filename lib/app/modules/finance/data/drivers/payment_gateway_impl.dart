import 'package:mpesa_sdk_dart/mpesa_sdk_dart.dart';

import '../../../../core/data/util/constants/mpesa.dart';
import '../../../../core/data/util/phone_number_format.dart';
import 'payment_gateway.dart';

class PaymentGatewayImpl implements IPaymentGateway {
  final IPhoneNumberFormat _phoneNumberFormat;

  PaymentGatewayImpl({required IPhoneNumberFormat phoneNumberFormat})
      : _phoneNumberFormat = phoneNumberFormat;

  @override
  Future<bool> performC2BPayment(double value, String phone) async {
    String token = MpesaConfig.getBearerToken(mpesaApiKey, mpesaPublicKey);

    PaymentRequest payload = PaymentRequest(
      inputTransactionReference: 'T12344C',
      inputCustomerMsisdn: _phoneNumberFormat(phone),
      inputAmount: value,
      inputThirdPartyReference: '11114',
      inputServiceProviderCode: mpesaBusinessShortCode,
    );

    final result = await MpesaTransaction.c2b(token, mpesaApiHost, payload);

    if (result.statusCode == 201) return true;
    return false;
  }
}
