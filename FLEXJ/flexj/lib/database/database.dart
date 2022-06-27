import 'dart:async';
import 'package:floor/floor.dart';
import 'typeConverter/dateTimeConverter.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

//Here, we are importing the entities and the daos of the database
import 'daos/dataDao.dart';
import 'daos/userDao.dart';
import 'entities/table.dart';

//The generated code will be in database.g.dart

part 'database.g.dart';

//Here we are saying that this is the first version of the Database and it has just 2 entity
//We also added a TypeConverter to manage the DateTime of a entry, since DateTimes are not natively
//supported by Floor.
@TypeConverters([DateTimeConverter])
@Database(version: 1, entities: [User, Data])
abstract class AppDatabase extends FloorDatabase {
  //Add all the daos as getters here
  DataDao get dataDao;
  UserDao get userDao;
}//AppDatabase
