enum motor {
  // penggunaan class boleh menggunakan huruf besar, dengan sayarat pengimplementasiannya harus sesuai
  nmax, // |
  jupiter, // |
  supra, // | -> value harus diawali dengan huruf kecil
  mio, // |
  vespa, // |
}

void main() {
  // ENUM
  var motorKita = motor.nmax;
  if (motorKita == motor.nmax) {
    print("Motor NMAX");
  } else if (motorKita == motor.jupiter) {
    print("Motor Jupiter");
  } else if (motorKita == motor.supra) {
    print("Motor Supra");
  } else if (motorKita == motor.mio) {
    print("Motor Mio");
  } else if (motorKita == motor.vespa) {
    print("Motor Vespa");
  } else {
    print("Tidak diketahui");
  }
  // Enum -> bool(boolean) -> data cuma 2 -> kondisi treu / false

  // bool isMale = true;

  // if (isMale == true) {
  //   print("Dia Laki-Laki");
  // } else {
  //   print("Dia Perempuan");
  // }

  // Enum ->int -> bisa banyak data
  // 0 : Laki-Laki
  // 1 : Perempuan
  // Selain 0 & 1 : Tidak diketahui

  // int jk = 0;
  // if (jk == 0) {
  //   print("Dia Laki-Laki");
  // } else if (jk == 1) {
  //   print("Dia Perempuan");
  // } else {
  //   print("Tidak diketahui");
  // }

  // Enum ->int -> bisa banyak data
  // 0 : NMAX
  // 1 : Jupiter
  // 2 : Supra
  // 3 : MIO

  // int motor = 0;
  // if (motor == 0) {
  //   print("Motor NMAX");
  // } else if (motor == 1) {
  //   print("Motor Jupiter");
  // } else if (motor == 2) {
  //   print("Motor Supra");
  // } else if (motor == 3) {
  //   print("Motor Mio");
  // } else {
  //   print("Tidak diketahui");
  // }
}
