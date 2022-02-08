import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:testbank/constant.dart';
import 'package:testbank/manager/cache_manager.dart';
import 'package:testbank/modal/usermodal.dart';
import 'package:testbank/ui/createnewaccount.dart';
import 'package:testbank/ui/forgotpasswordpage.dart';
import 'package:testbank/ui/homepage.dart';
import 'package:testbank/ui/widgets/toast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final ICacheManager<UserModel> cacheManager;
  late TextEditingController email;
  late TextEditingController pass;
 
  @override
  void initState() {
    cacheManager = UserCacheManager("userCacheNew2");
    getInit();
    email = new TextEditingController();
    pass = new TextEditingController();
  
    super.initState();
  }

  Future<void> getInit() async {
    await cacheManager.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Bu uygulamanın hiçbir banka veya kurumlarla ilgisi yoktur",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: AppColors.whiteGrey),
                    ),
                    SizedBox(height: 8),
                    Flexible(child: Image.asset("assets/logo.png")),
                    SizedBox(height: 20),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(
                        child: TextFormField(
                          controller: email,
                          decoration: new InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(
                                fontSize: AppFonst.mediumSize,
                                fontWeight: FontWeight.w500,
                                color: AppColors.whiteGrey),
                            border: InputBorder.none,
                            fillColor: AppColors.whiteGrey,
                            focusColor: AppColors.whiteGrey,
                            contentPadding: EdgeInsets.only(left: 10),
                            prefixIcon: Icon(
                              Icons.mail,
                              color: AppColors.whiteGrey,
                              size: AppFonst.bigSize,
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(
                        child: TextFormField(
                          controller: pass,
                          decoration: new InputDecoration(
                            labelText: "Parola",
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
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPasswordPage(
                                  model: cacheManager,
                                ),
                              ));
                        },
                        child: Text(
                          "Şifremi Unuttum",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                              color: AppColors.purple),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        var transactions = cacheManager.getValues();
                        bool isFind = false;
                        for (var i = 0; i < transactions!.length; i++) {
                          if (email.text.trim() == transactions[i].email &&
                              pass.text.trim() == transactions[i].password) {
                            AppLoginUser.loginUserIndex = i;
                            AppLoginUser.loginUser = transactions[i];
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                            isFind = true;
                          }
                        }
                        if (!isFind)
                          EToast().showMessage(
                              Toast.LENGTH_SHORT, "Kullanıcı bulunamadı");
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.blueGrey.withOpacity(.8)),
                        child: Center(
                          child: Text(
                            "Giriş Yap",
                            style: TextStyle(
                                color: AppColors.whiteGrey,
                                fontSize: AppFonst.bigSize,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    RichText(
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      text: TextSpan(
                          text: '',
                          style: TextStyle(color: Colors.purple),
                          children: [
                            TextSpan(
                              text: 'Hesabınız yok mu? ',
                              style: TextStyle(color: AppColors.darkBrown),
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () {},
                            ),
                            TextSpan(
                              text: 'Hesap Oluştur',
                              style: TextStyle(
                                  color: AppColors.purple,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold),
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CreateNewAccount(
                                          model: cacheManager,
                                        ),
                                      ));
                                },
                            ),
                          ]),
                    ),
                    SizedBox(height: 30),
                   
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
