import 'package:flexj/database/entities/table.dart';
import 'package:floor/floor.dart';

//Here, we are saying that the following class defines a dao.

@dao
abstract class UserDao {
  //Query #1: SELECT -> this allows to obtain all the entries
  @Query('SELECT * FROM table1')
  Future<List<User>> findAllUser();

  //Query #2: INSERT -> this allows to add an user in  table1
  @insert
  Future<void> insertUser(User user);

  //Query #3: DELETE -> this allows to delete an user from table 1
  @delete
  Future<void> deleteUser(User user);

  //Query #4: UPDATE -> this allows to update a entry
  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateUser(User user);
}
