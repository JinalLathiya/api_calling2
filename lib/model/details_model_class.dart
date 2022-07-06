class Details {
  final String FName;
  final String LName;
  final int age;
  final String City;
  final String img;
  final String dob;
  final String gender;
  final String Pnumber;
  final String email;

  Details({
    required this.FName,
    required this.LName,
    required this.age,
    required this.City,
    required this.img,
    required this.dob,
    required this.gender,
    required this.Pnumber,
    required this.email,
  });

  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
      FName: json["results"][0]["name"]["first"],
      LName: json["results"][0]["name"]["last"],
      age: json["results"][0]["dob"]["age"],
      City: json["results"][0]["location"]["city"],
      img: json["results"][0]["picture"]["large"],
      dob: json["results"][0]["dob"]["date"],
      gender: json["results"][0]["gender"],
      Pnumber: json["results"][0]["phone"],
      email: json["results"][0]["email"],
    );
  }
}
