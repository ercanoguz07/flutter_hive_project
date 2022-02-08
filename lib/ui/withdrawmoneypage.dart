import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:testbank/constant.dart';
import 'package:testbank/manager/cache_manager.dart';
import 'package:testbank/modal/userlogmodal.dart';
import 'package:testbank/ui/widgets/toast.dart';

class WithdrawMoneyPage extends StatefulWidget {
  const WithdrawMoneyPage({Key? key, required this.model}) : super(key: key);
  final ICacheManager<UserLogModel> model;

  @override
  _WithdrawMoneyPageState createState() => _WithdrawMoneyPageState();
}

class _WithdrawMoneyPageState extends State<WithdrawMoneyPage> {
  late TextEditingController fullnameController;
  late TextEditingController phoneController;
  late TextEditingController amountController;
  String dropdownValue = 'Türkiye';
 
  @override
  void initState() {
    fullnameController = new TextEditingController();
    phoneController = new TextEditingController();
    amountController = new TextEditingController();
    amountController.text = "0";
    super.initState();
  }

  @override
  void dispose() {
    fullnameController.dispose();
    phoneController.dispose();
    amountController.dispose();
    super.dispose();
  }

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
                    "Para Yatır",
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
                        controller: fullnameController,
                        decoration: new InputDecoration(
                          labelText: "Ad Soyad",
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
                        controller: phoneController,
                        decoration: InputDecoration(
                          labelText: "Telefon",
                          labelStyle: TextStyle(
                              fontSize: AppFonst.mediumSize,
                              fontWeight: FontWeight.w500,
                              color: AppColors.whiteGrey),
                          border: InputBorder.none,
                          fillColor: AppColors.whiteGrey,
                          focusColor: AppColors.whiteGrey,
                          contentPadding: EdgeInsets.only(left: 10),
                          prefixIcon: Icon(
                            Icons.phone_android,
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
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: amountController,
                              decoration: InputDecoration(
                                labelText: "Miktar",
                                labelStyle: TextStyle(
                                    fontSize: AppFonst.mediumSize,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.whiteGrey),
                                border: InputBorder.none,
                                fillColor: AppColors.whiteGrey,
                                focusColor: AppColors.whiteGrey,
                                contentPadding: EdgeInsets.only(left: 10),
                                prefixIcon: Icon(
                                  Icons.money_rounded,
                                  color: AppColors.whiteGrey,
                                  size: AppFonst.bigSize,
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                            ),
                          ),
                          Text(
                            "TL",
                            style: TextStyle(
                                color: AppColors.whiteGrey,
                                fontSize: AppFonst.mediumSize),
                          ),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                      child: DropdownButton<String>(
                        value: dropdownValue, //selected
                        underline: SizedBox.shrink(),
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.whiteGrey,
                        ),
                        isExpanded: true,
                        style: TextStyle(
                            fontSize: AppFonst.mediumSize,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                        iconSize: AppFonst.bigSize + 8,
                        elevation: 4,

                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>[
                          "Türkiye",
                          "İtalya",
                          "Meksika",
                          "Arnavutluk"
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Center(
                                child: Text(
                              value.toString(),
                            )),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      if (fullnameController.text.trim().isEmpty) {
                        EToast().showMessage(
                            Toast.LENGTH_SHORT, "İsim yazmak zorunlu");
                        return;
                      }
                      if (phoneController.text.trim().isEmpty) {
                        EToast().showMessage(
                            Toast.LENGTH_SHORT, "Telefon yazmak zorunlu");
                        return;
                      }
                      if (amountController.text.trim().isEmpty) {
                        EToast().showMessage(
                            Toast.LENGTH_SHORT, "Miktar yazmak zorunlu");
                        return;
                      }
                      if (double.parse(amountController.text.trim()) <= 0) {
                        EToast().showMessage(Toast.LENGTH_SHORT,
                            "0 dan büyük değer girmek zorundasınız");
                        return;
                      }
                      if (double.parse(amountController.text.trim()) > 10000) {
                        EToast().showMessage(Toast.LENGTH_SHORT,
                            "10000 dan büyük değer girmek zorundasınız");
                        return;
                      }
                      var userLog = UserLogModel()
                        ..fullname = fullnameController.text.trim()
                        ..phone = phoneController.text.trim()
                        ..amount = amountController.text.trim()
                        ..islem = "1"
                        ..islemDate = DateTime.now()
                        ..userId = AppLoginUser.loginUserIndex
                        ..country = dropdownValue;
                      List<UserLogModel> liste = [];
                      liste.add(userLog);
                      widget.model.addItems(liste);
                      EToast().showMessage(
                          Toast.LENGTH_SHORT, "Para Yatırma İşlemi Başarılı");
                      // var providerTest =
                      //     Provider.of<TestBankProvider>(context, listen: false);
                      // providerTest.setNotifier();
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.blueGrey.withOpacity(.8)),
                      child: Center(
                        child: Text(
                          "Para Yatır",
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
