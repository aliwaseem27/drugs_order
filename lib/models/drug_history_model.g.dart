// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drug_history_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetOrderHistoryCollection on Isar {
  IsarCollection<OrderHistory> get orderHistorys => this.collection();
}

const OrderHistorySchema = CollectionSchema(
  name: r'OrderHistory',
  id: -7195621136657906132,
  properties: {
    r'dateTime': PropertySchema(
      id: 0,
      name: r'dateTime',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _orderHistoryEstimateSize,
  serialize: _orderHistorySerialize,
  deserialize: _orderHistoryDeserialize,
  deserializeProp: _orderHistoryDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'drugs': LinkSchema(
      id: 1385056344285421538,
      name: r'drugs',
      target: r'SelectedDrug',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _orderHistoryGetId,
  getLinks: _orderHistoryGetLinks,
  attach: _orderHistoryAttach,
  version: '3.1.0+1',
);

int _orderHistoryEstimateSize(
  OrderHistory object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _orderHistorySerialize(
  OrderHistory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.dateTime);
}

OrderHistory _orderHistoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OrderHistory();
  object.dateTime = reader.readDateTime(offsets[0]);
  object.id = id;
  return object;
}

P _orderHistoryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _orderHistoryGetId(OrderHistory object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _orderHistoryGetLinks(OrderHistory object) {
  return [object.drugs];
}

void _orderHistoryAttach(
    IsarCollection<dynamic> col, Id id, OrderHistory object) {
  object.id = id;
  object.drugs.attach(col, col.isar.collection<SelectedDrug>(), r'drugs', id);
}

extension OrderHistoryQueryWhereSort
    on QueryBuilder<OrderHistory, OrderHistory, QWhere> {
  QueryBuilder<OrderHistory, OrderHistory, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension OrderHistoryQueryWhere
    on QueryBuilder<OrderHistory, OrderHistory, QWhereClause> {
  QueryBuilder<OrderHistory, OrderHistory, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<OrderHistory, OrderHistory, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<OrderHistory, OrderHistory, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<OrderHistory, OrderHistory, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<OrderHistory, OrderHistory, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension OrderHistoryQueryFilter
    on QueryBuilder<OrderHistory, OrderHistory, QFilterCondition> {
  QueryBuilder<OrderHistory, OrderHistory, QAfterFilterCondition>
      dateTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderHistory, OrderHistory, QAfterFilterCondition>
      dateTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderHistory, OrderHistory, QAfterFilterCondition>
      dateTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderHistory, OrderHistory, QAfterFilterCondition>
      dateTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OrderHistory, OrderHistory, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderHistory, OrderHistory, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderHistory, OrderHistory, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderHistory, OrderHistory, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension OrderHistoryQueryObject
    on QueryBuilder<OrderHistory, OrderHistory, QFilterCondition> {}

extension OrderHistoryQueryLinks
    on QueryBuilder<OrderHistory, OrderHistory, QFilterCondition> {
  QueryBuilder<OrderHistory, OrderHistory, QAfterFilterCondition> drugs(
      FilterQuery<SelectedDrug> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'drugs');
    });
  }

  QueryBuilder<OrderHistory, OrderHistory, QAfterFilterCondition>
      drugsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'drugs', length, true, length, true);
    });
  }

  QueryBuilder<OrderHistory, OrderHistory, QAfterFilterCondition>
      drugsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'drugs', 0, true, 0, true);
    });
  }

  QueryBuilder<OrderHistory, OrderHistory, QAfterFilterCondition>
      drugsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'drugs', 0, false, 999999, true);
    });
  }

  QueryBuilder<OrderHistory, OrderHistory, QAfterFilterCondition>
      drugsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'drugs', 0, true, length, include);
    });
  }

  QueryBuilder<OrderHistory, OrderHistory, QAfterFilterCondition>
      drugsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'drugs', length, include, 999999, true);
    });
  }

  QueryBuilder<OrderHistory, OrderHistory, QAfterFilterCondition>
      drugsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'drugs', lower, includeLower, upper, includeUpper);
    });
  }
}

extension OrderHistoryQuerySortBy
    on QueryBuilder<OrderHistory, OrderHistory, QSortBy> {
  QueryBuilder<OrderHistory, OrderHistory, QAfterSortBy> sortByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.asc);
    });
  }

  QueryBuilder<OrderHistory, OrderHistory, QAfterSortBy> sortByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.desc);
    });
  }
}

extension OrderHistoryQuerySortThenBy
    on QueryBuilder<OrderHistory, OrderHistory, QSortThenBy> {
  QueryBuilder<OrderHistory, OrderHistory, QAfterSortBy> thenByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.asc);
    });
  }

  QueryBuilder<OrderHistory, OrderHistory, QAfterSortBy> thenByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.desc);
    });
  }

  QueryBuilder<OrderHistory, OrderHistory, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<OrderHistory, OrderHistory, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension OrderHistoryQueryWhereDistinct
    on QueryBuilder<OrderHistory, OrderHistory, QDistinct> {
  QueryBuilder<OrderHistory, OrderHistory, QDistinct> distinctByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateTime');
    });
  }
}

extension OrderHistoryQueryProperty
    on QueryBuilder<OrderHistory, OrderHistory, QQueryProperty> {
  QueryBuilder<OrderHistory, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<OrderHistory, DateTime, QQueryOperations> dateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateTime');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSelectedDrugCollection on Isar {
  IsarCollection<SelectedDrug> get selectedDrugs => this.collection();
}

const SelectedDrugSchema = CollectionSchema(
  name: r'SelectedDrug',
  id: 3078177423502405644,
  properties: {
    r'drugName': PropertySchema(
      id: 0,
      name: r'drugName',
      type: IsarType.string,
    ),
    r'selectedAmount': PropertySchema(
      id: 1,
      name: r'selectedAmount',
      type: IsarType.long,
    )
  },
  estimateSize: _selectedDrugEstimateSize,
  serialize: _selectedDrugSerialize,
  deserialize: _selectedDrugDeserialize,
  deserializeProp: _selectedDrugDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _selectedDrugGetId,
  getLinks: _selectedDrugGetLinks,
  attach: _selectedDrugAttach,
  version: '3.1.0+1',
);

int _selectedDrugEstimateSize(
  SelectedDrug object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.drugName.length * 3;
  return bytesCount;
}

void _selectedDrugSerialize(
  SelectedDrug object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.drugName);
  writer.writeLong(offsets[1], object.selectedAmount);
}

SelectedDrug _selectedDrugDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SelectedDrug();
  object.drugName = reader.readString(offsets[0]);
  object.id = id;
  object.selectedAmount = reader.readLong(offsets[1]);
  return object;
}

P _selectedDrugDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _selectedDrugGetId(SelectedDrug object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _selectedDrugGetLinks(SelectedDrug object) {
  return [];
}

void _selectedDrugAttach(
    IsarCollection<dynamic> col, Id id, SelectedDrug object) {
  object.id = id;
}

extension SelectedDrugQueryWhereSort
    on QueryBuilder<SelectedDrug, SelectedDrug, QWhere> {
  QueryBuilder<SelectedDrug, SelectedDrug, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SelectedDrugQueryWhere
    on QueryBuilder<SelectedDrug, SelectedDrug, QWhereClause> {
  QueryBuilder<SelectedDrug, SelectedDrug, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SelectedDrug, SelectedDrug, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<SelectedDrug, SelectedDrug, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SelectedDrug, SelectedDrug, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SelectedDrug, SelectedDrug, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SelectedDrugQueryFilter
    on QueryBuilder<SelectedDrug, SelectedDrug, QFilterCondition> {
  QueryBuilder<SelectedDrug, SelectedDrug, QAfterFilterCondition>
      drugNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'drugName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedDrug, SelectedDrug, QAfterFilterCondition>
      drugNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'drugName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedDrug, SelectedDrug, QAfterFilterCondition>
      drugNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'drugName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedDrug, SelectedDrug, QAfterFilterCondition>
      drugNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'drugName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedDrug, SelectedDrug, QAfterFilterCondition>
      drugNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'drugName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedDrug, SelectedDrug, QAfterFilterCondition>
      drugNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'drugName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedDrug, SelectedDrug, QAfterFilterCondition>
      drugNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'drugName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedDrug, SelectedDrug, QAfterFilterCondition>
      drugNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'drugName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedDrug, SelectedDrug, QAfterFilterCondition>
      drugNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'drugName',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedDrug, SelectedDrug, QAfterFilterCondition>
      drugNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'drugName',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedDrug, SelectedDrug, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SelectedDrug, SelectedDrug, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SelectedDrug, SelectedDrug, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SelectedDrug, SelectedDrug, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SelectedDrug, SelectedDrug, QAfterFilterCondition>
      selectedAmountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'selectedAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<SelectedDrug, SelectedDrug, QAfterFilterCondition>
      selectedAmountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'selectedAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<SelectedDrug, SelectedDrug, QAfterFilterCondition>
      selectedAmountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'selectedAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<SelectedDrug, SelectedDrug, QAfterFilterCondition>
      selectedAmountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'selectedAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SelectedDrugQueryObject
    on QueryBuilder<SelectedDrug, SelectedDrug, QFilterCondition> {}

extension SelectedDrugQueryLinks
    on QueryBuilder<SelectedDrug, SelectedDrug, QFilterCondition> {}

extension SelectedDrugQuerySortBy
    on QueryBuilder<SelectedDrug, SelectedDrug, QSortBy> {
  QueryBuilder<SelectedDrug, SelectedDrug, QAfterSortBy> sortByDrugName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'drugName', Sort.asc);
    });
  }

  QueryBuilder<SelectedDrug, SelectedDrug, QAfterSortBy> sortByDrugNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'drugName', Sort.desc);
    });
  }

  QueryBuilder<SelectedDrug, SelectedDrug, QAfterSortBy>
      sortBySelectedAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedAmount', Sort.asc);
    });
  }

  QueryBuilder<SelectedDrug, SelectedDrug, QAfterSortBy>
      sortBySelectedAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedAmount', Sort.desc);
    });
  }
}

extension SelectedDrugQuerySortThenBy
    on QueryBuilder<SelectedDrug, SelectedDrug, QSortThenBy> {
  QueryBuilder<SelectedDrug, SelectedDrug, QAfterSortBy> thenByDrugName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'drugName', Sort.asc);
    });
  }

  QueryBuilder<SelectedDrug, SelectedDrug, QAfterSortBy> thenByDrugNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'drugName', Sort.desc);
    });
  }

  QueryBuilder<SelectedDrug, SelectedDrug, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SelectedDrug, SelectedDrug, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SelectedDrug, SelectedDrug, QAfterSortBy>
      thenBySelectedAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedAmount', Sort.asc);
    });
  }

  QueryBuilder<SelectedDrug, SelectedDrug, QAfterSortBy>
      thenBySelectedAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedAmount', Sort.desc);
    });
  }
}

extension SelectedDrugQueryWhereDistinct
    on QueryBuilder<SelectedDrug, SelectedDrug, QDistinct> {
  QueryBuilder<SelectedDrug, SelectedDrug, QDistinct> distinctByDrugName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'drugName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SelectedDrug, SelectedDrug, QDistinct>
      distinctBySelectedAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'selectedAmount');
    });
  }
}

extension SelectedDrugQueryProperty
    on QueryBuilder<SelectedDrug, SelectedDrug, QQueryProperty> {
  QueryBuilder<SelectedDrug, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SelectedDrug, String, QQueryOperations> drugNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'drugName');
    });
  }

  QueryBuilder<SelectedDrug, int, QQueryOperations> selectedAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'selectedAmount');
    });
  }
}
