import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_app/component/colors.dart';
import 'package:payment_app/pages/payment_page.dart';
import 'package:payment_app/widgets/buttons.dart';
import 'package:payment_app/widgets/large_buttons.dart';
import 'package:payment_app/widgets/text_size.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: SizedBox(
        height: h,
        child: Stack(
          children: [
            _headSection(),
            _listBills(),
            _payButton(),
            _textContainer(),
          ],
        ),
      ),
    );
  }

  _headSection() {
    return SizedBox(
      height: 310,
      child: Stack(
        children: [
          _mainBackground(),
          _curveImageContainer(),
          _buttonContainer(),
        ],
      ),
    );
  }

  _mainBackground() {
    return Positioned(
      bottom: 10,
      left: 0,
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'images/background.png',
            ),
          ),
        ),
      ),
    );
  }

  _curveImageContainer() {
    return Positioned(
      left: 0,
      right: -2,
      bottom: 10,
      child: Container(
        height: MediaQuery.of(context).size.height * .1,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/curve.png'),
          ),
        ),
      ),
    );
  }

  _buttonContainer() {
    return Positioned(
      right: 54,
      bottom: 10,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet<dynamic>(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              barrierColor: Colors.transparent,
              context: context,
              builder: (BuildContext bc) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * .7,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        child: Container(
                          color: const Color(0xFFEEF1F4).withOpacity(.7),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * .63,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 54,
                        child: Container(
                          padding: const EdgeInsets.only(top: 5, bottom: 25),
                          width: 60,
                          height: 250,
                          decoration: BoxDecoration(
                            color: AppColor.mainColor,
                            borderRadius: BorderRadius.circular(29),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppButtons(
                                icon: Icons.cancel,
                                iconColor: AppColor.mainColor,
                                textColor: Colors.white,
                                backgroundColor: Colors.white,
                                onTap: () => Navigator.pop(context),
                              ),
                              const AppButtons(
                                icon: Icons.add,
                                iconColor: AppColor.mainColor,
                                textColor: Colors.white,
                                backgroundColor: Colors.white,
                                text: 'Add Bill',
                              ),
                              const AppButtons(
                                icon: Icons.history,
                                iconColor: AppColor.mainColor,
                                textColor: Colors.white,
                                backgroundColor: Colors.white,
                                text: 'History',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('images/lines.png'),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 15,
                offset: const Offset(0, 1),
                color: const Color(0xFF11324D).withOpacity(.2),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _listBills() {
    return Positioned(
        top: 320,
        left: 0,
        right: 0,
        bottom: 0,
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (_, index) {
              return ItemBills(
                context: context,
                subtitle: 'Auto pay on 24th May 18',
                colorSubtitle: AppColor.green,
              );
            },
          ),
        ));
  }

  _payButton() {
    return Positioned(
      bottom: 20,
      child: AppLargeButton(
        text: 'Pay all bills',
        textColor: Colors.white,
        onTap: () => Get.to(() => const PaymentPage()),
      ),
    );
  }

  _textContainer() {
    return Stack(
      children: const [
        Positioned(
          left: 0,
          top: 100,
          child: Text(
            "My Bills",
            style: TextStyle(
              color: Color(0xFF293952),
              fontSize: 70,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          left: 40,
          top: 80,
          child: Text(
            "My Bills",
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class ItemBills extends StatelessWidget {
  final String subtitle;
  final Color colorSubtitle;

  const ItemBills({
    Key? key,
    required this.context,
    required this.subtitle,
    this.colorSubtitle = Colors.grey,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, right: 20),
      height: 130,
      width: MediaQuery.of(context).size.width * .9,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x0ffd8dbe),
            offset: Offset(1, 1),
            blurRadius: 20,
            spreadRadius: 10,
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 10, left: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 3,
                          color: Colors.grey,
                        ),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'images/brand1.png',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'KenGen Power',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColor.mainColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'ID: 846594',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColor.idColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedText(
                  text: subtitle,
                  color: colorSubtitle,
                ),
                const SizedBox(height: 5),
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColor.selectBackground,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Select',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColor.selectColor,
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    const Text(
                      '\$1248.00',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: AppColor.mainColor,
                      ),
                    ),
                    Text(
                      'Due in 3 days',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColor.idColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
                const SizedBox(width: 5),
                Container(
                  width: 5,
                  height: 35,
                  decoration: BoxDecoration(
                      color: AppColor.halfOval,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
