

import Foundation

/*
  `WeatherIcon` is used to map Open Weather Map icon string to Weather Icons unicode string.
  It is generated by
  ```
    var caseString = '';
    var caseAndReturnString = '';
    Array.prototype.forEach.call(document.styleSheets[1].cssRules,function(element){
    if (element.selectorText && element.selectorText.startsWith('.wi-owm')) {
      var caseName = element.selectorText.substring(8,
        element.selectorText.indexOf('::before')).replace('-', '')
      caseString += 'case ' + caseName + ' = "' + caseName + '"\n';
      caseAndReturnString += 'case .' + caseName + ': return "\\u{'
        + element.style['content'].charCodeAt(1).toString(16) + '}"\n'
    }
    });
    console.log(caseString);
    console.log(caseAndReturnString);
  ```
*/
// swiftlint:disable type_body_length
struct WeatherIcon {
  let iconText: String

  enum IconType: String, CustomStringConvertible {
    case day200 = "day200"
    case day201 = "day201"
    case day202 = "day202"
    case day210 = "day210"
    case day211 = "day211"
    case day212 = "day212"
    case day221 = "day221"
    case day230 = "day230"
    case day231 = "day231"
    case day232 = "day232"
    case day300 = "day300"
    case day301 = "day301"
    case day302 = "day302"
    case day310 = "day310"
    case day311 = "day311"
    case day312 = "day312"
    case day313 = "day313"
    case day314 = "day314"
    case day321 = "day321"
    case day500 = "day500"
    case day501 = "day501"
    case day502 = "day502"
    case day503 = "day503"
    case day504 = "day504"
    case day511 = "day511"
    case day520 = "day520"
    case day521 = "day521"
    case day522 = "day522"
    case day531 = "day531"
    case day600 = "day600"
    case day601 = "day601"
    case day602 = "day602"
    case day611 = "day611"
    case day612 = "day612"
    case day615 = "day615"
    case day616 = "day616"
    case day620 = "day620"
    case day621 = "day621"
    case day622 = "day622"
    case day701 = "day701"
    case day711 = "day711"
    case day721 = "day721"
    case day731 = "day731"
    case day741 = "day741"
    case day761 = "day761"
    case day762 = "day762"
    case day781 = "day781"
    case day800 = "day800"
    case day801 = "day801"
    case day802 = "day802"
    case day803 = "day803"
    case day804 = "day804"
    case day900 = "day900"
    case day902 = "day902"
    case day903 = "day903"
    case day904 = "day904"
    case day906 = "day906"
    case day957 = "day957"
    case night200 = "night200"
    case night201 = "night201"
    case night202 = "night202"
    case night210 = "night210"
    case night211 = "night211"
    case night212 = "night212"
    case night221 = "night221"
    case night230 = "night230"
    case night231 = "night231"
    case night232 = "night232"
    case night300 = "night300"
    case night301 = "night301"
    case night302 = "night302"
    case night310 = "night310"
    case night311 = "night311"
    case night312 = "night312"
    case night313 = "night313"
    case night314 = "night314"
    case night321 = "night321"
    case night500 = "night500"
    case night501 = "night501"
    case night502 = "night502"
    case night503 = "night503"
    case night504 = "night504"
    case night511 = "night511"
    case night520 = "night520"
    case night521 = "night521"
    case night522 = "night522"
    case night531 = "night531"
    case night600 = "night600"
    case night601 = "night601"
    case night602 = "night602"
    case night611 = "night611"
    case night612 = "night612"
    case night615 = "night615"
    case night616 = "night616"
    case night620 = "night620"
    case night621 = "night621"
    case night622 = "night622"
    case night701 = "night701"
    case night711 = "night711"
    case night721 = "night721"
    case night731 = "night731"
    case night741 = "night741"
    case night761 = "night761"
    case night762 = "night762"
    case night781 = "night781"
    case night800 = "night800"
    case night801 = "night801"
    case night802 = "night802"
    case night803 = "night803"
    case night804 = "night804"
    case night900 = "night900"
    case night902 = "night902"
    case night903 = "night903"
    case night904 = "night904"
    case night906 = "night906"
    case night957 = "night957"

    var description: String {
      switch self {
      case .day200: return "\u{f010}"
      case .day201: return "\u{f010}"
      case .day202: return "\u{f010}"
      case .day210: return "\u{f005}"
      case .day211: return "\u{f005}"
      case .day212: return "\u{f005}"
      case .day221: return "\u{f005}"
      case .day230: return "\u{f010}"
      case .day231: return "\u{f010}"
      case .day232: return "\u{f010}"
      case .day300: return "\u{f00b}"
      case .day301: return "\u{f00b}"
      case .day302: return "\u{f008}"
      case .day310: return "\u{f008}"
      case .day311: return "\u{f008}"
      case .day312: return "\u{f008}"
      case .day313: return "\u{f008}"
      case .day314: return "\u{f008}"
      case .day321: return "\u{f00b}"
      case .day500: return "\u{f00b}"
      case .day501: return "\u{f008}"
      case .day502: return "\u{f008}"
      case .day503: return "\u{f008}"
      case .day504: return "\u{f008}"
      case .day511: return "\u{f006}"
      case .day520: return "\u{f009}"
      case .day521: return "\u{f009}"
      case .day522: return "\u{f009}"
      case .day531: return "\u{f00e}"
      case .day600: return "\u{f00a}"
      case .day601: return "\u{f0b2}"
      case .day602: return "\u{f00a}"
      case .day611: return "\u{f006}"
      case .day612: return "\u{f006}"
      case .day615: return "\u{f006}"
      case .day616: return "\u{f006}"
      case .day620: return "\u{f006}"
      case .day621: return "\u{f00a}"
      case .day622: return "\u{f00a}"
      case .day701: return "\u{f009}"
      case .day711: return "\u{f062}"
      case .day721: return "\u{f0b6}"
      case .day731: return "\u{f063}"
      case .day741: return "\u{f003}"
      case .day761: return "\u{f063}"
      case .day762: return "\u{f063}"
      case .day781: return "\u{f056}"
      case .day800: return "\u{f00d}"
      case .day801: return "\u{f000}"
      case .day802: return "\u{f000}"
      case .day803: return "\u{f000}"
      case .day804: return "\u{f00c}"
      case .day900: return "\u{f056}"
      case .day902: return "\u{f073}"
      case .day903: return "\u{f076}"
      case .day904: return "\u{f072}"
      case .day906: return "\u{f004}"
      case .day957: return "\u{f050}"
      case .night200: return "\u{f02d}"
      case .night201: return "\u{f02d}"
      case .night202: return "\u{f02d}"
      case .night210: return "\u{f025}"
      case .night211: return "\u{f025}"
      case .night212: return "\u{f025}"
      case .night221: return "\u{f025}"
      case .night230: return "\u{f02d}"
      case .night231: return "\u{f02d}"
      case .night232: return "\u{f02d}"
      case .night300: return "\u{f02b}"
      case .night301: return "\u{f02b}"
      case .night302: return "\u{f028}"
      case .night310: return "\u{f028}"
      case .night311: return "\u{f028}"
      case .night312: return "\u{f028}"
      case .night313: return "\u{f028}"
      case .night314: return "\u{f028}"
      case .night321: return "\u{f02b}"
      case .night500: return "\u{f02b}"
      case .night501: return "\u{f028}"
      case .night502: return "\u{f028}"
      case .night503: return "\u{f028}"
      case .night504: return "\u{f028}"
      case .night511: return "\u{f026}"
      case .night520: return "\u{f029}"
      case .night521: return "\u{f029}"
      case .night522: return "\u{f029}"
      case .night531: return "\u{f02c}"
      case .night600: return "\u{f02a}"
      case .night601: return "\u{f0b4}"
      case .night602: return "\u{f02a}"
      case .night611: return "\u{f026}"
      case .night612: return "\u{f026}"
      case .night615: return "\u{f026}"
      case .night616: return "\u{f026}"
      case .night620: return "\u{f026}"
      case .night621: return "\u{f02a}"
      case .night622: return "\u{f02a}"
      case .night701: return "\u{f029}"
      case .night711: return "\u{f062}"
      case .night721: return "\u{f0b6}"
      case .night731: return "\u{f063}"
      case .night741: return "\u{f04a}"
      case .night761: return "\u{f063}"
      case .night762: return "\u{f063}"
      case .night781: return "\u{f056}"
      case .night800: return "\u{f02e}"
      case .night801: return "\u{f022}"
      case .night802: return "\u{f022}"
      case .night803: return "\u{f022}"
      case .night804: return "\u{f086}"
      case .night900: return "\u{f056}"
      case .night902: return "\u{f073}"
      case .night903: return "\u{f076}"
      case .night904: return "\u{f072}"
      case .night906: return "\u{f024}"
      case .night957: return "\u{f050}"
      }
    }
  }

  init(condition: Int, iconString: String) {
    var rawValue: String

    // if iconString has 'n', it means night time.
    if iconString.range(of: "n") != nil {
      rawValue = "night" + String(condition)
    } else {
      // day time
      rawValue = "day" + String(condition)
    }

    guard let iconType = IconType(rawValue: rawValue) else {
      iconText = ""
      return
    }
    iconText = iconType.description
  }
}
// swiftlint:enable type_body_length
