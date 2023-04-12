import 'package:flutter/material.dart';

import 'package:postgres/postgres.dart';








Future<void> dbConnections(String companyName, String state, String city,String address,String contact,String email) async {
final conn = PostgreSQLConnection('localhost', 5432, 'myfirstpostgresDB',username:'postgres',password:'Jas@lisa27');





  try {
    await conn.open();
    final insert=await conn.query('INSERT INTO Customer_CS(ID,COMPANY_NAME,STATE,CITY,ADDRESS,CONTACT,EMAIL) VALUES (4,\'$companyName\',\'$state\',\'$city\',\'$address\',\'$contact\',\'$email\')');
    // print(result);
    // for (final row in result) {
    //   print(row.toString());
    // }

  } catch (e) {
    print('Error performing database query: $e');
  } finally {
    await conn.close();
  }

}



Future<List<String>> getDATA() async {
final conn = PostgreSQLConnection('localhost', 5432, 'myfirstpostgresDB',username:'postgres',password:'Jas@lisa27');

final rows = <String>[];



  try {
    await conn.open();
    final result = await conn.query('SELECT * FROM customer_cs');
        for (final row in result) {
          rows.add(row.toString());
    }

  } catch (e) {
    print('Error performing database query: $e');
  } finally {
    await conn.close();
  }
return rows;
}

