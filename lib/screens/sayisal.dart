import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SayisalLoto extends StatefulWidget {
  const SayisalLoto({super.key});

  @override
  State<SayisalLoto> createState() => _SayisalLotoState();
}

int cevap = 0;

class _SayisalLotoState extends State<SayisalLoto> {
  Random random = Random();

  num bakiye = 10;
  int kazanilanPara = 0;
  List<int> sistem = [];
  List<int> oyuncu = [];
  String sayicontrol = "";
  var sayi1 = 0, sayi2 = 0, sayi3 = 0, sayi4 = 0, sayi5 = 0, sayi6 = 0;

  final sayi1Controller = TextEditingController();
  final sayi2Controller = TextEditingController();
  final sayi3Controller = TextEditingController();
  final sayi4Controller = TextEditingController();
  final sayi5Controller = TextEditingController();
  final sayi6Controller = TextEditingController();
  @override
  void sistemKontrol(){
    sistem = List.generate(6, (_) => Random().nextInt(61));

    Set<int> uniqueNumbers = Set<int>.from(sistem);

    while (uniqueNumbers.length < 6) {
      uniqueNumbers.add(Random().nextInt(60));
    }

    sistem = uniqueNumbers.toList();
    print(sistem);
  }
  void odulSistemi() {
    switch (cevap) {
      case 1:
        kazanilanPara = 10;
        bakiye += kazanilanPara;
        break;
      case 2:
        kazanilanPara = 15;
        bakiye += kazanilanPara;
        break;
      case 3:
        kazanilanPara = 20;
        bakiye += kazanilanPara;
        break;
      case 4:
        kazanilanPara = 30;
        bakiye += kazanilanPara;
        break;
      case 5:
        kazanilanPara = 40;
        bakiye += kazanilanPara;
        break;
      case 6:
        kazanilanPara = 100;
        bakiye += kazanilanPara;
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bakiye :$bakiye TL",
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    inputFormatters: [
                      CustomRangeTextInputFormatter(),
                    ],
                    keyboardType: TextInputType.number,
                    controller: sayi1Controller,
                    decoration: const InputDecoration(
                      hintText: "1. Sayı",
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: sayi2Controller,
                    inputFormatters: [
                      CustomRangeTextInputFormatter(),
                    ],
                    decoration: const InputDecoration(
                      hintText: "2. Sayı",
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: sayi3Controller,
                    inputFormatters: [
                      CustomRangeTextInputFormatter(),
                    ],
                    decoration: const InputDecoration(
                      hintText: "3. Sayı",
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: sayi4Controller,
                    inputFormatters: [
                      CustomRangeTextInputFormatter(),
                    ],
                    decoration: const InputDecoration(
                      hintText: "4. Sayı",
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: sayi5Controller,
                    inputFormatters: [
                      CustomRangeTextInputFormatter(),
                    ],
                    decoration: const InputDecoration(
                      hintText: "5. Sayı",
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: sayi6Controller,
                    inputFormatters: [
                      CustomRangeTextInputFormatter(),
                    ],
                    decoration: const InputDecoration(
                      hintText: "6. Sayı",
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // InkWell(
                  //   onTap: () {

                  //   },
                  //   child: const Text("Oyna2"),
                  // ),
                  ElevatedButton(
                    onPressed: () {
                      if (bakiye <= 0) {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Kapat"),
                                    ),
                                  ],
                                  content: SizedBox(
                                    height: 200,
                                    child: Column(
                                      children: [
                                        const Icon(
                                          Icons.remove_circle_outline,
                                          color: Colors.red,
                                          size: 80,
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(top: 5),
                                          child: const Text(
                                            "Yetersiz Bakiye",
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                      } else {
                        setState(() {
                          kazanilanPara = 0;
                          cevap = 0;
                          bakiye -= 5;
                          sistemKontrol();
                          // sistem = List.generate(6, (_) => Random().nextInt(60));
                          sistem[0].toString() == sayi1Controller.text ? cevap += 1 : null;
                          sistem[1].toString() == sayi2Controller.text ? cevap += 1 : null;
                          sistem[2].toString() == sayi3Controller.text ? cevap += 1 : null;
                          sistem[3].toString() == sayi4Controller.text ? cevap += 1 : null;
                          sistem[4].toString() == sayi5Controller.text ? cevap += 1 : null;
                          sistem[5].toString() == sayi6Controller.text ? cevap += 1 : null;
                          odulSistemi();
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Kapat"),
                                      ),
                                    ],
                                    content: SizedBox(
                                      height: 200,
                                      child: Column(
                                        children: [
                                          Icon(
                                            cevap == 0
                                                ? Icons.remove_circle_outline
                                                : Icons.check_circle,
                                            color: cevap == 0
                                                ? Colors.red
                                                : Colors.green,
                                            size: 80,
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 5),
                                            child: Text(
                                              "Doğru sayısı :$cevap",
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 5),
                                            child: cevap != 0
                                                ? Text(
                                                    "Kazanılan Para :$kazanilanPara",
                                                    style: const TextStyle(
                                                        fontSize: 16),
                                                  )
                                                : null,
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 5),
                                            child: Text(
                                              "Şanslı sayılar :$sistem",
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ));
                          sayi1Controller.clear();
                          sayi2Controller.clear();
                          sayi3Controller.clear();
                          sayi4Controller.clear();
                          sayi5Controller.clear();
                          sayi6Controller.clear();
                        });
                      }
                    },
                    child: const Text(
                      "Oyna",
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomRangeTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text == '') {
      return const TextEditingValue();
    } else if (int.parse(newValue.text) < 0) {
      return const TextEditingValue().copyWith(text: '1');
    }

    return int.parse(newValue.text) > 60
        ? const TextEditingValue().copyWith(text: '60')
        : newValue;
  }
}
