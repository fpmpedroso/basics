import 'package:sqflite/sqflite.dart';

//todas as atualizações implementam essa interface

abstract class Migration {
  void create(Batch batch);
  void update(Batch batch);
}
