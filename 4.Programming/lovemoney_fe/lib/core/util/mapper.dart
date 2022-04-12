
abstract class Mapper<ENTITY, DTO> {
  DTO toDTO(ENTITY _entity);
  ENTITY toEntity(DTO _dto);
}
