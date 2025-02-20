/// Base class for converter models
abstract class Converter<E, M> {
  E convertToEntity(M model);
}