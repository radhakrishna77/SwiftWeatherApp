


import Foundation
import CoreLocation

typealias WeatherCompletionHandler = (Weather?, [WeatherForecast]? ,SWError?) -> Void

protocol WeatherServiceProtocol {
  func retrieveWeatherInfo(_ location: CLLocation, completionHandler: @escaping WeatherCompletionHandler)
}
