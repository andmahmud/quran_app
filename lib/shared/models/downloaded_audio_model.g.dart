// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloaded_audio_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDownloadedAudioModelCollection on Isar {
  IsarCollection<DownloadedAudioModel> get downloadedAudioModels =>
      this.collection();
}

const DownloadedAudioModelSchema = CollectionSchema(
  name: r'DownloadedAudioModel',
  id: 2223894090258423947,
  properties: {
    r'downloadedAt': PropertySchema(
      id: 0,
      name: r'downloadedAt',
      type: IsarType.dateTime,
    ),
    r'fileSize': PropertySchema(id: 1, name: r'fileSize', type: IsarType.long),
    r'localPath': PropertySchema(
      id: 2,
      name: r'localPath',
      type: IsarType.string,
    ),
    r'reciter': PropertySchema(id: 3, name: r'reciter', type: IsarType.string),
    r'reciterPath': PropertySchema(
      id: 4,
      name: r'reciterPath',
      type: IsarType.string,
    ),
    r'surahNumber': PropertySchema(
      id: 5,
      name: r'surahNumber',
      type: IsarType.long,
    ),
  },

  estimateSize: _downloadedAudioModelEstimateSize,
  serialize: _downloadedAudioModelSerialize,
  deserialize: _downloadedAudioModelDeserialize,
  deserializeProp: _downloadedAudioModelDeserializeProp,
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

  getId: _downloadedAudioModelGetId,
  getLinks: _downloadedAudioModelGetLinks,
  attach: _downloadedAudioModelAttach,
  version: '3.3.2',
);

int _downloadedAudioModelEstimateSize(
  DownloadedAudioModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.localPath.length * 3;
  bytesCount += 3 + object.reciter.length * 3;
  bytesCount += 3 + object.reciterPath.length * 3;
  return bytesCount;
}

void _downloadedAudioModelSerialize(
  DownloadedAudioModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.downloadedAt);
  writer.writeLong(offsets[1], object.fileSize);
  writer.writeString(offsets[2], object.localPath);
  writer.writeString(offsets[3], object.reciter);
  writer.writeString(offsets[4], object.reciterPath);
  writer.writeLong(offsets[5], object.surahNumber);
}

DownloadedAudioModel _downloadedAudioModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DownloadedAudioModel();
  object.downloadedAt = reader.readDateTime(offsets[0]);
  object.fileSize = reader.readLong(offsets[1]);
  object.id = id;
  object.localPath = reader.readString(offsets[2]);
  object.reciter = reader.readString(offsets[3]);
  object.reciterPath = reader.readString(offsets[4]);
  object.surahNumber = reader.readLong(offsets[5]);
  return object;
}

P _downloadedAudioModelDeserializeProp<P>(
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
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _downloadedAudioModelGetId(DownloadedAudioModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _downloadedAudioModelGetLinks(
  DownloadedAudioModel object,
) {
  return [];
}

void _downloadedAudioModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  DownloadedAudioModel object,
) {
  object.id = id;
}

extension DownloadedAudioModelByIndex on IsarCollection<DownloadedAudioModel> {
  Future<DownloadedAudioModel?> getBySurahNumber(int surahNumber) {
    return getByIndex(r'surahNumber', [surahNumber]);
  }

  DownloadedAudioModel? getBySurahNumberSync(int surahNumber) {
    return getByIndexSync(r'surahNumber', [surahNumber]);
  }

  Future<bool> deleteBySurahNumber(int surahNumber) {
    return deleteByIndex(r'surahNumber', [surahNumber]);
  }

  bool deleteBySurahNumberSync(int surahNumber) {
    return deleteByIndexSync(r'surahNumber', [surahNumber]);
  }

  Future<List<DownloadedAudioModel?>> getAllBySurahNumber(
    List<int> surahNumberValues,
  ) {
    final values = surahNumberValues.map((e) => [e]).toList();
    return getAllByIndex(r'surahNumber', values);
  }

  List<DownloadedAudioModel?> getAllBySurahNumberSync(
    List<int> surahNumberValues,
  ) {
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

  Future<Id> putBySurahNumber(DownloadedAudioModel object) {
    return putByIndex(r'surahNumber', object);
  }

  Id putBySurahNumberSync(
    DownloadedAudioModel object, {
    bool saveLinks = true,
  }) {
    return putByIndexSync(r'surahNumber', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySurahNumber(List<DownloadedAudioModel> objects) {
    return putAllByIndex(r'surahNumber', objects);
  }

  List<Id> putAllBySurahNumberSync(
    List<DownloadedAudioModel> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'surahNumber', objects, saveLinks: saveLinks);
  }
}

extension DownloadedAudioModelQueryWhereSort
    on QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QWhere> {
  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterWhere>
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterWhere>
  anySurahNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'surahNumber'),
      );
    });
  }
}

extension DownloadedAudioModelQueryWhere
    on QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QWhereClause> {
  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterWhereClause>
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

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterWhereClause>
  idBetween(
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

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterWhereClause>
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

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterWhereClause>
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

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterWhereClause>
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

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterWhereClause>
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

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterWhereClause>
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

extension DownloadedAudioModelQueryFilter
    on
        QueryBuilder<
          DownloadedAudioModel,
          DownloadedAudioModel,
          QFilterCondition
        > {
  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  downloadedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'downloadedAt', value: value),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  downloadedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'downloadedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  downloadedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'downloadedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  downloadedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'downloadedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  fileSizeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'fileSize', value: value),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  fileSizeGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'fileSize',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  fileSizeLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'fileSize',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  fileSizeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'fileSize',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  localPathEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'localPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  localPathGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'localPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  localPathLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'localPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  localPathBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'localPath',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  localPathStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'localPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  localPathEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'localPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  localPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'localPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  localPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'localPath',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  localPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'localPath', value: ''),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  localPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'localPath', value: ''),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  reciterEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'reciter',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  reciterGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'reciter',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  reciterLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'reciter',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  reciterBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'reciter',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  reciterStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'reciter',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  reciterEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'reciter',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  reciterContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'reciter',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  reciterMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'reciter',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  reciterIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'reciter', value: ''),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  reciterIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'reciter', value: ''),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  reciterPathEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'reciterPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  reciterPathGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'reciterPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  reciterPathLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'reciterPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  reciterPathBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'reciterPath',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  reciterPathStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'reciterPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  reciterPathEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'reciterPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  reciterPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'reciterPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  reciterPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'reciterPath',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  reciterPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'reciterPath', value: ''),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  reciterPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'reciterPath', value: ''),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
  surahNumberEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'surahNumber', value: value),
      );
    });
  }

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    DownloadedAudioModel,
    DownloadedAudioModel,
    QAfterFilterCondition
  >
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

extension DownloadedAudioModelQueryObject
    on
        QueryBuilder<
          DownloadedAudioModel,
          DownloadedAudioModel,
          QFilterCondition
        > {}

extension DownloadedAudioModelQueryLinks
    on
        QueryBuilder<
          DownloadedAudioModel,
          DownloadedAudioModel,
          QFilterCondition
        > {}

extension DownloadedAudioModelQuerySortBy
    on QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QSortBy> {
  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterSortBy>
  sortByDownloadedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadedAt', Sort.asc);
    });
  }

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterSortBy>
  sortByDownloadedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadedAt', Sort.desc);
    });
  }

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterSortBy>
  sortByFileSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileSize', Sort.asc);
    });
  }

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterSortBy>
  sortByFileSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileSize', Sort.desc);
    });
  }

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterSortBy>
  sortByLocalPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localPath', Sort.asc);
    });
  }

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterSortBy>
  sortByLocalPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localPath', Sort.desc);
    });
  }

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterSortBy>
  sortByReciter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reciter', Sort.asc);
    });
  }

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterSortBy>
  sortByReciterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reciter', Sort.desc);
    });
  }

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterSortBy>
  sortByReciterPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reciterPath', Sort.asc);
    });
  }

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterSortBy>
  sortByReciterPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reciterPath', Sort.desc);
    });
  }

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterSortBy>
  sortBySurahNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surahNumber', Sort.asc);
    });
  }

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterSortBy>
  sortBySurahNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surahNumber', Sort.desc);
    });
  }
}

extension DownloadedAudioModelQuerySortThenBy
    on QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QSortThenBy> {
  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterSortBy>
  thenByDownloadedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadedAt', Sort.asc);
    });
  }

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterSortBy>
  thenByDownloadedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadedAt', Sort.desc);
    });
  }

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterSortBy>
  thenByFileSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileSize', Sort.asc);
    });
  }

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterSortBy>
  thenByFileSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileSize', Sort.desc);
    });
  }

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterSortBy>
  thenByLocalPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localPath', Sort.asc);
    });
  }

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterSortBy>
  thenByLocalPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localPath', Sort.desc);
    });
  }

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterSortBy>
  thenByReciter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reciter', Sort.asc);
    });
  }

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterSortBy>
  thenByReciterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reciter', Sort.desc);
    });
  }

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterSortBy>
  thenByReciterPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reciterPath', Sort.asc);
    });
  }

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterSortBy>
  thenByReciterPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reciterPath', Sort.desc);
    });
  }

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterSortBy>
  thenBySurahNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surahNumber', Sort.asc);
    });
  }

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QAfterSortBy>
  thenBySurahNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surahNumber', Sort.desc);
    });
  }
}

extension DownloadedAudioModelQueryWhereDistinct
    on QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QDistinct> {
  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QDistinct>
  distinctByDownloadedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'downloadedAt');
    });
  }

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QDistinct>
  distinctByFileSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fileSize');
    });
  }

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QDistinct>
  distinctByLocalPath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QDistinct>
  distinctByReciter({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reciter', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QDistinct>
  distinctByReciterPath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reciterPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DownloadedAudioModel, DownloadedAudioModel, QDistinct>
  distinctBySurahNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'surahNumber');
    });
  }
}

extension DownloadedAudioModelQueryProperty
    on
        QueryBuilder<
          DownloadedAudioModel,
          DownloadedAudioModel,
          QQueryProperty
        > {
  QueryBuilder<DownloadedAudioModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DownloadedAudioModel, DateTime, QQueryOperations>
  downloadedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'downloadedAt');
    });
  }

  QueryBuilder<DownloadedAudioModel, int, QQueryOperations> fileSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fileSize');
    });
  }

  QueryBuilder<DownloadedAudioModel, String, QQueryOperations>
  localPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localPath');
    });
  }

  QueryBuilder<DownloadedAudioModel, String, QQueryOperations>
  reciterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reciter');
    });
  }

  QueryBuilder<DownloadedAudioModel, String, QQueryOperations>
  reciterPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reciterPath');
    });
  }

  QueryBuilder<DownloadedAudioModel, int, QQueryOperations>
  surahNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'surahNumber');
    });
  }
}
