class VetData {

  static String fullName = '';
  static String addressClinic = '';
  static String fieldOfExpertise = '';
  static String email = '';
  static String password = '';
  static String mobileNumber = '';
  static String clinicName = '';


  static void displayVetData() {
    print('Full Name: $fullName');
    print('Address of the Clinic: $addressClinic');
    print('Field of Expertise: $fieldOfExpertise');
    print('Email: $email');
    print('Password: $password');
    print('Mobile Number: $mobileNumber');
    print('Name of the Clinic: $clinicName');

  }
}

void main() {


  VetData.displayVetData();
}
