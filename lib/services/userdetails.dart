class User{
  var name = '';
  var age = '';
  var aadhar_number ='';
  List<Guardian> guardians = [];

  User({required this.name, required this.age, required this.aadhar_number, guardian}){
    guardians.add(guardian);
  }
  void addUser(name,age,aadhar_number,guardian){
    this.name = name;
    this.age = age;
    this.aadhar_number = aadhar_number;
    this.guardians.add(guardian);
  }
}

class Guardian{
  var name = '';
  var phone_no = '';
  var relation='';
  Guardian({required this.name,required this.phone_no});
}