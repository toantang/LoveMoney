import 'package:lovemoney_fe/features/data/rest_api/datasources/models/api_response.dart';
import 'package:lovemoney_fe/features/data/rest_api/repositories_impl/digital_wallet__repository_impl.dart';
import 'package:lovemoney_fe/features/domain/entities/digital_type.dart';
import 'package:lovemoney_fe/features/presentation/views/auth/auth_bloc/auth_bloc.dart';

import '../../../domain/entities/digital_wallet.dart';

class DigitalWalletBloc {
  final DigitalWalletImpl _digitalWalletImpl = DigitalWalletImpl();

  void createDigitalWallet() async {
    final DigitalWallet _digitalWallet = DigitalWallet(
        user: AuthBloc.getInstance().user,
      owner: AuthBloc.getInstance().user.name,
      digitalType: DigitalType(
        name: 'electronic',
      ),
      codeWallet: 'abcxyzabc',
      accountBalance: 0.0,
    );

    ApiResponse<DigitalWallet>? apiResponse = await _digitalWalletImpl.createDigitalWallet(digitalWallet: _digitalWallet);
    DigitalWallet? digitalWallet = apiResponse?.result?.data;
    print(digitalWallet.toString());
  }

  Future<DigitalWallet?> digitalWallet() async {
    DigitalWallet digitalWallet = DigitalWallet(
      user: AuthBloc.getInstance().user,
    );
    ApiResponse<DigitalWallet>? apiResponse = await _digitalWalletImpl.getDigitalWallet(digitalWallet: digitalWallet);
    return apiResponse?.result?.data;
  }

  void updateDigitalWallet() async {
    DigitalWallet digitalWallet = DigitalWallet();
  }
}