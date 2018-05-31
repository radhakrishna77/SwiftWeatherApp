

import Foundation

struct ForecastViewModel {
  let time: Observable<String>
  let iconText: Observable<String>
  let temperature: Observable<String>
    let pressure: Observable<String>
    let humidity: Observable<String>

  init(_ forecast: Forecast) {
    time = Observable(forecast.time)
    iconText = Observable(forecast.iconText)
    temperature = Observable(forecast.temperature)
    pressure = Observable(forecast.pressure)
    humidity = Observable(forecast.humidity)
  }
}
