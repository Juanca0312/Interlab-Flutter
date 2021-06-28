class Student{
  int userId;
  String username;
  String password;
  int profileId;
  String firstName;
  String lastName;
  String field;
  String role;
  String phone;
  String email;
  String description;
  String country;
  String city;
  String university;
  String degree;
  int semester;

  Student(
      this.userId,
      this.username,
      this.password,
      this.profileId,
      this.firstName,
      this.lastName,
      this.field,
      this.role,
      this.phone,
      this.email,
      this.description,
      this.country,
      this.city,
      this.university,
      this.degree,
      this.semester);

  Student.empty();
}