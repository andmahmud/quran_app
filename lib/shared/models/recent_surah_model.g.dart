// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_surah_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRecentSurahModelCollection on Isar {
  IsarCollection<RecentSurahModel> get recentSurahModels => this.collection();
}

const RecentSurahModelSchema = CollectionSchema(
  name: r'RecentSurahModel',
  id: -4701100538011092483,
  properties: {
    r'openedAt': PropertySchema(
      id: 0,
      name: r'openedAt',
      type: IsarType.dateTime,
    ),
    r'surahNumber': PropertySchema(
      id: 1,
      name: r'surahNumber',
      type: IsarType.long,
    ),
  },

  estimateSize: _recentSurahModelEstimateSize,
  serialize: _recentSurahModelSerialize,
  deserialize: _recentSurahModelDeserialize,
  deserializeProp: _recentSurahModelDeserializeProp,
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

  getId: _recentSurahModelGetId,
  getLinks: _recentSurahModelGetLinks,
  attach: _recentSurahModelAttach,
  version: '3.3.2',
);

int _recentSurahModelEstimateSize(
  RecentSurahModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _recentSurahModelSerialize(
  RecentSurahModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.openedAt);
  writer.writeLong(offsets[1], object.surahNumber);
}

RecentSurahModel _recentSurahModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RecentSurahModel();
  object.id = id;
  object.openedAt = reader.readDateTime(offsets[0]);
  object.surahNumber = reader.readLong(offsets[1]);
  return object;
}

P _recentSurahModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _recentSurahModelGetId(RecentSurahModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _recentSurahModelGetLinks(RecentSurahModel object) {
  return [];
}

void _recentSurahModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  RecentSurahModel object,
) {
  object.id = id;
}

extension RecentSurahModelByIndex on IsarCollection<RecentSurahModel> {
  Future<RecentSurahModel?> getBySurahNumber(int surahNumber) {
    return getByIndex(r'surahNumber', [surahNumber]);
  }

  RecentSurahModel? getBySurahNumberSync(int surahNumber) {
    return getByIndexSync(r'surahNumber', [surahNumber]);
  }

  Future<bool> deleteBySurahNumber(int surahNumber) {
    return deleteByIndex(r'surahNumber', [surahNumber]);
  }

  bool deleteBySurahNumberSync(int surahNumber) {
    return deleteByIndexSync(r'surahNumber', [surahNumber]);
  }

  Future<List<RecentSurahModel?>> getAllBySurahNumber(
    List<int> surahNumberValues,
  ) {
    final values = surahNumberValues.map((e) => [e]).toList();
    return getAllByIndex(r'surahNumber', values);
  }

  List<RecentSurahModel?> getAllBySurahNumberSync(List<int> surahNumberValues) {
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

  Future<Id> putBySurahNumber(RecentSurahModel object) {
    return putByIndex(r'surahNumber', object);
  }

  Id putBySurahNumberSync(RecentSurahModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'surahNumber', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySurahNumber(List<RecentSurahModel> objects) {
    return putAllByIndex(r'surahNumber', objects);
  }

  List<Id> putAllBySurahNumberSync(
    List<RecentSurahModel> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'surahNumber', objects, saveLinks: saveLinks);
  }
}

extension RecentSurahModelQueryWhereSort
    on QueryBuilder<RecentSurahModel, RecentSurahModel, QWhere> {
  QueryBuilder<RecentSurahModel, RecentSurahModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<RecentSurahModel, RecentSurahModel, QAfterWhere>
  anySurahNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'surahNumber'),
      );
    });
  }
}

extension RecentSurahModelQueryWhere
    on QueryBuilder<RecentSurahModel, RecentSurahModel, QWhereClause> {
  QueryBuilder<RecentSurahModel, RecentSurahModel, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<RecentSurahModel, RecentSurahModel, QAfterWhereClause>
  idNotEqualTo(Id id) {
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

  QueryBuilder<RecentSurahModel, RecentSurahModel, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RecentSurahModel, RecentSurahModel, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RecentSurahModel, RecentSurahModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<RecentSurahModel, RecentSurahModel, QAfterWhereClause>
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

  QueryBuilder<RecentSurahModel, RecentSurahModel, QAfterWhereClause>
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

  QueryBuilder<RecentSurahModel, RecentSurahModel, QAfterWhereClause>
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

  QueryBuilder<RecentSurahModel, RecentSurahModel, QAfterWhereClause>
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

  QueryBuilder<RecentSurahModel, RecentSurahModel, QAfterWhereClause>
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

extension RecentSurahModelQueryFilter
    on QueryBuilder<RecentSurahModel, RecentSurahModel, QFilterCondition> {
  QueryBuilder<RecentSurahModel, RecentSurahModel, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<RecentSurahModel, RecentSurahModel, QAfterFilterCondition>
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

  QueryBuilder<RecentSurahModel, RecentSurahModel, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
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

  QueryBuilder<RecentSurahModel, RecentSurahModel, QAfterFilterCondition>
  idBetween(
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

  QueryBuilder<RecentSurahModel, RecentSurahModel, QAfterFilterCondition>
  openedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'openedAt', value: value),
      );
    });
  }

  QueryBuilder<RecentSurahModel, RecentSurahModel, QAfterFilterCondition>
  openedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'openedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RecentSurahModel, RecentSurahModel, QAfterFilterCondition>
  openedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'openedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RecentSurahModel, RecentSurahModel, QAfterFilterCondition>
  openedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'openedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<RecentSurahModel, RecentSurahModel, QAfterFilterCondition>
  surahNumberEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'surahNumber', value: value),
      );
    });
  }

  QueryBuilder<RecentSurahModel, RecentSurahModel, QAfterFilterCondition>
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

  QueryBuilder<RecentSurahModel, RecentSurahModel, QAfterFilterCondition>
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

  QueryBuilder<RecentSurahModel, RecentSurahModel, QAfterFilterCondition>
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
}

extension RecentSurahModelQueryObject
    on QueryBuilder<RecentSurahModel, RecentSurahModel, QFilterCondition> {}

extension RecentSurahModelQueryLinks
    on QueryBuilder<RecentSurahModel, RecentSurahModel, QFilterCondition> {}

extension RecentSurahModelQuerySortBy
    on QueryBuilder<RecentSurahModel, RecentSurahModel, QSortBy> {
  QueryBuilder<RecentSurahModel, RecentSurahModel, QAfterSortBy>
  sortByOpenedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openedAt', Sort.asc);
    });
  }

  QueryBuilder<RecentSurahModel, RecentSurahModel, QAfterSortBy>
  sortByOpenedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openedAt', Sort.desc);
    });
  }

  QueryBuilder<RecentSurahModel, RecentSurahModel, QAfterSortBy>
  sortBySurahNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surahNumber', Sort.asc);
    });
  }

  QueryBuilder<RecentSurahModel, RecentSurahModel, QAfterSortBy>
  sortBySurahNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surahNumber', Sort.desc);
    });
  }
}

extension RecentSurahModelQuerySortThenBy
    on QueryBuilder<RecentSurahModel, RecentSurahModel, QSortThenBy> {
  QueryBuilder<RecentSurahModel, RecentSurahModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RecentSurahModel, RecentSurahModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RecentSurahModel, RecentSurahModel, QAfterSortBy>
  thenByOpenedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openedAt', Sort.asc);
    });
  }

  QueryBuilder<RecentSurahModel, RecentSurahModel, QAfterSortBy>
  thenByOpenedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openedAt', Sort.desc);
    });
  }

  QueryBuilder<RecentSurahModel, RecentSurahModel, QAfterSortBy>
  thenBySurahNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surahNumber', Sort.asc);
    });
  }

  QueryBuilder<RecentSurahModel, RecentSurahModel, QAfterSortBy>
  thenBySurahNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surahNumber', Sort.desc);
    });
  }
}

extension RecentSurahModelQueryWhereDistinct
    on QueryBuilder<RecentSurahModel, RecentSurahModel, QDistinct> {
  QueryBuilder<RecentSurahModel, RecentSurahModel, QDistinct>
  distinctByOpenedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'openedAt');
    });
  }

  QueryBuilder<RecentSurahModel, RecentSurahModel, QDistinct>
  distinctBySurahNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'surahNumber');
    });
  }
}

extension RecentSurahModelQueryProperty
    on QueryBuilder<RecentSurahModel, RecentSurahModel, QQueryProperty> {
  QueryBuilder<RecentSurahModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RecentSurahModel, DateTime, QQueryOperations>
  openedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'openedAt');
    });
  }

  QueryBuilder<RecentSurahModel, int, QQueryOperations> surahNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'surahNumber');
    });
  }
}
