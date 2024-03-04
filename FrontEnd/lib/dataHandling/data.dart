class UserData {
  static String firstName = '';
  static String lastName = '';
  static String petName = '';
  static String petType = '';
  static String gender = '';
  static String email = '';
  static String mobileNumber = '';
  static String password = '';

  static void displayUserData() {
    print('First Name: $firstName');
    print('Last Name: $lastName');
    print('Pet Name: $petName');
    print('Pet Type: $petType');
    print('Gender: $gender');
    print('Email: $email');
    print('Mobile Number: $mobileNumber');
    print('Password: $password');
  }
}

void main() {


  UserData.displayUserData();
}
