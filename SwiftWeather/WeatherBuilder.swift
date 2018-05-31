

import Foundation

struct WeatherBuilder {
  var location: String?
  var iconText: String?
  var temperature: String?
    var pressure: String?
    var humidity: String?

  var forecasts: [Forecast]?

  func build() -> Weather {
    return Weather(location: location!,
                      iconText: iconText!,
                      temperature: temperature!,
                      pressure: pressure!,
                      humidity: humidity!,
                     forecasts: forecasts!)
  }
}
