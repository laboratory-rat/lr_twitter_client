import 'dart:convert';

import 'package:intl/intl.dart';

abstract class ITwitterDataBase{
    DateTime parseTwitterDateTime(String dateTime){
        if(dateTime.isEmpty) return null;

        var list = dateTime.split(' ');
        list.removeWhere((x) => x.startsWith('+') || x.startsWith('-'));
        var d = list.join(' ');

        var formatter = new DateFormat('E LLL d HH:mm:ss y');
        return formatter.parse(d);
    }

    void decodeString(String source){
        var map = JSON.decode(source);
        decode(map);
    }

    void decode(Map map);
    Map encode();
}