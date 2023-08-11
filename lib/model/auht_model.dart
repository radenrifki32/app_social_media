class Register {
  final String message;
  Register({required this.message});
  factory Register.fromJson(Map<String,dynamic> json){
    return Register(message: json["message"]);
  }
}

class Login {
  final String username;
  final String email;
  final String accessToken; 
  
  Login({required this.username, required this.email, required this.accessToken});
  
  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      username: json["username"],
      email: json["email"],
      accessToken: json["access_token"], 
    );
  }
}

