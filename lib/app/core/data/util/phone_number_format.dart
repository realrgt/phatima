import '../../domain/error/exceptions.dart';

abstract class IPhoneNumberFormat {
  String call(String phone);
}

class PhoneNumberFormatImpl implements IPhoneNumberFormat {
  @override
  String call(String phone) {
    if (phone.startsWith('+258')) {
      return phone.substring(1, phone.length).replaceAll(' ', '');
    } else if (phone.startsWith('84') || phone.startsWith('85')) {
      return ('258' + phone).replaceAll(' ', '');
    }

    throw PhoneFormatException(message: "Wrong phone number format.");
  }
}
