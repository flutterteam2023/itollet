///Profil ikonları ve ikonlara tıklandığında gidilen sayfalardaki ikonlar firebase storage'dan gelmektedir.
///ikonu değiştirmek için
///1- firebase storage daki değiştirilcek ikonun adının kopyalayın
///2- yeni ikonun adını kopyaladığınız ikon adıyla değiştirin
///3- değiştirilecek ikonu firebase storage den silin
///4- adını değiştirdiğiniz yeni ikonu firebase storage da sildiğiniz ikonun olduğu dizine yükleyin
///
///Örneğin cuzdanim.png yi değiştireceksiniz.
///elinizde wallet.png diye bir ikon görseli var.
///öncelikle wallet.png adını cuzdanim.png ile değiştirin
///firebase deki eski cuzdanim.png yi silin
///sildiğiniz konuma yeni cuzdanin.png yi yükleyin.
class ProfileIcons {
  static String wallet =
      "https://firebasestorage.googleapis.com/v0/b/itollet.appspot.com/o/profile-icons%2Fcuzdanim.png?alt=media&token=a96a55b8-4913-461c-a92a-af7f28181446";
  static String privacy =
      "https://firebasestorage.googleapis.com/v0/b/itollet.appspot.com/o/profile-icons%2Fgizlilik.png?alt=media&token=f7469d0d-a2ae-47d3-befe-5ab68a7351dc";
  static String myPosts =
      "https://firebasestorage.googleapis.com/v0/b/itollet.appspot.com/o/profile-icons%2Filanlarim.png?alt=media&token=ea34e5a1-d4f2-4ffa-b3b9-295deb0e6915";
  static String logout =
      "https://firebasestorage.googleapis.com/v0/b/itollet.appspot.com/o/profile-icons%2Foturumu-sonlandir.png?alt=media&token=ca60e713-c670-41fa-a488-86e2ed0919fe";
  static String help =
      "https://firebasestorage.googleapis.com/v0/b/itollet.appspot.com/o/profile-icons%2Fyardim.png?alt=media&token=e966f098-3f20-46f1-a376-113eb6152e05";
}

class WalletIcons {
  static String balance =
      "https://firebasestorage.googleapis.com/v0/b/itollet.appspot.com/o/profile-icons%2Fwallet-icons%2Fbakiye.png?alt=media&token=aae9578a-7b25-49ed-816d-c6382f052b7b";
  static String addBalance =
      "https://firebasestorage.googleapis.com/v0/b/itollet.appspot.com/o/profile-icons%2Fwallet-icons%2Fbakiye-yukle.png?alt=media&token=389418bf-153c-48f5-a931-09ed24637cd5";
  static String accountActivities =
      "https://firebasestorage.googleapis.com/v0/b/itollet.appspot.com/o/profile-icons%2Fwallet-icons%2Fhesap-hareketleri.png?alt=media&token=f4601213-f62b-432b-9cc7-ca7065dc4091";
}

class PrivacyIcons {
  static String privacy =
      "https://firebasestorage.googleapis.com/v0/b/itollet.appspot.com/o/profile-icons%2Fprivacy-icons%2Fgizlilik-politikasi.png?alt=media&token=7c552d2c-5523-401a-af23-11d1a844b9ae";
  static String user =
      "https://firebasestorage.googleapis.com/v0/b/itollet.appspot.com/o/profile-icons%2Fprivacy-icons%2Fkullanici-sozlesmesi.png?alt=media&token=6d5eb6bc-16bd-4fe4-a1ed-7325f8afd05f";
  static String delete =
      "https://firebasestorage.googleapis.com/v0/b/itollet.appspot.com/o/profile-icons%2Fprivacy-icons%2Fhesabimi-sil.png?alt=media&token=e71df695-3e0c-4efc-9f94-977030d8a951";
}

class HelpIcons {
  static String general =
      "https://firebasestorage.googleapis.com/v0/b/itollet.appspot.com/o/profile-icons%2Fhelp-icons%2Fgenel.png?alt=media&token=6c16d6a7-f076-45e1-970f-800922731cdf";
  static String password =
      "https://firebasestorage.googleapis.com/v0/b/itollet.appspot.com/o/profile-icons%2Fhelp-icons%2Fgiris-ve-sifre.png?alt=media&token=22a251bd-1bea-4bba-8638-30aa8efc8696";
  static String deleteAccount =
      "https://firebasestorage.googleapis.com/v0/b/itollet.appspot.com/o/profile-icons%2Fhelp-icons%2Fhesap-silme.png?alt=media&token=3eb43db2-0e18-4682-8e45-c793cac80d20";
  static String postProcesses =
      "https://firebasestorage.googleapis.com/v0/b/itollet.appspot.com/o/profile-icons%2Fhelp-icons%2Filan-surecleri.png?alt=media&token=d2bc7a95-0ca4-424d-bd31-a2d935a5599c";
  static String contact =
      "https://firebasestorage.googleapis.com/v0/b/itollet.appspot.com/o/profile-icons%2Fhelp-icons%2Filetisim.png?alt=media&token=3682807f-e79c-411e-a99f-c97f1bfe884b";
  static String payment =
      "https://firebasestorage.googleapis.com/v0/b/itollet.appspot.com/o/profile-icons%2Fhelp-icons%2Fodeme-iade.png?alt=media&token=6c4af57b-ba7b-4bc3-87b8-fdcd183bc62f";
}
