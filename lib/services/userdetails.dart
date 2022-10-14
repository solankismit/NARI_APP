import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'authservices.dart';
late User currentuser;

class Guardian{
  var name = '';
  var phone_no = '';
  var relation='';
  Guardian({required this.name,required this.phone_no});
}

Guardian g1 = Guardian(name: 'name', phone_no: 'phone_no');
class User {
  final String? name;
  final String? uid;
  List<Guardian> guardians=[] ;
  User( {
    this.name,
    this.uid, required dynamic guardians
  }){
    guardians.forEach(
            (element) =>
            {
              this.guardians.add(Guardian(
                name: element['name'],
                phone_no: element['phone_no']
              ))
            }
            );
  }

factory User.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,) {
    final data = snapshot.data();
    return User(
        name: data?['name'],
        uid: data?['uid'],
      guardians:data?['guardians']
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
    };
  }
}


Future<bool> isUserExists() async{
  var db = FirebaseFirestore.instance;
  var u = FirebaseAuth.instance.currentUser;
  if(db.collection('nari').doc(u?.uid).get() == null){
    return true;
  }
  else{
    return false;
  }
}

Future<void> getUser() async{
  var db = FirebaseFirestore.instance;
  var u = FirebaseAuth.instance.currentUser;
  final ref = db.collection("nari").doc(u?.uid).withConverter(
    fromFirestore: User.fromFirestore,
    toFirestore: (User user, _) => user.toFirestore(),
  );
  final docSnap =   await ref.get();
  final user = docSnap.data();
  currentuser = user!;
  print(currentuser.guardians);
  // return currentuser;
}

void RegisterUser(){
//TODO: IMPLEMENTATION OF REGISTERATION
}


Future<void> getnextRoute({required String name,required String guardian_name,required String guardian_number,}) async{
  final ref = FirebaseFirestore.instance.collection("nari").doc(AuthService().user!.uid).withConverter(
    fromFirestore: User.fromFirestore,
    toFirestore: (User user, _) => user.toFirestore(),
  );
  final docSnap = await ref.get();
  // ref.set()
  final user = docSnap.data();
  await FirebaseFirestore.instance.collection('nari').doc(await AuthService().user!.uid).set({
    'uid' : AuthService().user!.uid,
    'name' : name,
    'phone_no': AuthService().user!.phoneNumber,
    'guardians' : [{
      'name' : guardian_name,
      'phone_no': guardian_number,
    }],
    'birthdate' : DateTime.utc(2003,4,27)
  });
  if(user != null){
    print("Has Some Values \n${user.name}");
  }
  else{
    print("No Values Available");
  }
}