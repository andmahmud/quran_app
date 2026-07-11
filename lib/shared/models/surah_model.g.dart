// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surah_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSurahModelCollection on Isar {
  IsarCollection<SurahModel> get surahModels => this.collection();
}

const SurahModelSchema = CollectionSchema(
  name: r'SurahModel',
  id: 8450373615495182012,
  properties: {
    r'nameArabic': PropertySchema(
      id: 0,
      name: r'nameArabic',
      type: IsarType.string,
    ),
    r'nameEnglish': PropertySchema(
      id: 1,
      name: r'nameEnglish',
      type: IsarType.string,
    ),
    r'nameTranslated': PropertySchema(
      id: 2,
      name: r'nameTranslated',
      type: IsarType.string,
    ),
    r'revelationType': PropertySchema(
      id: 3,
      name: r'revelationType',
      type: IsarType.string,
    ),
    r'surahNumber': PropertySchema(
      id: 4,
      name: r'surahNumber',
      type: IsarType.long,
    ),
    r'totalAyahs': PropertySchema(
      id: 5,
      name: r'totalAyahs',
      type: IsarType.long,
    ),
  },

  estimateSize: _surahModelEstimateSize,
  serialize: _surahModelSerialize,
  deserialize: _surahModelDeserialize,
  deserializeProp: _surahModelDeserializeProp,
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

  getId: _surahModelGetId,
  getLinks: _surahModelGetLinks,
  attach: _surahModelAttach,
  version: '3.3.2',
);

int _surahModelEstimateSize(
  SurahModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.nameArabic.length * 3;
  bytesCount += 3 + object.nameEnglish.length * 3;
  bytesCount += 3 + object.nameTranslated.length * 3;
  bytesCount += 3 + object.revelationType.length * 3;
  return bytesCount;
}

void _surahModelSerialize(
  SurahModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.nameArabic);
  writer.writeString(offsets[1], object.nameEnglish);
  writer.writeString(offsets[2], object.nameTranslated);
  writer.writeString(offsets[3], object.revelationType);
  writer.writeLong(offsets[4], object.surahNumber);
  writer.writeLong(offsets[5], object.totalAyahs);
}

SurahModel _surahModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SurahModel();
  object.id = id;
  object.nameArabic = reader.readString(offsets[0]);
  object.nameEnglish = reader.readString(offsets[1]);
  object.nameTranslated = reader.readString(offsets[2]);
  object.revelationType = reader.readString(offsets[3]);
  object.surahNumber = reader.readLong(offsets[4]);
  object.totalAyahs = reader.readLong(offsets[5]);
  return object;
}

P _surahModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _surahModelGetId(SurahModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _surahModelGetLinks(SurahModel object) {
  return [];
}

void _surahModelAttach(IsarCollection<dynamic> col, Id id, SurahModel object) {
  object.id = id;
}

extension SurahModelByIndex on IsarCollection<SurahModel> {
  Future<SurahModel?> getBySurahNumber(int surahNumber) {
    return getByIndex(r'surahNumber', [surahNumber]);
  }

  SurahModel? getBySurahNumberSync(int surahNumber) {
    return getByIndexSync(r'surahNumber', [surahNumber]);
  }

  Future<bool> deleteBySurahNumber(int surahNumber) {
    return deleteByIndex(r'surahNumber', [surahNumber]);
  }

  bool deleteBySurahNumberSync(int surahNumber) {
    return deleteByIndexSync(r'surahNumber', [surahNumber]);
  }

  Future<List<SurahModel?>> getAllBySurahNumber(List<int> surahNumberValues) {
    final values = surahNumberValues.map((e) => [e]).toList();
    return getAllByIndex(r'surahNumber', values);
  }

  List<SurahModel?> getAllBySurahNumberSync(List<int> surahNumberValues) {
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

  Future<Id> putBySurahNumber(SurahModel object) {
    return putByIndex(r'surahNumber', object);
  }

  Id putBySurahNumberSync(SurahModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'surahNumber', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySurahNumber(List<SurahModel> objects) {
    return putAllByIndex(r'surahNumber', objects);
  }

  List<Id> putAllBySurahNumberSync(
    List<SurahModel> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'surahNumber', objects, saveLinks: saveLinks);
  }
}

extension SurahModelQueryWhereSort
    on QueryBuilder<SurahModel, SurahModel, QWhere> {
  QueryBuilder<SurahModel, SurahModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterWhere> anySurahNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'surahNumber'),
      );
    });
  }
}

extension SurahModelQueryWhere
    on QueryBuilder<SurahModel, SurahModel, QWhereClause> {
  QueryBuilder<SurahModel, SurahModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<SurahModel, SurahModel, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<SurahModel, SurahModel, QAfterWhereClause> surahNumberEqualTo(
    int surahNumber,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'surahNumber',
          value: [surahNumber],
        ),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterWhereClause> surahNumberNotEqualTo(
    int surahNumber,
  ) {
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

  QueryBuilder<SurahModel, SurahModel, QAfterWhereClause>
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

  QueryBuilder<SurahModel, SurahModel, QAfterWhereClause> surahNumberLessThan(
    int surahNumber, {
    bool include = false,
  }) {
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

  QueryBuilder<SurahModel, SurahModel, QAfterWhereClause> surahNumberBetween(
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

extension SurahModelQueryFilter
    on QueryBuilder<SurahModel, SurahModel, QFilterCondition> {
  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
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

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition> nameArabicEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'nameArabic',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  nameArabicGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'nameArabic',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  nameArabicLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'nameArabic',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition> nameArabicBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'nameArabic',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  nameArabicStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'nameArabic',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  nameArabicEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'nameArabic',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  nameArabicContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'nameArabic',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition> nameArabicMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'nameArabic',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  nameArabicIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'nameArabic', value: ''),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  nameArabicIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'nameArabic', value: ''),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  nameEnglishEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'nameEnglish',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  nameEnglishGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'nameEnglish',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  nameEnglishLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'nameEnglish',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  nameEnglishBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'nameEnglish',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  nameEnglishStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'nameEnglish',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  nameEnglishEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'nameEnglish',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  nameEnglishContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'nameEnglish',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  nameEnglishMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'nameEnglish',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  nameEnglishIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'nameEnglish', value: ''),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  nameEnglishIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'nameEnglish', value: ''),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  nameTranslatedEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'nameTranslated',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  nameTranslatedGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'nameTranslated',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  nameTranslatedLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'nameTranslated',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  nameTranslatedBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'nameTranslated',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  nameTranslatedStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'nameTranslated',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  nameTranslatedEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'nameTranslated',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  nameTranslatedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'nameTranslated',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  nameTranslatedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'nameTranslated',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  nameTranslatedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'nameTranslated', value: ''),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  nameTranslatedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'nameTranslated', value: ''),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  revelationTypeEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'revelationType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  revelationTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'revelationType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  revelationTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'revelationType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  revelationTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'revelationType',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  revelationTypeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'revelationType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  revelationTypeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'revelationType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  revelationTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'revelationType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  revelationTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'revelationType',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  revelationTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'revelationType', value: ''),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  revelationTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'revelationType', value: ''),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  surahNumberEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'surahNumber', value: value),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
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

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
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

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
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

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition> totalAyahsEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'totalAyahs', value: value),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  totalAyahsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalAyahs',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition>
  totalAyahsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalAyahs',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterFilterCondition> totalAyahsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalAyahs',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension SurahModelQueryObject
    on QueryBuilder<SurahModel, SurahModel, QFilterCondition> {}

extension SurahModelQueryLinks
    on QueryBuilder<SurahModel, SurahModel, QFilterCondition> {}

extension SurahModelQuerySortBy
    on QueryBuilder<SurahModel, SurahModel, QSortBy> {
  QueryBuilder<SurahModel, SurahModel, QAfterSortBy> sortByNameArabic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameArabic', Sort.asc);
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterSortBy> sortByNameArabicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameArabic', Sort.desc);
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterSortBy> sortByNameEnglish() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameEnglish', Sort.asc);
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterSortBy> sortByNameEnglishDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameEnglish', Sort.desc);
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterSortBy> sortByNameTranslated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameTranslated', Sort.asc);
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterSortBy>
  sortByNameTranslatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameTranslated', Sort.desc);
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterSortBy> sortByRevelationType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revelationType', Sort.asc);
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterSortBy>
  sortByRevelationTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revelationType', Sort.desc);
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterSortBy> sortBySurahNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surahNumber', Sort.asc);
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterSortBy> sortBySurahNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surahNumber', Sort.desc);
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterSortBy> sortByTotalAyahs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAyahs', Sort.asc);
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterSortBy> sortByTotalAyahsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAyahs', Sort.desc);
    });
  }
}

extension SurahModelQuerySortThenBy
    on QueryBuilder<SurahModel, SurahModel, QSortThenBy> {
  QueryBuilder<SurahModel, SurahModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterSortBy> thenByNameArabic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameArabic', Sort.asc);
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterSortBy> thenByNameArabicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameArabic', Sort.desc);
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterSortBy> thenByNameEnglish() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameEnglish', Sort.asc);
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterSortBy> thenByNameEnglishDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameEnglish', Sort.desc);
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterSortBy> thenByNameTranslated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameTranslated', Sort.asc);
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterSortBy>
  thenByNameTranslatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameTranslated', Sort.desc);
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterSortBy> thenByRevelationType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revelationType', Sort.asc);
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterSortBy>
  thenByRevelationTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revelationType', Sort.desc);
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterSortBy> thenBySurahNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surahNumber', Sort.asc);
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterSortBy> thenBySurahNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surahNumber', Sort.desc);
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterSortBy> thenByTotalAyahs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAyahs', Sort.asc);
    });
  }

  QueryBuilder<SurahModel, SurahModel, QAfterSortBy> thenByTotalAyahsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAyahs', Sort.desc);
    });
  }
}

extension SurahModelQueryWhereDistinct
    on QueryBuilder<SurahModel, SurahModel, QDistinct> {
  QueryBuilder<SurahModel, SurahModel, QDistinct> distinctByNameArabic({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nameArabic', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SurahModel, SurahModel, QDistinct> distinctByNameEnglish({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nameEnglish', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SurahModel, SurahModel, QDistinct> distinctByNameTranslated({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'nameTranslated',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QDistinct> distinctByRevelationType({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'revelationType',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<SurahModel, SurahModel, QDistinct> distinctBySurahNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'surahNumber');
    });
  }

  QueryBuilder<SurahModel, SurahModel, QDistinct> distinctByTotalAyahs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalAyahs');
    });
  }
}

extension SurahModelQueryProperty
    on QueryBuilder<SurahModel, SurahModel, QQueryProperty> {
  QueryBuilder<SurahModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SurahModel, String, QQueryOperations> nameArabicProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nameArabic');
    });
  }

  QueryBuilder<SurahModel, String, QQueryOperations> nameEnglishProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nameEnglish');
    });
  }

  QueryBuilder<SurahModel, String, QQueryOperations> nameTranslatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nameTranslated');
    });
  }

  QueryBuilder<SurahModel, String, QQueryOperations> revelationTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'revelationType');
    });
  }

  QueryBuilder<SurahModel, int, QQueryOperations> surahNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'surahNumber');
    });
  }

  QueryBuilder<SurahModel, int, QQueryOperations> totalAyahsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalAyahs');
    });
  }
}
