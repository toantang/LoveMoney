import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_response.dart';
import 'package:lovemoney_fe/features/domain/entities/digital_wallet.dart';

abstract class DigitalWalletRepository {
  Future<ApiResponse<DigitalWallet>>? getDigitalWallet({required DigitalWallet digitalWallet});
  Future<ApiResponse<DigitalWallet>>? createDigitalWallet({required DigitalWallet digitalWallet});
}