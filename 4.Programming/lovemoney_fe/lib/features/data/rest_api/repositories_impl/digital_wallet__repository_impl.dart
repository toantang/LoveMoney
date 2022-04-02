import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_response.dart';
import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_result.dart';
import 'package:lovemoney_fe/features/data/rest_api/datasources/rest_client.dart';
import 'package:lovemoney_fe/features/domain/entities/digital_wallet.dart';
import 'package:lovemoney_fe/features/domain/repositories/digital_wallet_repository.dart';
import 'package:lovemoney_fe/features/dto/digital_wallet_dto.dart';
import 'package:lovemoney_fe/features/mapper/digital_wallet_mapper.dart';

class DigitalWalletImpl implements DigitalWalletRepository {
  final DigitalWalletMapper _digitalWalletMapper = DigitalWalletMapper();
  final RestClient _restClient = RestClient();

  @override
  Future<ApiResponse<DigitalWallet>>? createDigitalWallet({required DigitalWallet digitalWallet}) async {
    DigitalWalletDto digitalWalletDto = _digitalWalletMapper.toDTO(digitalWallet);
    try {
      var response = await _restClient.putMethod('/digitalWallet', data: digitalWalletDto.toJson());
      return ApiResponse.withResult(
        response: response.data,
        resultConverter: (json) => ApiResultSingle(
          json: json,
          rootName: 'digitalWallet',
          jsonConverter: (json) => _digitalWalletMapper.toEntity(DigitalWalletDto.fromJson(json)),
        ),
      );
    } catch (error) {
      return ApiResponse.withError(error);
    }
  }

  @override
  Future<ApiResponse<DigitalWallet>>? getDigitalWallet({required DigitalWallet digitalWallet}) async {
    DigitalWalletDto digitalWalletDto = _digitalWalletMapper.toGetDTO(digitalWallet);
    try {
      var response = await _restClient.getMethod('/digitalWallet/get/' + digitalWallet.id.toString(), params: digitalWalletDto.toJson());
      return ApiResponse.withResult(
        response: response.data,
        resultConverter: (json) => ApiResultSingle(
          json: (json),
          rootName: 'digitalWallet',
          jsonConverter: (json) => _digitalWalletMapper.toEntity(DigitalWalletDto.fromJson(json)),
        ),
      );
    } catch (error) {
      return ApiResponse.withError(error);
    }
  }

}
