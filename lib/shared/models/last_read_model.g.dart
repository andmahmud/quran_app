// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_read_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLastReadModelCollection on Isar {
  IsarCollection<LastReadModel> get lastReadModels => this.collection();
}

const LastReadModelSchema = CollectionSchema(
  name: r'LastReadModel',
  id: 8180444031845871040,
  properties: {
    r'ayahNumber': PropertySchema(
      id: 0,
      name: r'ayahNumber',
      type: IsarType.long,
    ),
    r'scrollPosition': PropertySchema(
      id: 1,
      name: r'scrollPosition',
      type: IsarType.double,
    ),
    r'surahNumber': PropertySchema(
      id: 2,
      name: r'surahNumber',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 3,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _lastReadModelEstimateSize,
  serialize: _lastReadModelSerialize,
  deserialize: _lastReadModelDeserialize,
  deserializeProp: _lastReadModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'surahNumber': IndexSchema(
      id: 9024003441292455669,
      name: r'surahNumber',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'surahNumber',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _lastReadModelGetId,
  getLinks: _lastReadModelGetLinks,
  attach: _lastReadModelAttach,
  version: '3.3.2',
);

int _lastReadModelEstimateSize(
  LastReadModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _lastReadModelSerialize(
  LastReadModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.ayahNumber);
  writer.writeDouble(offsets[1], object.scrollPosition);
  writer.writeLong(offsets[2], object.surahNumber);
  writer.writeDateTime(offsets[3], object.updatedAt);
}

LastReadModel _lastReadModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LastReadModel();
  object.ayahNumber = reader.readLong(offsets[0]);
  object.id = id;
  object.scrollPosition = reader.readDouble(offsets[1]);
  object.surahNumber = reader.readLong(offsets[2]);
  object.updatedAt = reader.readDateTime(offsets[3]);
  return object;
}

P _lastReadModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _lastReadModelGetId(LastReadModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _lastReadModelGetLinks(LastReadModel object) {
  return [];
}

void _lastReadModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  LastReadModel object,
) {
  object.id = id;
}

extension LastReadModelByIndex on IsarCollection<LastReadModel> {
  Future<LastReadModel?> getBySurahNumber(int surahNumber) {
    return getByIndex(r'surahNumber', [surahNumber]);
  }

  LastReadModel? getBySurahNumberSync(int surahNumber) {
    return getByIndexSync(r'surahNumber', [surahNumber]);
  }

  Future<bool> deleteBySurahNumber(int surahNumber) {
    return deleteByIndex(r'surahNumber', [surahNumber]);
  }

  bool deleteBySurahNumberSync(int surahNumber) {
    return deleteByIndexSync(r'surahNumber', [surahNumber]);
  }

  Future<List<LastReadModel?>> getAllBySurahNumber(
    List<int> surahNumberValues,
  ) {
    final values = surahNumberValues.map((e) => [e]).toList();
    return getAllByIndex(r'surahNumber', values);
  }

  List<LastReadModel?> getAllBySurahNumberSync(List<int> surahNumberValues) {
    final values = surahNumberValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'surahNumber', values);
  }

  Future<int> deleteAllBySurahNumber(List<int> surahNumberValues) {
    final values = surahNumberValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'surahNumber', values);
  }

  int deleteAllBySurahNumberSync(List<int> surahNumberValues) {
    final values = surahNumberValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'surahNumber', values);
  }

  Future<Id> putBySurahNumber(LastReadModel object) {
    return putByIndex(r'surahNumber', object);
  }

  Id putBySurahNumberSync(LastReadModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'surahNumber', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySurahNumber(List<LastReadModel> objects) {
    return putAllByIndex(r'surahNumber', objects);
  }

  List<Id> putAllBySurahNumberSync(
    List<LastReadModel> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'surahNumber', objects, saveLinks: saveLinks);
  }
}

extension LastReadModelQueryWhereSort
    on QueryBuilder<LastReadModel, LastReadModel, QWhere> {
  QueryBuilder<LastReadModel, LastReadModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterWhere> anySurahNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'surahNumber'),
      );
    });
  }
}

extension LastReadModelQueryWhere
    on QueryBuilder<LastReadModel, LastReadModel, QWhereClause> {
  QueryBuilder<LastReadModel, LastReadModel, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterWhereClause>
  surahNumberEqualTo(int surahNumber) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'surahNumber',
          value: [surahNumber],
        ),
      );
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterWhereClause>
  surahNumberNotEqualTo(int surahNumber) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'surahNumber',
                lower: [],
                upper: [surahNumber],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'surahNumber',
                lower: [surahNumber],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'surahNumber',
                lower: [surahNumber],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'surahNumber',
                lower: [],
                upper: [surahNumber],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterWhereClause>
  surahNumberGreaterThan(int surahNumber, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'surahNumber',
          lower: [surahNumber],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterWhereClause>
  surahNumberLessThan(int surahNumber, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'surahNumber',
          lower: [],
          upper: [surahNumber],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterWhereClause>
  surahNumberBetween(
    int lowerSurahNumber,
    int upperSurahNumber, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'surahNumber',
          lower: [lowerSurahNumber],
          includeLower: includeLower,
          upper: [upperSurahNumber],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension LastReadModelQueryFilter
    on QueryBuilder<LastReadModel, LastReadModel, QFilterCondition> {
  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
  ayahNumberEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'ayahNumber', value: value),
      );
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
  ayahNumberGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'ayahNumber',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
  ayahNumberLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'ayahNumber',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
  ayahNumberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'ayahNumber',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
  scrollPositionEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'scrollPosition',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
  scrollPositionGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'scrollPosition',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
  scrollPositionLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'scrollPosition',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
  scrollPositionBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'scrollPosition',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
  surahNumberEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'surahNumber', value: value),
      );
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
  surahNumberGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'surahNumber',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
  surahNumberLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'surahNumber',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
  surahNumberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'surahNumber',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
  updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
  updatedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
  updatedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
  updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'updatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension LastReadModelQueryObject
    on QueryBuilder<LastReadModel, LastReadModel, QFilterCondition> {}

extension LastReadModelQueryLinks
    on QueryBuilder<LastReadModel, LastReadModel, QFilterCondition> {}

extension LastReadModelQuerySortBy
    on QueryBuilder<LastReadModel, LastReadModel, QSortBy> {
  QueryBuilder<LastReadModel, LastReadModel, QAfterSortBy> sortByAyahNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ayahNumber', Sort.asc);
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterSortBy>
  sortByAyahNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ayahNumber', Sort.desc);
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterSortBy>
  sortByScrollPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scrollPosition', Sort.asc);
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterSortBy>
  sortByScrollPositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scrollPosition', Sort.desc);
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterSortBy> sortBySurahNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surahNumber', Sort.asc);
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterSortBy>
  sortBySurahNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surahNumber', Sort.desc);
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension LastReadModelQuerySortThenBy
    on QueryBuilder<LastReadModel, LastReadModel, QSortThenBy> {
  QueryBuilder<LastReadModel, LastReadModel, QAfterSortBy> thenByAyahNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ayahNumber', Sort.asc);
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterSortBy>
  thenByAyahNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ayahNumber', Sort.desc);
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterSortBy>
  thenByScrollPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scrollPosition', Sort.asc);
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterSortBy>
  thenByScrollPositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scrollPosition', Sort.desc);
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterSortBy> thenBySurahNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surahNumber', Sort.asc);
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterSortBy>
  thenBySurahNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surahNumber', Sort.desc);
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension LastReadModelQueryWhereDistinct
    on QueryBuilder<LastReadModel, LastReadModel, QDistinct> {
  QueryBuilder<LastReadModel, LastReadModel, QDistinct> distinctByAyahNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ayahNumber');
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QDistinct>
  distinctByScrollPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scrollPosition');
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QDistinct>
  distinctBySurahNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'surahNumber');
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension LastReadModelQueryProperty
    on QueryBuilder<LastReadModel, LastReadModel, QQueryProperty> {
  QueryBuilder<LastReadModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LastReadModel, int, QQueryOperations> ayahNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ayahNumber');
    });
  }

  QueryBuilder<LastReadModel, double, QQueryOperations>
  scrollPositionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scrollPosition');
    });
  }

  QueryBuilder<LastReadModel, int, QQueryOperations> surahNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'surahNumber');
    });
  }

  QueryBuilder<LastReadModel, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
