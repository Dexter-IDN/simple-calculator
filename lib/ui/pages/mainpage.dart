// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custombtn.dart';
import '../../controllers/theme.dart';
import '../../controllers/calculator.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Get.put(ThemeApp());
    final calculator = Get.put(Calculator());

    return Scaffold(
      body: Obx(
        () => Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Color(theme.primaryColor.value),
            ),
            ListView(
              reverse: true,
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.3, right: 20),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Obx(() => (calculator.result.value.isEmpty)
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                calculator.value1.toString(),
                                style: TextStyle(
                                    fontSize: 38,
                                    color: Color(theme.textColor.value)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: Text(
                                  calculator.operator.value,
                                  style: TextStyle(
                                      fontSize: 38,
                                      color: Color(theme.textColor.value)),
                                ),
                              ),
                              Text(
                                calculator.value2.toString(),
                                style: TextStyle(
                                    fontSize: 38,
                                    color: Color(theme.textColor.value)),
                              ),
                              Text(
                                calculator.result.toString(),
                                style: TextStyle(
                                    fontSize: 38,
                                    color: Color(theme.textColor.value)),
                              ),
                            ],
                          )
                        : Text(
                            calculator.result.value,
                            style: TextStyle(
                                fontSize: 36,
                                color: Color(theme.textColor.value)),
                          )),
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  color: Color(theme.secondaryColor.value),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                mainAxisSpacing: 15,
                crossAxisSpacing: 20,
                children: [
                  CustomBtnText(
                    text: "AC",
                    textColor: theme.infoColor.value,
                    onTapAction: () {
                      calculator.value1.value = '';
                      calculator.operator.value = '';
                      calculator.value2.value = '';
                      calculator.result.value = '';
                    },
                  ),
                  CustomBtnIcon(
                    icon: Icons.percent_rounded,
                    iconColor: theme.infoColor.value,
                    onTapAction: () {
                      if (calculator.operator.value.isEmpty) {
                        if (!calculator.value1.endsWith('%')) {
                          calculator.value1.value += '%';
                        } else {
                          return false;
                        }
                      } else {
                        if (!calculator.value2.endsWith('%')) {
                          calculator.value2.value += '%';
                        } else {
                          return false;
                        }
                      }
                    },
                  ),
                  CustomBtnText(
                    text: "÷",
                    textSize: 30,
                    textColor: theme.infoColor.value,
                    onTapAction: () {
                      if (calculator.result.isEmpty) {
                        if (calculator.operator.value == '' &&
                            calculator.value1.value.isNotEmpty) {
                          calculator.operator.value = '÷';
                        } else {
                          return false;
                        }
                      } else {
                        calculator.value1.value = calculator.result.value;
                        calculator.value2.value = '';
                        calculator.operator.value = '÷';

                        calculator.result.value = '';
                      }
                    },
                  ),
                  CustomBtnIcon(
                    icon: Icons.backspace_rounded,
                    iconColor: theme.dangerColor.value,
                    onTapAction: () {
                      if (calculator.value1.value == '') {
                        return false;
                      } else {
                        if (calculator.result.value.isNotEmpty) {
                          calculator.value1.value = '';
                          calculator.operator.value = '';
                          calculator.value2.value = '';
                          calculator.result.value = '';
                        } else {
                          if (calculator.operator.value.isEmpty) {
                            String value1 = calculator.value1.value;
                            value1 = value1.substring(0, value1.length - 1);
                            calculator.value1.value = value1;

                            calculator.result.value = '';
                          } else {
                            if (calculator.value2.value.isNotEmpty) {
                              String value2 = calculator.value2.value;
                              value2 = value2.substring(0, value2.length - 1);
                              calculator.value2.value = value2;
                            } else {
                              calculator.operator.value = '';
                            }
                          }
                        }
                      }
                    },
                  ),
                  CustomBtnText(
                    text: "7",
                    textColor: theme.textColor.value,
                    onTapAction: () {
                      if (calculator.result.value.isEmpty) {
                        if (calculator.operator.value.isEmpty) {
                          if (calculator.result.value.isEmpty) {
                            calculator.value1.value += '7';
                            calculator.result.value = '';
                          }
                        } else {
                          calculator.value2.value += '7';
                          calculator.result.value = '';
                        }
                      } else {
                        calculator.value1.value = '7';
                        calculator.operator.value = '';
                        calculator.value2.value = '';
                        calculator.result.value = '';
                      }
                    },
                  ),
                  CustomBtnText(
                    text: "8",
                    textColor: theme.textColor.value,
                    onTapAction: () {
                      if (calculator.result.value.isEmpty) {
                        if (calculator.operator.value.isEmpty) {
                          if (calculator.result.value.isEmpty) {
                            calculator.value1.value += '8';
                            calculator.result.value = '';
                          }
                        } else {
                          calculator.value2.value += '8';
                          calculator.result.value = '';
                        }
                      } else {
                        calculator.value1.value = '8';
                        calculator.operator.value = '';
                        calculator.value2.value = '';
                        calculator.result.value = '';
                      }
                    },
                  ),
                  CustomBtnText(
                    text: "9",
                    textColor: theme.textColor.value,
                    onTapAction: () {
                      if (calculator.result.value.isEmpty) {
                        if (calculator.operator.value.isEmpty) {
                          if (calculator.result.value.isEmpty) {
                            calculator.value1.value += '9';
                            calculator.result.value = '';
                          }
                        } else {
                          calculator.value2.value += '9';
                          calculator.result.value = '';
                        }
                      } else {
                        calculator.value1.value = '9';
                        calculator.operator.value = '';
                        calculator.value2.value = '';
                        calculator.result.value = '';
                      }
                    },
                  ),
                  CustomBtnIcon(
                    icon: Icons.close_rounded,
                    iconColor: theme.infoColor.value,
                    onTapAction: () {
                      if (calculator.result.isEmpty) {
                        if (calculator.operator.value == '' &&
                            calculator.value1.value.isNotEmpty) {
                          calculator.operator.value = '×';
                        } else {
                          return false;
                        }
                      } else {
                        calculator.value1.value = calculator.result.value;
                        calculator.value2.value = '';
                        calculator.operator.value = '×';

                        calculator.result.value = '';
                      }
                    },
                  ),
                  CustomBtnText(
                    text: "4",
                    textColor: theme.textColor.value,
                    onTapAction: () {
                      if (calculator.result.value.isEmpty) {
                        if (calculator.operator.value.isEmpty) {
                          if (calculator.result.value.isEmpty) {
                            calculator.value1.value += '4';
                            calculator.result.value = '';
                          }
                        } else {
                          calculator.value2.value += '4';
                          calculator.result.value = '';
                        }
                      } else {
                        calculator.value1.value = '4';
                        calculator.operator.value = '';
                        calculator.value2.value = '';
                        calculator.result.value = '';
                      }
                    },
                  ),
                  CustomBtnText(
                    text: "5",
                    textColor: theme.textColor.value,
                    onTapAction: () {
                      if (calculator.result.value.isEmpty) {
                        if (calculator.operator.value.isEmpty) {
                          if (calculator.result.value.isEmpty) {
                            calculator.value1.value += '5';
                            calculator.result.value = '';
                          }
                        } else {
                          calculator.value2.value += '5';
                          calculator.result.value = '';
                        }
                      } else {
                        calculator.value1.value = '5';
                        calculator.operator.value = '';
                        calculator.value2.value = '';
                        calculator.result.value = '';
                      }
                    },
                  ),
                  CustomBtnText(
                    text: "6",
                    textColor: theme.textColor.value,
                    onTapAction: () {
                      if (calculator.result.value.isEmpty) {
                        if (calculator.operator.value.isEmpty) {
                          if (calculator.result.value.isEmpty) {
                            calculator.value1.value += '6';
                            calculator.result.value = '';
                          }
                        } else {
                          calculator.value2.value += '6';
                          calculator.result.value = '';
                        }
                      } else {
                        calculator.value1.value = '6';
                        calculator.operator.value = '';
                        calculator.value2.value = '';
                        calculator.result.value = '';
                      }
                    },
                  ),
                  CustomBtnIcon(
                    icon: Icons.remove_rounded,
                    iconColor: theme.infoColor.value,
                    onTapAction: () {
                      if (calculator.result.isEmpty) {
                        if (calculator.operator.value == '' &&
                            calculator.value1.value.isNotEmpty) {
                          calculator.operator.value = '-';
                        } else {
                          return false;
                        }
                      } else {
                        calculator.value1.value = calculator.result.value;
                        calculator.value2.value = '';
                        calculator.operator.value = '-';

                        calculator.result.value = '';
                      }
                    },
                  ),
                  CustomBtnText(
                    text: "1",
                    textColor: theme.textColor.value,
                    onTapAction: () {
                      if (calculator.result.value.isEmpty) {
                        if (calculator.operator.value.isEmpty) {
                          if (calculator.result.value.isEmpty) {
                            calculator.value1.value += '1';
                            calculator.result.value = '';
                          }
                        } else {
                          calculator.value2.value += '1';
                          calculator.result.value = '';
                        }
                      } else {
                        calculator.value1.value = '1';
                        calculator.operator.value = '';
                        calculator.value2.value = '';
                        calculator.result.value = '';
                      }
                    },
                  ),
                  CustomBtnText(
                    text: "2",
                    textColor: theme.textColor.value,
                    onTapAction: () {
                      if (calculator.result.value.isEmpty) {
                        if (calculator.operator.value.isEmpty) {
                          if (calculator.result.value.isEmpty) {
                            calculator.value1.value += '2';
                            calculator.result.value = '';
                          }
                        } else {
                          calculator.value2.value += '2';
                          calculator.result.value = '';
                        }
                      } else {
                        calculator.value1.value = '2';
                        calculator.operator.value = '';
                        calculator.value2.value = '';
                        calculator.result.value = '';
                      }
                    },
                  ),
                  CustomBtnText(
                    text: "3",
                    textColor: theme.textColor.value,
                    onTapAction: () {
                      if (calculator.result.value.isEmpty) {
                        if (calculator.operator.value.isEmpty) {
                          if (calculator.result.value.isEmpty) {
                            calculator.value1.value += '3';
                            calculator.result.value = '';
                          }
                        } else {
                          calculator.value2.value += '3';
                          calculator.result.value = '';
                        }
                      } else {
                        calculator.value1.value = '3';
                        calculator.operator.value = '';
                        calculator.value2.value = '';
                        calculator.result.value = '';
                      }
                    },
                  ),
                  CustomBtnIcon(
                    icon: Icons.add_rounded,
                    iconColor: theme.infoColor.value,
                    onTapAction: () {
                      if (calculator.result.isEmpty) {
                        if (calculator.operator.value == '' &&
                            calculator.value1.value.isNotEmpty) {
                          calculator.operator.value = '+';
                        } else {
                          return false;
                        }
                      } else {
                        calculator.value1.value = calculator.result.value;
                        calculator.value2.value = '';
                        calculator.operator.value = '+';

                        calculator.result.value = '';
                      }
                    },
                  ),
                  CustomBtnText(
                    text: "null",
                    textColor: theme.textColor.value,
                    textSize: 20,
                  ),
                  CustomBtnText(
                    text: "0",
                    textColor: theme.textColor.value,
                    onTapAction: () {
                      if (calculator.result.value.isEmpty) {
                        if (calculator.operator.value.isEmpty) {
                          if (calculator.value1.value == '0') {
                            return false;
                          } else {
                            calculator.value1.value += '0';
                            calculator.result.value = '';
                          }
                        } else {
                          if (calculator.value2.value == '0') {
                            return false;
                          } else {
                            calculator.value2.value += '0';
                            calculator.result.value = '';
                          }
                        }
                      } else {
                        calculator.value1.value = '0';
                        calculator.operator.value = '';
                        calculator.value2.value = '';
                        calculator.result.value = '';
                      }
                    },
                  ),
                  CustomBtnText(
                    text: ".",
                    textColor: theme.textColor.value,
                    onTapAction: () {
                      if (calculator.operator.value.isEmpty) {
                        if (!calculator.value1.endsWith('.')) {
                          if (!calculator.value1.contains('.')) {
                            if (calculator.value1.value.isEmpty) {
                              calculator.value1.value += '0.';
                            } else {
                              calculator.value1.value += '.';
                            }
                          }
                        } else {
                          return false;
                        }
                      } else {
                        if (!calculator.value2.endsWith('.')) {
                          if (!calculator.value2.contains('.')) {
                            if (calculator.value2.value.isEmpty) {
                              calculator.value2.value += '0.';
                            } else {
                              calculator.value2.value += '.';
                            }
                          }
                        } else {
                          return false;
                        }
                      }
                    },
                  ),
                  CustomBtnText(
                    text: "=",
                    textSize: 30,
                    textColor: theme.infoColor.value,
                    onTapAction: () {
                      if (calculator.operator.value.isNotEmpty &&
                          calculator.value2.value.isNotEmpty) {
                        double result;
                        double? percent_x;

                        try {
                          if (calculator.value1.value.endsWith('%')) {
                            String percent1 = calculator.value1.value.substring(
                                0, calculator.value1.value.length - 1);
                            dynamic valuePercent1 =
                                double.parse(percent1) / 100;
                            calculator.value1.value = valuePercent1.toString();
                          } else {
                            String percent2 = calculator.value2.value.substring(
                                0, calculator.value2.value.length - 1);
                            dynamic valuePercent2 =
                                double.parse(percent2) / 100;
                            if (calculator.operator.value == '÷' ||
                                calculator.operator.value == '×') {
                              percent_x = valuePercent2;
                            } else {
                              percent_x =
                                  double.parse(calculator.value1.value) *
                                      valuePercent2;
                            }
                          }

                          if (calculator.value2.value.endsWith('%')) {
                            String percent2 = calculator.value2.value.substring(
                                0, calculator.value2.value.length - 1);
                            dynamic valuePercent2 =
                                double.parse(percent2) / 100;

                            calculator.value2.value = (percent_x == null)
                                ? valuePercent2.toString()
                                : percent_x.toString();
                          }
                        } catch (error) {
                          calculator.result.value = 'Ekspresi salah';
                        }

                        switch (calculator.operator.value) {
                          case '÷':
                            try {
                              result = double.parse(calculator.value1.value) /
                                  double.parse(calculator.value2.value);
                              calculator.result.value =
                                  (result * 1 != result.toInt())
                                      ? result.toString()
                                      : result.toInt().toString();
                            } catch (error) {
                              if (calculator.value2.value.endsWith('0')) {
                                calculator.result.value =
                                    'Tidak dapat dibagi 0';
                              } else {
                                calculator.result.value = 'Ekspresi salah';
                              }
                            }
                            break;
                          case '×':
                            try {
                              result = double.parse(calculator.value1.value) *
                                  double.parse(calculator.value2.value);
                              calculator.result.value =
                                  (result * 1 != result.toInt())
                                      ? result.toString()
                                      : result.toInt().toString();
                            } catch (error) {
                              calculator.result.value = 'Ekspresi salah';
                            }
                            break;
                          case '-':
                            try {
                              result = double.parse(calculator.value1.value) -
                                  double.parse(calculator.value2.value);
                              calculator.result.value =
                                  (result * 1 != result.toInt())
                                      ? result.toString()
                                      : result.toInt().toString();
                            } catch (error) {
                              calculator.result.value = 'Ekspresi salah';
                            }
                            break;
                          case '+':
                            try {
                              result = double.parse(calculator.value1.value) +
                                  double.parse(calculator.value2.value);
                              calculator.result.value =
                                  (result * 1 != result.toInt())
                                      ? result.toString()
                                      : result.toInt().toString();
                            } catch (error) {
                              calculator.result.value = 'Ekspresi salah';
                            }
                            break;
                          default:
                        }
                      } else {
                        if (calculator.value1.value.endsWith('%')) {
                          String percent1 = calculator.value1.value
                              .substring(0, calculator.value1.value.length - 1);
                          dynamic valuePercent1 = double.parse(percent1) / 100;

                          calculator.result.value = valuePercent1.toString();
                        } else {
                          return false;
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.2,
                color: Colors.transparent,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 40,
                    width: 150,
                    margin: EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                        color: Color(theme.secondaryColor.value),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            theme.primaryColor.value = 0xFF22252D;
                            theme.secondaryColor.value = 0xFF2A2D38;
                            theme.infoColor.value = 0xFF5CCABB;
                            theme.dangerColor.value = 0xFFD57174;
                            theme.textColor.value = 0xFFFFFFFF;

                            theme.isLight.value = false;
                          },
                          child: Icon(
                            (!theme.isLight.value)
                                ? Icons.dark_mode_rounded
                                : Icons.dark_mode_outlined,
                            color: (!theme.isLight.value)
                                ? Colors.white
                                : Colors.grey,
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            theme.primaryColor.value = 0xFFF5F5F7;
                            theme.secondaryColor.value = 0xFFFFFFFF;
                            theme.infoColor.value = 0xFF4AA296;
                            theme.dangerColor.value = 0xFFAA5A5d;
                            theme.textColor.value = 0xFF2A2D38;

                            theme.isLight.value = true;
                          },
                          child: Icon(
                            (theme.isLight.value)
                                ? Icons.light_mode_rounded
                                : Icons.light_mode_outlined,
                            color: (theme.isLight.value)
                                ? Colors.black
                                : Colors.grey,
                          ),
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
