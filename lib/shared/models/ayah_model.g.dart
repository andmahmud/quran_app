// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ayah_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAyahModelCollection on Isar {
  IsarCollection<AyahModel> get ayahModels => this.collection();
}

const AyahModelSchema = CollectionSchema(
  name: r'AyahModel',
  id: -2877434955229343211,
  properties: {
    r'arabicText': PropertySchema(
      id: 0,
      name: r'arabicText',
      type: IsarType.string,
    ),
    r'ayahNumber': PropertySchema(
      id: 1,
      name: r'ayahNumber',
      type: IsarType.long,
    ),
    r'hizb': PropertySchema(id: 2, name: r'hizb', type: IsarType.long),
    r'juz': PropertySchema(id: 3, name: r'juz', type: IsarType.long),
    r'page': PropertySchema(id: 4, name: r'page', type: IsarType.long),
    r'ruku': PropertySchema(id: 5, name: r'ruku', type: IsarType.long),
    r'surahNumber': PropertySchema(
      id: 6,
      name: r'surahNumber',
      type: IsarType.long,
    ),
    r'translationText': PropertySchema(
      id: 7,
      name: r'translationText',
      type: IsarType.string,
    ),
  },

  estimateSize: _ayahModelEstimateSize,
  serialize: _ayahModelSerialize,
  deserialize: _ayahModelDeserialize,
  deserializeProp: _ayahModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'surahNumber_ayahNumber': IndexSchema(
      id: 5327427526691098780,
      name: r'surahNumber_ayahNumber',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'surahNumber',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'ayahNumber',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _ayahModelGetId,
  getLinks: _ayahModelGetLinks,
  attach: _ayahModelAttach,
  version: '3.3.2',
);

int _ayahModelEstimateSize(
  AyahModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.arabicText.length * 3;
  bytesCount += 3 + object.translationText.length * 3;
  return bytesCount;
}

void _ayahModelSerialize(
  AyahModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.arabicText);
  writer.writeLong(offsets[1], object.ayahNumber);
  writer.writeLong(offsets[2], object.hizb);
  writer.writeLong(offsets[3], object.juz);
  writer.writeLong(offsets[4], object.page);
  writer.writeLong(offsets[5], object.ruku);
  writer.writeLong(offsets[6], object.surahNumber);
  writer.writeString(offsets[7], object.translationText);
}

AyahModel _ayahModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AyahModel();
  object.arabicText = reader.readString(offsets[0]);
  object.ayahNumber = reader.readLong(offsets[1]);
  object.hizb = reader.readLong(offsets[2]);
  object.id = id;
  object.juz = reader.readLong(offsets[3]);
  object.page = reader.readLong(offsets[4]);
  object.ruku = reader.readLong(offsets[5]);
  object.surahNumber = reader.readLong(offsets[6]);
  object.translationText = reader.readString(offsets[7]);
  return object;
}

P _ayahModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _ayahModelGetId(AyahModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ayahModelGetLinks(AyahModel object) {
  return [];
}

void _ayahModelAttach(IsarCollection<dynamic> col, Id id, AyahModel object) {
  object.id = id;
}

extension AyahModelQueryWhereSort
    on QueryBuilder<AyahModel, AyahModel, QWhere> {
  QueryBuilder<AyahModel, AyahModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterWhere> anySurahNumberAyahNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'surahNumber_ayahNumber'),
      );
    });
  }
}

extension AyahModelQueryWhere
    on QueryBuilder<AyahModel, AyahModel, QWhereClause> {
  QueryBuilder<AyahModel, AyahModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<AyahModel, AyahModel, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<AyahModel, AyahModel, QAfterWhereClause>
  surahNumberEqualToAnyAyahNumber(int surahNumber) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'surahNumber_ayahNumber',
          value: [surahNumber],
        ),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterWhereClause>
  surahNumberNotEqualToAnyAyahNumber(int surahNumber) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'surahNumber_ayahNumber',
                lower: [],
                upper: [surahNumber],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'surahNumber_ayahNumber',
                lower: [surahNumber],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'surahNumber_ayahNumber',
                lower: [surahNumber],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'surahNumber_ayahNumber',
                lower: [],
                upper: [surahNumber],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterWhereClause>
  surahNumberGreaterThanAnyAyahNumber(int surahNumber, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'surahNumber_ayahNumber',
          lower: [surahNumber],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterWhereClause>
  surahNumberLessThanAnyAyahNumber(int surahNumber, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'surahNumber_ayahNumber',
          lower: [],
          upper: [surahNumber],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterWhereClause>
  surahNumberBetweenAnyAyahNumber(
    int lowerSurahNumber,
    int upperSurahNumber, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'surahNumber_ayahNumber',
          lower: [lowerSurahNumber],
          includeLower: includeLower,
          upper: [upperSurahNumber],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterWhereClause>
  surahNumberAyahNumberEqualTo(int surahNumber, int ayahNumber) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'surahNumber_ayahNumber',
          value: [surahNumber, ayahNumber],
        ),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterWhereClause>
  surahNumberEqualToAyahNumberNotEqualTo(int surahNumber, int ayahNumber) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'surahNumber_ayahNumber',
                lower: [surahNumber],
                upper: [surahNumber, ayahNumber],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'surahNumber_ayahNumber',
                lower: [surahNumber, ayahNumber],
                includeLower: false,
                upper: [surahNumber],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'surahNumber_ayahNumber',
                lower: [surahNumber, ayahNumber],
                includeLower: false,
                upper: [surahNumber],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'surahNumber_ayahNumber',
                lower: [surahNumber],
                upper: [surahNumber, ayahNumber],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterWhereClause>
  surahNumberEqualToAyahNumberGreaterThan(
    int surahNumber,
    int ayahNumber, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'surahNumber_ayahNumber',
          lower: [surahNumber, ayahNumber],
          includeLower: include,
          upper: [surahNumber],
        ),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterWhereClause>
  surahNumberEqualToAyahNumberLessThan(
    int surahNumber,
    int ayahNumber, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'surahNumber_ayahNumber',
          lower: [surahNumber],
          upper: [surahNumber, ayahNumber],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterWhereClause>
  surahNumberEqualToAyahNumberBetween(
    int surahNumber,
    int lowerAyahNumber,
    int upperAyahNumber, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'surahNumber_ayahNumber',
          lower: [surahNumber, lowerAyahNumber],
          includeLower: includeLower,
          upper: [surahNumber, upperAyahNumber],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension AyahModelQueryFilter
    on QueryBuilder<AyahModel, AyahModel, QFilterCondition> {
  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition> arabicTextEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'arabicText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition>
  arabicTextGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'arabicText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition> arabicTextLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'arabicText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition> arabicTextBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'arabicText',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition>
  arabicTextStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'arabicText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition> arabicTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'arabicText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition> arabicTextContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'arabicText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition> arabicTextMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'arabicText',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition>
  arabicTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'arabicText', value: ''),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition>
  arabicTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'arabicText', value: ''),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition> ayahNumberEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'ayahNumber', value: value),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition>
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

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition> ayahNumberLessThan(
    int value, {
    bool include = false,
  }) {
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

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition> ayahNumberBetween(
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

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition> hizbEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hizb', value: value),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition> hizbGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'hizb',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition> hizbLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'hizb',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition> hizbBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'hizb',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition> juzEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'juz', value: value),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition> juzGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'juz',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition> juzLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'juz',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition> juzBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'juz',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition> pageEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'page', value: value),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition> pageGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'page',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition> pageLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'page',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition> pageBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'page',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition> rukuEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'ruku', value: value),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition> rukuGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'ruku',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition> rukuLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'ruku',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition> rukuBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'ruku',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition> surahNumberEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'surahNumber', value: value),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition>
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

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition> surahNumberLessThan(
    int value, {
    bool include = false,
  }) {
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

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition> surahNumberBetween(
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

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition>
  translationTextEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'translationText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition>
  translationTextGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'translationText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition>
  translationTextLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'translationText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition>
  translationTextBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'translationText',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition>
  translationTextStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'translationText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition>
  translationTextEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'translationText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition>
  translationTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'translationText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition>
  translationTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'translationText',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition>
  translationTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'translationText', value: ''),
      );
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterFilterCondition>
  translationTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'translationText', value: ''),
      );
    });
  }
}

extension AyahModelQueryObject
    on QueryBuilder<AyahModel, AyahModel, QFilterCondition> {}

extension AyahModelQueryLinks
    on QueryBuilder<AyahModel, AyahModel, QFilterCondition> {}

extension AyahModelQuerySortBy on QueryBuilder<AyahModel, AyahModel, QSortBy> {
  QueryBuilder<AyahModel, AyahModel, QAfterSortBy> sortByArabicText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'arabicText', Sort.asc);
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterSortBy> sortByArabicTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'arabicText', Sort.desc);
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterSortBy> sortByAyahNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ayahNumber', Sort.asc);
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterSortBy> sortByAyahNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ayahNumber', Sort.desc);
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterSortBy> sortByHizb() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hizb', Sort.asc);
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterSortBy> sortByHizbDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hizb', Sort.desc);
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterSortBy> sortByJuz() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'juz', Sort.asc);
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterSortBy> sortByJuzDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'juz', Sort.desc);
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterSortBy> sortByPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'page', Sort.asc);
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterSortBy> sortByPageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'page', Sort.desc);
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterSortBy> sortByRuku() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruku', Sort.asc);
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterSortBy> sortByRukuDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruku', Sort.desc);
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterSortBy> sortBySurahNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surahNumber', Sort.asc);
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterSortBy> sortBySurahNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surahNumber', Sort.desc);
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterSortBy> sortByTranslationText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translationText', Sort.asc);
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterSortBy> sortByTranslationTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translationText', Sort.desc);
    });
  }
}

extension AyahModelQuerySortThenBy
    on QueryBuilder<AyahModel, AyahModel, QSortThenBy> {
  QueryBuilder<AyahModel, AyahModel, QAfterSortBy> thenByArabicText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'arabicText', Sort.asc);
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterSortBy> thenByArabicTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'arabicText', Sort.desc);
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterSortBy> thenByAyahNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ayahNumber', Sort.asc);
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterSortBy> thenByAyahNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ayahNumber', Sort.desc);
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterSortBy> thenByHizb() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hizb', Sort.asc);
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterSortBy> thenByHizbDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hizb', Sort.desc);
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterSortBy> thenByJuz() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'juz', Sort.asc);
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterSortBy> thenByJuzDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'juz', Sort.desc);
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterSortBy> thenByPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'page', Sort.asc);
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterSortBy> thenByPageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'page', Sort.desc);
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterSortBy> thenByRuku() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruku', Sort.asc);
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterSortBy> thenByRukuDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruku', Sort.desc);
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterSortBy> thenBySurahNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surahNumber', Sort.asc);
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterSortBy> thenBySurahNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surahNumber', Sort.desc);
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterSortBy> thenByTranslationText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translationText', Sort.asc);
    });
  }

  QueryBuilder<AyahModel, AyahModel, QAfterSortBy> thenByTranslationTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translationText', Sort.desc);
    });
  }
}

extension AyahModelQueryWhereDistinct
    on QueryBuilder<AyahModel, AyahModel, QDistinct> {
  QueryBuilder<AyahModel, AyahModel, QDistinct> distinctByArabicText({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'arabicText', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AyahModel, AyahModel, QDistinct> distinctByAyahNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ayahNumber');
    });
  }

  QueryBuilder<AyahModel, AyahModel, QDistinct> distinctByHizb() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hizb');
    });
  }

  QueryBuilder<AyahModel, AyahModel, QDistinct> distinctByJuz() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'juz');
    });
  }

  QueryBuilder<AyahModel, AyahModel, QDistinct> distinctByPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'page');
    });
  }

  QueryBuilder<AyahModel, AyahModel, QDistinct> distinctByRuku() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ruku');
    });
  }

  QueryBuilder<AyahModel, AyahModel, QDistinct> distinctBySurahNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'surahNumber');
    });
  }

  QueryBuilder<AyahModel, AyahModel, QDistinct> distinctByTranslationText({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'translationText',
        caseSensitive: caseSensitive,
      );
    });
  }
}

extension AyahModelQueryProperty
    on QueryBuilder<AyahModel, AyahModel, QQueryProperty> {
  QueryBuilder<AyahModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AyahModel, String, QQueryOperations> arabicTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'arabicText');
    });
  }

  QueryBuilder<AyahModel, int, QQueryOperations> ayahNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ayahNumber');
    });
  }

  QueryBuilder<AyahModel, int, QQueryOperations> hizbProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hizb');
    });
  }

  QueryBuilder<AyahModel, int, QQueryOperations> juzProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'juz');
    });
  }

  QueryBuilder<AyahModel, int, QQueryOperations> pageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'page');
    });
  }

  QueryBuilder<AyahModel, int, QQueryOperations> rukuProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ruku');
    });
  }

  QueryBuilder<AyahModel, int, QQueryOperations> surahNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'surahNumber');
    });
  }

  QueryBuilder<AyahModel, String, QQueryOperations> translationTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'translationText');
    });
  }
}
