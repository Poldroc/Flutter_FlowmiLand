//结果数据类型
class FilterBarResult {
  final String locationId;
  final String areaId;
  final String typeId;
  final List<String> moreIds;

  FilterBarResult({required this.locationId, required this.areaId, required this.typeId, required this.moreIds});


}

//通用类型
class GeneralType{
  final String name;
  final String id;

  GeneralType(this.name, this.id);
}

List<GeneralType>? locationList = [
 GeneralType('区域1','33'),
 GeneralType('区域2','44'),
];

List<GeneralType>? areaList = [
 GeneralType('面积1','55'),
 GeneralType('面积2','66'),
];
List<GeneralType>? typeList = [
  GeneralType('农用地','666'),
  GeneralType('建筑用地' ,'777'),
  GeneralType('未利用地','888')
];

List<GeneralType>? priceList = [
  GeneralType('价格1', '11'),
  GeneralType('价格2', "22"),
  GeneralType('价格3', "33"),
];
List<GeneralType>? ageLimitList = [
  GeneralType('年限1', "44"),
  GeneralType('年限2', "55"),
];