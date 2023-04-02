import 'dart:convert';
import 'SUB_DATA_MODAL_DASHBOARD/_data_modal_Aashboard.dart';



List<DataModalAashboard> dataModalAashboardFromJson(String str) =>
    List<DataModalAashboard>.from(
    json.decode(str).map((x) => DataModalAashboard.fromJson(x)));

String dataModalAashboardToJson(List<DataModalAashboard> data) =>
    json.encode(List<dynamic>.from(
        data.map((x) => x.toJson())));


