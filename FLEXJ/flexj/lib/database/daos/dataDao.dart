import 'package:flexj/database/entities/table.dart';
import 'package:floor/floor.dart';

@dao
abstract class DataDao {
  //Query #1: SELECT -> this allows to obtain the max value for calories and steps
  @Query('SELECT MAX(cal) FROM data')
  Future<void> findMaxCal();

  @Query('SELECT MAX(steps) FROM data')
  Future<void> findMaxSteps();

  @insert
  Future<void> insertdata(Data data);

  @delete
  Future<void> deletedata(Data data);

  //Query #4: UPDATE -> this allows to update a entry
  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updatedata(Data data);
}
