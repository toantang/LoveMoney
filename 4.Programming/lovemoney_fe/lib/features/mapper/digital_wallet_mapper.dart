import '../../core/util/mapper.dart';
import 'package:lovemoney_fe/features/dto/digital_wallet_dto.dart';

import '../domain/entities/digital_wallet.dart';

class DigitalWalletMapper implements Mapper<DigitalWallet, DigitalWalletDto> {
  @override
  DigitalWalletDto toDTO(DigitalWallet _digitalWallet) {
    return DigitalWalletDto(
      owner: _digitalWallet.user?.name,
      digitalType: _digitalWallet.digitalType,
      codeWallet: _digitalWallet.codeWallet,
      accountBalance: _digitalWallet.accountBalance,
      userId: _digitalWallet.user?.id,
    );
  }

  @override
  DigitalWallet toEntity(DigitalWalletDto _digitalWalletDto) {
    return DigitalWallet(
      id: _digitalWalletDto.id,
      accountBalance: _digitalWalletDto.accountBalance,
      codeWallet: _digitalWalletDto.codeWallet,
      digitalType: _digitalWalletDto.digitalType,
      owner: _digitalWalletDto.owner,
      user: null,
    );
  }

  DigitalWalletDto toGetDTO(DigitalWallet _digitalWallet) {
    return DigitalWalletDto(
      userId: _digitalWallet.user?.id,
    );
  }
}

