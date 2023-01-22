import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  initialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'handinhand.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) {
    print("onUpgrade=================");
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
     CREATE TABLE "familydatas2" (
      "studentIdCard" INTEGER NOT NULL PRIMARY KEY,
      "userId" INTEGER NOT NULL,
      "relativeRelation" TEXT,
      "name" TEXT,
      "idNumber" INTEGER,
      "workPlace" TEXT,
      "job" TEXT,
      "note" TEXT
     )
    ''');

    await db.execute('''
    CREATE TABLE "familydatas1" (
  "studentIdCard" INTEGER NOT NULL PRIMARY KEY,
  "studentName" TEXT NOT NULL,
  "studentNumber" INTEGER NOT NULL,
  "fatherName" TEXT NOT NULL,
  "fatherIdCard" INTEGER NOT NULL,
  "fatherCareerStatus" TEXT NOT NULL,
  "fatherWorkPlace" TEXT NOT NULL,
  "fatherJob" TEXT NOT NULL,
  "fatherWorkNature" TEXT NOT NULL,
  "fatherJobDesc" TEXT NOT NULL,
  "motherName" TEXT NOT NULL,
  "motherIdCard" INTEGER NOT NULL,
  "motherCareerStatus" TEXT NOT NULL,
  "motherWorkPlace" TEXT NOT NULL,
  "motherJob" TEXT NOT NULL,
  "motherWorkNature" TEXT NOT NULL,
  "motherJobDesc" TEXT NOT NULL,
  "hwName" TEXT DEFAULT NULL,
  "hwIdCard" INTEGER DEFAULT NULL,
  "hwCareerStatus" TEXT DEFAULT NULL,
  "hwWorkPlace" TEXT DEFAULT NULL,
  "hwJob" TEXT DEFAULT NULL,
  "hwWorkNature" TEXT DEFAULT NULL,
  "hwJobDesc" TEXT,
  "studentSocialSit" TEXT NOT NULL,
  "parentsSocialSit" TEXT NOT NULL,
  "userId" INTEGER NOT NULL
) 
    ''');

    await db.execute('''
    CREATE TABLE "familydatas3" (

  "studentIdCard" INTEGER NOT NULL,
  "userId" INTEGER NOT NULL,
  "numFamilyMem" INTEGER NOT NULL,
  "numMemDiseases" INTEGER NOT NULL,
  "familyIncome" TEXT NOT NULL,
  "familyAssistance" TEXT NOT NULL,
  "cardNumber" INTEGER DEFAULT NULL,
  "familyHousing" TEXT NOT NULL,
  "monthlyRent" TEXT NULL,
  "familyResidence" TEXT NOT NULL,
  "numPrivate" INTEGER NOT NULL,
  "numPublic" INTEGER NOT NULL,
  "numCommercial" INTEGER NOT NULL,
  "studentHousingFee" INTEGER DEFAULT NULL,
  "smoke" TEXT NOT NULL,
  "numUniversityStu" INTEGER NOT NULL

) 
    ''');

    await db.execute('''
    CREATE TABLE "brothersdata" (
  "userId" INTEGER NOT NULL,
  "userIdCard" INTEGER NOT NULL,
  "BrotherId" INTEGER NOT NULL,
  "StudentName" TEXT NOT NULL,
  "RegistrationNumber" INTEGER NOT NULL,
  "CollegeName" TEXT NOT NULL,
  "UniversityName" TEXT NOT NULL
) 
    ''');

    await db.execute('''
    CREATE TABLE "person_info" (
  "id" INTEGER NOT NULL,
  "email" TEXT NOT NULL,
  "fname" TEXT NOT NULL,
  "birthdate" INTEGER NOT NULL,
  "birthplace" TEXT NOT NULL,
  "city" TEXT NOT NULL,
  "income" TEXT NOT NULL,
  "gender" TEXT NOT NULL,
  "socialstatus" TEXT NOT NULL

) 
    ''');

    await db.execute('''
    CREATE TABLE "contact_info" (
  "id" INTEGER NOT NULL,
  "tphone" INTEGER NOT NULL,
  "mphone" INTEGER NOT NULL,
  "email" TEXT NOT NULL
) 
    ''');

    await db.execute('''
    CREATE TABLE "edu_info" (
  "id" INTEGER NOT NULL,
  "schoolyoe" INTEGER NOT NULL,
  "school" TEXT NOT NULL,
  "grade" REAL NOT NULL,
  "branch" TEXT NOT NULL,
  "unidegree" TEXT NOT NULL,
  "university" TEXT NOT NULL,
  "college" TEXT NOT NULL,
  "department" TEXT NOT NULL,
  "academicyear" TEXT NOT NULL,
  "gpa" REAL NOT NULL,
  "uniid" INTEGER NOT NULL,
  "uniyoe" INTEGER NOT NULL,
  "email" TEXT NOT NULL
) 
    ''');

    print("_onCreate================== ================");
  }

  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

  mydeleteDatabase() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'handinhand.db');
    await deleteDatabase(path);
  }
}