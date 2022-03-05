import 'dart:math';

import 'package:scientific_calc/exports.dart';
import 'package:scientific_calc/models/search_data.dart';

class HomeViewModel extends BaseViewModel {
  final logs = getLogger('HomeViewModel');

  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  bool canExpand = false;
  bool isDeg = true;
  bool isInv = false;
  num firstOperand = 0;
  num secondOperand = 0;
  String history = '';
  String displayText = '';
  String result = '';
  String operators = '';

  expansionFunction(int index, bool isExpanded) {
    canExpand = !isExpanded;
    notifyListeners();
  }

  final popupItems = const [
    PopupMenuItem(
      value: 'history',
      child: Text('History'),
    ),
    PopupMenuItem(
      value: 'themes',
      child: Text('Choose Theme'),
    ),
    PopupMenuItem(
      value: 'help',
      child: Text('Help'),
    ),
  ];

  void popupActions(String result) {
    switch (result) {
      case 'history':
        navigateTo(Routes.historyView);
        break;
      case 'themes':
        _dialogService.showCustomDialog(
          variant: DialogType.theme,
          barrierDismissible: true,
        );
        break;
      case 'help':
        navigateTo(Routes.helpView);
        break;
    }
  }

  void navigateBack() {
    _navigationService.back();
  }

  void navigateTo(route) {
    _navigationService.navigateTo(route);
  }

  void validateScientificActions(String btnInput) {
    if (btnInput == '√') {
      firstOperand = sqrt(num.parse(displayText));
      history = '√' + num.parse(displayText).toString();
      result = firstOperand.toString();
      displayText = result;
      _saveSearch(hist: history, res: result);
    } else if (btnInput == 'π') {
      try {
        firstOperand = num.parse(displayText) * pi;
        history = num.parse(displayText).toString() + 'π';
        result = firstOperand.toString();
        displayText = result;
        _saveSearch(hist: history, res: result);
      } catch (e) {
        displayText = 'Math Error';
        logs.e(e);
      }
    } else if (btnInput == '^') {
      try {
        firstOperand = pow(num.parse(displayText), 2);
        history = num.parse(displayText).toString() + '²';
        result = firstOperand.toString();
        displayText = result;
        _saveSearch(hist: history, res: result);
      } catch (e) {
        displayText = 'Math Error';
        logs.e(e);
      }
    } else if (btnInput == '!') {
      try {
        firstOperand = findFactorial(num.parse(displayText));
        history = num.parse(displayText).toString() + '!';
        result = firstOperand.toString();
        displayText = result;
        _saveSearch(hist: history, res: result);
      } catch (e) {
        displayText = 'Math Error';
        logs.e(e);
      }
    } else if (btnInput == '.') {
      if (displayText == '') {
        result = '.';
      } else {
        result = num.parse(displayText).toString() + '.';
      }
    } else if (btnInput == 'sin') {
      try {
        if (isDeg == true) {
          firstOperand = sin(degToRadians(num.parse(displayText).toDouble())).toPrecision(4);
        } else {
          firstOperand = sin(num.parse(displayText)).toPrecision(4);
        }
        history = 'sin' + num.parse(displayText).toString();
        result = firstOperand.toString();
        displayText = result;
        _saveSearch(hist: history, res: result);
      } catch (e) {
        displayText = 'Math Error';
        logs.e(e);
      }
    } else if (btnInput == 'cos') {
      try {
        if (isDeg == true) {
          firstOperand = cos(degToRadians(num.parse(displayText))).toPrecision(4);
        } else {
          firstOperand = cos(num.parse(displayText)).toPrecision(4);
        }
        history = 'cos' + num.parse(displayText).toString();
        result = firstOperand.toString();
        displayText = result;
        _saveSearch(hist: history, res: result);
      } catch (e) {
        displayText = 'Math Error';
        logs.e(e);
      }
    } else if (btnInput == 'tan') {
      try {
        if (isDeg == true) {
          firstOperand = tan(degToRadians(num.parse(displayText))).toPrecision(4);
        } else {
          firstOperand = tan(num.parse(displayText)).toPrecision(4);
        }
        history = 'tan' + num.parse(displayText).toString();
        result = firstOperand.toString();
        displayText = result;
        _saveSearch(hist: history, res: result);
      } catch (e) {
        displayText = 'Math Error';
        logs.e(e);
      }
    } else if (btnInput == 'e') {
      try {
        firstOperand = num.parse(displayText) * e;
        history = 'e' + num.parse(displayText).toString();
        result = firstOperand.toString();
        displayText = result;
        _saveSearch(hist: history, res: result);
      } catch (e) {
        displayText = 'Math Error';
        logs.e(e);
      }
    } else if (btnInput == 'ln') {
      try {
        firstOperand = log(num.parse(displayText));
        history = 'ln(${num.parse(displayText)})';
        result = firstOperand.toString();
        displayText = result;
        _saveSearch(hist: history, res: result);
      } catch (e) {
        displayText = 'Math Error';
        logs.e(e);
      }
    } else if (btnInput == 'log') {
      try {
        firstOperand = log(num.parse(displayText)) / ln10;
        history = 'log(${num.parse(displayText)})';
        result = firstOperand.toString();
        displayText = result;
        _saveSearch(hist: history, res: result);
      } catch (e) {
        displayText = 'Math Error';
        logs.e(e);
      }
    } else if (btnInput == 'INV') {
      isInv = !isInv;
    } else if (btnInput == 'DEG' || btnInput == 'RAD') {
      isDeg = !isDeg;
    } else if (btnInput == 'sin⁻¹') {
      try {
        if (isDeg == true) {
          firstOperand = radToDegrees(asin(num.parse(displayText)));
        } else {
          firstOperand = asin(num.parse(displayText));
        }
        history = 'sin⁻¹(${num.parse(displayText)})';
        result = firstOperand.toString();
        displayText = result;
        _saveSearch(hist: history, res: result);
      } catch (e) {
        displayText = 'Math Error';
        logs.e(e);
      }
    } else if (btnInput == 'cos⁻¹') {
      try {
        if (isDeg == true) {
          firstOperand = radToDegrees(acos(num.parse(displayText)));
        } else {
          firstOperand = acos(num.parse(displayText));
        }
        history = 'cos⁻¹(${num.parse(displayText)})';
        result = firstOperand.toString();
        displayText = result;
        _saveSearch(hist: history, res: result);
      } catch (e) {
        displayText = 'Math Error';
        logs.e(e);
      }
    } else if (btnInput == 'tan⁻¹') {
      try {
        if (isDeg == true) {
          firstOperand = radToDegrees(atan(num.parse(displayText)));
        } else {
          firstOperand = atan(num.parse(displayText));
        }
        history = 'tan⁻¹(${num.parse(displayText)})';
        result = firstOperand.toString();
        displayText = result;

        _saveSearch(hist: history, res: result);
      } catch (e) {
        displayText = 'Math Error';
        logs.e(e);
      }
    } else if (btnInput == 'eˣ') {
      try {
        firstOperand = exp(num.parse(displayText));
        history = 'exp(${num.parse(displayText)})';
        result = firstOperand.toString();
        displayText = result;

        _saveSearch(hist: history, res: result);
      } catch (e) {
        displayText = 'Math Error';
        logs.e(e);
      }
    } else if (btnInput == '10ˣ') {
      try {
        num p = pow(10, num.parse(displayText));
        firstOperand = p;
        history = '10^(${num.parse(displayText)})';

        if (num.parse(displayText) > 18 && num.parse(displayText) < 30000) {
          result = '1.E$displayText';
        } else if (num.parse(displayText) >= 30000) {
          result = 'undefined';
        } else {
          result = firstOperand.toString();
        }

        displayText = result;
        _saveSearch(hist: history, res: result);
      } catch (e) {
        displayText = 'Math Error';
        logs.e(e);
      }
    } else if (btnInput == 'x²') {
      try {
        num p = pow(num.parse(displayText), 2);
        firstOperand = p;
        history = '(${num.parse(displayText)})²';

        result = firstOperand.toString();

        displayText = result;
        _saveSearch(hist: history, res: result);
      } catch (e) {
        displayText = 'Math Error';
        logs.e(e);
      }
    }
    notifyListeners();
  }

  // Find factorial recursively.
  num findFactorial(num n) {
    if (n == 1) {
      return 1;
    }
    return n * findFactorial(n - 1);
  }

  num radToDegrees(num angle) {
    return angle * (180 / pi);
  }

  num degToRadians(num angle) {
    return angle * (pi / 180);
  }

  void _saveSearch({hist, res}) {
    SearchData newData = SearchData(
      calcHistory: hist,
      calcResult: res,
    );

    HiveUtil.addData(newData);

    logs.d('History is saved as: ${newData.calcHistory}');
    logs.d('While result is saved as: ${newData.calcResult}');
  }

  void clear() {
    displayText = '';
    firstOperand = 0;
    secondOperand = 0;
    result = '';
    history = '';
  }

  void validateActions(String input) {
    logs.i(input);
    if (input == 'del') {
      displayText = '';
      firstOperand = 0;
      secondOperand = 0;
      result = result.substring(0, result.length - 1);
    } else if (input == 'AC') {
      clear();
    } else if (input == '+' || input == '-' || input == '÷' || input == 'x') {
      if (result.contains('(') || result.contains(')')) {
        firstOperand = num.parse(result.replaceAll('(', ''));
      } else {
        firstOperand = num.parse(result);
      }
      operators = input;
      history = result + operators;
      result = '';
      secondOperand = 0;
    } else if (input == '%') {
      try {
        firstOperand = num.parse(displayText) / 100;
        history = num.parse(displayText).toString() + '%';
        result = firstOperand.toString();
        displayText = result;
        _saveSearch(hist: history, res: result);
      } catch (e) {
        displayText = 'Math Error';
        logs.e(e);
      }
    } else if (input == '( )') {
      if (displayText.contains('(') == false) {
        result = '(' + displayText;
      } else if (displayText.contains('(')) {
        result = displayText + ')';
      }
    } else if (input == '=') {
      try {
        secondOperand = num.parse(displayText);
      } catch (e) {
        result = 'NaN';
      }
      if (operators == '+') {
        result = (firstOperand + secondOperand).toString();
        history = firstOperand.toString() + operators.toString() + secondOperand.toString();
      }
      if (operators == '-') {
        result = (firstOperand - secondOperand).toString();
        history = firstOperand.toString() + operators.toString() + secondOperand.toString();
      }
      if (operators == 'x') {
        result = (firstOperand * secondOperand).toString();
        history = firstOperand.toString() + '*' + secondOperand.toString();
      }
      if (operators == '÷') {
        result = (firstOperand / secondOperand).toString();
        history = firstOperand.toString() + operators.toString() + secondOperand.toString();
      }
      _saveSearch(hist: history, res: result);
    } else {
      if (['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'].any((x) => x == input)) {
        if (displayText.contains('(')) {
          String p = displayText.replaceAll('(', '');
          result = '(' + num.parse(p + input).toString();
        } else if (displayText.contains(')')) {
          String p = displayText.replaceAll(')', '');
          result = num.parse(p + input + ')').toString();
        } else {
          result = num.parse(displayText + input).toString();
        }
      }
      validateScientificActions(input);
    }

    logs.i('History is now $history');
    logs.i('Your displayText is $displayText');
    logs.i('While the result found is $result');

    displayText = result;
    notifyListeners();
  }
}
