abstract class IWalletDataSource {
  Future<double> getAccountBallance(String uid);
  Future<void> rechargeAccount(String uid, double value);
}
