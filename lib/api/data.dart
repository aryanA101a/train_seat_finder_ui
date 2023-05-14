//dummy data
/* 
//naming convention
1AC:H1
2AC:A1
3AC:B1
SL:S1

*/
import 'dart:convert';

final jsonData = json.decode('''
    {
      "data": {
        "train_number": "12345",
        "train_name": "Express",
        "AC1": {
          "carriages": 2,
          "seats": 24
        },
        "AC2": {
          "carriages": 3,
          "seats": 54
        },
        "AC3": {
          "carriages": 5,
          "seats": 64
        },
        "SL": {
          "carriages": 7,
          "seats": 80
        }
      }
    }
  ''');


