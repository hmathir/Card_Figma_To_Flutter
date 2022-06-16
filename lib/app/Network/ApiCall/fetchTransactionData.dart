import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:softcent_card/app/modules/home/model/transaction_model.dart';

class TransactionDataAPI {

  Dio dio = Dio();

  Future<List<Transactions>?> getTransactionData() async {
    String url = 'https://mocki.io/v1/4572d649-fda0-4c84-991d-08ba0961205d';

    try {
      Response response = await dio.get(url);
      TransactionModel transactionModel = TransactionModel.fromJson(response.data);
      return transactionModel.data?.transactions;
    } on DioError catch (exception) {
      debugPrint(exception.toString());
    }
    return null;
  }
}