import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:testbank/constant.dart';
import 'package:testbank/manager/cache_manager.dart';
import 'package:testbank/modal/usermodal.dart';
import 'package:testbank/ui/widgets/toast.dart';

class CreateNewAccount extends StatefulWidget {
  const CreateNewAccount({Key? key, required this.model}) : super(key: key);
  final ICacheManager<UserModel> model;
  @override
  _CreateNewAccountState createState() => _CreateNewAccountState();
}

enum Gender { Erkek, Kadin }

class _CreateNewAccountState extends State<CreateNewAccount> {
  late TextEditingController username;
  late TextEditingController mail;
  late TextEditingController password;
  late TextEditingController password1;
  late TextEditingController gender;
  late DateTime birth = DateTime.now();
  Gender? _character = Gender.Erkek;
  String dateBirth = "Doğum Tarihi";
  @override
  void initState() {
    username = new TextEditingController();
    mail = new TextEditingController();
    password = new TextEditingController();
    password1 = new TextEditingController();
    gender = new TextEditingController();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: AppColors.whiteGrey,
                                size: 38,
                              ),
                            ),
                            Image.asset(
                              "assets/logo.png",
                              height: 38,
                              width: 90,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    "Kayıt Ol",
                    style: TextStyle(
                        color: AppColors.whiteGrey,
                        decoration: TextDecoration.underline,
                        fontSize: AppFonst.bigSize * 1.21),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                      child: TextFormField(
                        controller: username,
                        decoration: new InputDecoration(
                          labelText: "Kullanıcı Adı",
                          labelStyle: TextStyle(
                              fontSize: AppFonst.mediumSize,
                              fontWeight: FontWeight.w500,
                              color: AppColors.whiteGrey),
                          border: InputBorder.none,
                          fillColor: AppColors.whiteGrey,
                          focusColor: AppColors.whiteGrey,
                          contentPadding: EdgeInsets.only(left: 10),
                          prefixIcon: Icon(
                            Icons.account_box,
                            color: AppColors.whiteGrey,
                            size: AppFonst.bigSize,
                          ),
                        ),
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                      child: TextFormField(
                        controller: mail,
                        decoration: new InputDecoration(
                          labelText: "Mail",
                          labelStyle: TextStyle(
                              fontSize: AppFonst.mediumSize,
                              fontWeight: FontWeight.w500,
                              color: AppColors.whiteGrey),
                          border: InputBorder.none,
                          fillColor: AppColors.whiteGrey,
                          focusColor: AppColors.whiteGrey,
                          contentPadding: EdgeInsets.only(left: 10),
                          prefixIcon: Icon(
                            Icons.account_box,
                            color: AppColors.whiteGrey,
                            size: AppFonst.bigSize,
                          ),
                        ),
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                      child: TextFormField(
                        controller: password,
                        decoration: new InputDecoration(
                          labelText: "Şifre",
                          labelStyle: TextStyle(
                              fontSize: AppFonst.mediumSize,
                              fontWeight: FontWeight.w500,
                              color: AppColors.whiteGrey),
                          border: InputBorder.none,
                          fillColor: AppColors.whiteGrey,
                          focusColor: AppColors.whiteGrey,
                          contentPadding: EdgeInsets.only(left: 10),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: AppColors.whiteGrey,
                            size: AppFonst.bigSize,
                          ),
                        ),
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                      child: TextFormField(
                        controller: password1,
                        decoration: new InputDecoration(
                          labelText: "Şifre(Tekrar)",
                          labelStyle: TextStyle(
                              fontSize: AppFonst.mediumSize,
                              fontWeight: FontWeight.w500,
                              color: AppColors.whiteGrey),
                          border: InputBorder.none,
                          fillColor: AppColors.whiteGrey,
                          focusColor: AppColors.whiteGrey,
                          contentPadding: EdgeInsets.only(left: 10),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: AppColors.whiteGrey,
                            size: AppFonst.bigSize,
                          ),
                        ),
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    height: 40,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: RadioListTile<Gender>(
                            selectedTileColor: Colors.white,
                            title: const Text(
                              'Erkek',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.whiteGrey),
                            ),
                            value: Gender.Erkek,
                            groupValue: _character,
                            onChanged: (Gender? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<Gender>(
                            title: const Text(
                              'Kadın',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.whiteGrey),
                            ),
                            value: Gender.Kadin,
                            groupValue: _character,
                            onChanged: (Gender? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 18),
                  Row(children: [
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          showDatePicker(
                                  builder: (context, child) {
                                    return Theme(
                                        data: Theme.of(context).copyWith(
                                          colorScheme: ColorScheme.light(
                                            primary: Colors.grey
                                                .shade800, // header background color
                                            onPrimary: Colors
                                                .white, // header text color
                                            onSurface:
                                                Colors.black, // body text color
                                          ),
                                          textButtonTheme: TextButtonThemeData(
                                            style: TextButton.styleFrom(
                                              primary: Colors
                                                  .deepPurpleAccent, // button text color
                                            ),
                                          ),
                                        ),
                                        child: child!);
                                  },
                                  initialDatePickerMode: DatePickerMode.day,
                                  // locale: const Locale("tr", "TR"),
                                  context: context,
                                  initialDate: DateTime(1992),
                                  firstDate: DateTime(1905),
                                  lastDate: DateTime(2010))
                              .then((value) => setState(() {
                                    if (value != null) {
                                      FocusScope.of(context).unfocus();
                                      birth = value;
                                      dateBirth = value.day.toString() +
                                          "-" +
                                          value.month.toString() +
                                          "-" +
                                          value.year.toString();
                                    }
                                  }));
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(16)),
                          child: Center(
                            child: TextFormField(
                              enabled: false,
                              decoration: new InputDecoration(
                                labelText: dateBirth,
                                labelStyle: TextStyle(
                                    fontSize: AppFonst.mediumSize,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                                border: InputBorder.none,
                                fillColor: Colors.white,
                                focusColor: Colors.white,
                                contentPadding: EdgeInsets.only(left: 10),
                                prefixIcon: Icon(
                                  Icons.date_range,
                                  color: Colors.white,
                                  size: AppFonst.bigSize,
                                ),
                              ),
                              keyboardType: TextInputType.name,
                              style: TextStyle(
                                color: AppColors.whiteGrey,
                                fontSize: AppFonst.bigSize,
                              ),
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(height: 24),
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();

                      if (username.text.trim().isEmpty) {
                        EToast().showMessage(
                            Toast.LENGTH_SHORT, "Kullanıcı adı boş geçilemez");
                        return;
                      }
                      if (mail.text.trim().isEmpty) {
                        EToast().showMessage(
                            Toast.LENGTH_SHORT, "Kullanıcı mail boş geçilemez");
                        return;
                      }
                      if (password.text.trim().isEmpty) {
                        EToast().showMessage(
                            Toast.LENGTH_SHORT, "Şifre alanı boş geçilemez");
                        return;
                      }
                      if (password.text.trim().toString() !=
                          password1.text.trim().toString()) {
                        EToast().showMessage(
                            Toast.LENGTH_SHORT, "Şifreler Eşleşmiyor");
                        return;
                      }
                      if (dateBirth == "Doğum Tarihi") {
                        EToast().showMessage(
                            Toast.LENGTH_SHORT, "Doğum tarihi Seçiniz");
                        return;
                      }
                      var listesi = widget.model.getValues();
                      for (var i = 0; i < listesi!.length; i++) {
                        if (mail.text.trim() == listesi[i].email) {
                          EToast().showMessage(Toast.LENGTH_SHORT,
                              "Bu maili ile kayıt yapılmış");
                          return;
                        }
                      }
                      final user = UserModel()
                        ..id = 0
                        ..username = username.text.toString()
                        ..gender = "erkek"
                        ..password = password.text.toString()
                        ..date = birth
                        ..gender = _character.toString()
                        ..email = mail.text.toString();
                      List<UserModel> liste = [];
                      liste.add(user);
                      widget.model.addItems(liste);
                      EToast()
                          .showMessage(Toast.LENGTH_SHORT, "Kayıt Başarılı");
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.blueGrey.withOpacity(.8)),
                      child: Center(
                        child: Text(
                          "Kayıt Ol",
                          style: TextStyle(
                              color: AppColors.whiteGrey,
                              fontSize: AppFonst.bigSize,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
