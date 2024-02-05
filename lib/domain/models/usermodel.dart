class UserModel {
  String? name;
  String? phoneNo;
  String email;
  String? employeeId;
  String? role;
  String? password;

  UserModel(
      {this.name,
       this.phoneNo,
      this.employeeId,
      this.role,
      required this.email,
       this.password});

       @override
  String toString() {
    
    return "$name ,$role";
  }
}
