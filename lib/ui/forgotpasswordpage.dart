import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:testbank/constant.dart';
import 'package:testbank/manager/cache_manager.dart';
import 'package:testbank/modal/usermodal.dart';
import 'package:testbank/ui/widgets/toast.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key, required this.model}) : super(key: key);
  final ICacheManager<UserModel> model;

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
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
                    "Şifremi Unuttum",
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
                  SizedBox(height: 24),
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      EToast().showMessage(
                          Toast.LENGTH_SHORT, "Şifreniz için mail gönderildi");
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.blueGrey.withOpacity(.8)),
                      child: Center(
                        child: Text(
                          "Şifremi Unuttum",
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
