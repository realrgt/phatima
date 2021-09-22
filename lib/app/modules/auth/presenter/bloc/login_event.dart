abstract class LoginEvent {}

class AuthenticateUser extends LoginEvent {}

class SignUserOut extends LoginEvent {}

class GetCurrentUser extends LoginEvent {}
