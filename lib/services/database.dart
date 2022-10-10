import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';

const MONGO_CONN_URL = 'mongodb+srv://NARI:Brrainstormers@8@cluster1.ewv3o4j.mongodb.net/NARI ?retryWrites=true&w=majority';
const USER_COLLECTION1 = "User";
const USER_COLLECTION2 = "Guardian";


class MongoDb{
  static var db,collection1,collection2;
  static connect() async{
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    collection1 = db.collection(USER_COLLECTION1);
    collection2 = db.collection(USER_COLLECTION2);
    print(collection1);

  }
}