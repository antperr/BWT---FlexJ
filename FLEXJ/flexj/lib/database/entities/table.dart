import 'dart:ffi';
import 'package:floor/floor.dart';

// Table1 contain all the information about the user that can login in the app
@entity
class User {
  //id will be the primary key of the table. Moreover, it will be autogenerated.
  //id is nullable since it is autogenerated.
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String name;

  final String email;

  final String pw;

  //Default constructor
  User(this.id, this.name, this.email, this.pw);
} //table 1

// class Data {
//   //id will be the primary key of the table. Moreover, it will be autogenerated.
//   //id is nullable since it is autogenerated.
//   @PrimaryKey(autoGenerate: true)
//   final int? id2;

//   final DateTime giorno;

//   final int? steps; // numero di passi

//   final int? bpm; // frequenza cardiaca media

//   final int? sleep; // ore di sonno

//   final int? cal; // calorie giornaliere

//   final Bool obiettivo; // obiettivo raggiunto : SI/NO

//   final int? peso; // peso user

//   final int? altezza; // altezza user

//   final int? bmi; //BMI user

//   //Default constructor
//   Data(this.id2, this.giorno, this.steps, this.bpm, this.altezza, this.bmi,
//       this.cal, this.obiettivo, this.peso, this.sleep);
// }//table 2

@Entity(
  tableName: 'Data',
  foreignKeys: [
    ForeignKey(
      childColumns: ['index'],
      parentColumns: ['id'],
      entity: User,
    )
  ],
)
class Data {
  @PrimaryKey()
  final DateTime giorno;

  final int? steps; // numero di passi

  final int? bpm; // frequenza cardiaca media

  final int? sleep; // ore di sonno

  final int? cal; // calorie giornaliere

  final bool obiettivo; // obiettivo raggiunto : SI/NO

  final int? peso; // peso user

  final int? altezza; // altezza user

  final int? bmi; //BMI user

  @ColumnInfo(name: 'index')
  final int index;

  //Default constructor
  Data(this.index, this.giorno, this.steps, this.bpm, this.altezza, this.bmi,
      this.cal, this.obiettivo, this.peso, this.sleep);
} //table 2

