import 'package:flexj/database/database.dart';
import 'package:flexj/database/entities/table.dart';
import 'package:flutter/material.dart';

class DatabaseRepository extends ChangeNotifier {
  //The state of the database is just the AppDatabase
  final AppDatabase database;

  //Default constructor
  DatabaseRepository({required this.database});

  //This method wraps the findAllTodos() method of the DAO
  Future<List<User>> findAllUser() async {
    final results = await database.userDao.findAllUser();
    return results;
  } //findAllTodos

  //This method wraps the insertTodo() method of the DAO.
  //Then, it notifies the listeners that something changed.
  Future<void> insertUser(User user) async {
    await database.userDao.insertUser(user);
    notifyListeners();
  } //insertTodo

  //This method wraps the deleteTodo() method of the DAO.
  //Then, it notifies the listeners that something changed.
  Future<void> removeUser(User user) async {
    await database.userDao.deleteUser(user);
    notifyListeners();
  } //removeTodo

  //This method wraps the updateUser() method of the DAO.
  //Then, it notifies the listeners that something changed.
  Future<void> updateUser(User user) async {
    await database.userDao.updateUser(user);
    notifyListeners();
  }
} //DatabaseRepository




// if I have 2 DAOs there I want a list of all the methods
