

import Foundation
import CoreLocation

import SwiftyJSON

struct OpenWeatherMapService: WeatherServiceProtocol {
  fileprivate let urlPath = "http://api.openweathermap.org/data/2.5/forecast"

  fileprivate func getFirstFourForecasts(_ json: JSON) -> [Forecast] {
    var forecasts: [Forecast] = []

    for index in 0...3 {
      guard let forecastTempDegrees = json["list"][index]["main"]["temp"].double,
        let rawDateTime = json["list"][index]["dt"].double,
        let forecastCondition = json["list"][index]["weather"][0]["id"].int,
        let pressure = json["list"][index]["main"]["pressure"].double,
        let humidity = json["list"][index]["main"]["humidity"].double,
        let forecastIcon = json["list"][index]["weather"][0]["icon"].string else {
          break
      }

      let country = json["city"]["country"].string
      let forecastTemperature = Temperature(country: country!,
        openWeatherMapDegrees: forecastTempDegrees)
      let forecastTimeString = ForecastDateTime(rawDateTime).shortTime
      let weatherIcon = WeatherIcon(condition: forecastCondition, iconString: forecastIcon)
      let forcastIconText = weatherIcon.iconText
        let foreCastPressure = "P: \(pressure)mb"
        let forecastHumidity = "H: \(humidity)%"

      let forecast = Forecast(time: forecastTimeString,
                          iconText: forcastIconText,
                       temperature: forecastTemperature.degrees,
                       pressure: foreCastPressure, humidity: forecastHumidity)

      forecasts.append(forecast)
    }

    return forecasts
  }

  func retrieveWeatherInfo(_ location: CLLocation, completionHandler: @escaping WeatherCompletionHandler) {
    let sessionConfig = URLSessionConfiguration.default
    let session = URLSession(configuration: sessionConfig)

    guard let url = generateRequestURL(location) else {
      let error = SWError(errorCode: .urlError)
      completionHandler(nil, nil, error)
      return
    }

    print(url)
    let task = session.dataTask(with: url) { (data, response, error) in
      // Check network error
      guard error == nil else {
       let weatherForeCastModel =  CoreDataStack.sharedInstance.fetchRequestFromDb()
        let error = SWError(errorCode: .networkRequestFailed)
        completionHandler(nil, weatherForeCastModel, error)
        
        return
      }
      
      // Check JSON serialization error
      guard let data = data else {
        let error = SWError(errorCode: .jsonSerializationFailed)
        completionHandler(nil, nil, error)
        return
      }

      guard let json = try? JSON(data: data) else {
        let error = SWError(errorCode: .jsonParsingFailed)
        completionHandler(nil, nil, error)
        return
      }

      // Get temperature, location and icon and check parsing error
      guard let tempDegrees = json["list"][0]["main"]["temp"].double,
        let country = json["city"]["country"].string,
        let city = json["city"]["name"].string,
        let weatherCondition = json["list"][0]["weather"][0]["id"].int,
        let pressure = json["list"][0]["main"]["pressure"].double,
        let humidity = json["list"][0]["main"]["humidity"].double,
        let iconString = json["list"][0]["weather"][0]["icon"].string else {
          let error = SWError(errorCode: .jsonParsingFailed)
          completionHandler(nil, nil, error)
          return
      }

      var weatherBuilder = WeatherBuilder()
      let temperature = Temperature(country: country, openWeatherMapDegrees:tempDegrees)
      weatherBuilder.temperature = temperature.degrees
      weatherBuilder.location = city
        let pressureString = "P: \(pressure)mb"
        let humidityString = "H: \(humidity)%"
        weatherBuilder.pressure = pressureString
        weatherBuilder.humidity = humidityString

      let weatherIcon = WeatherIcon(condition: weatherCondition, iconString: iconString)
      weatherBuilder.iconText = weatherIcon.iconText

      weatherBuilder.forecasts = self.getFirstFourForecasts(json)

    CoreDataStack.sharedInstance.saveWeatherForcaste(with: weatherBuilder)
        
      completionHandler(weatherBuilder.build(), nil, nil)
        
    }

    task.resume()
  }

  fileprivate func generateRequestURL(_ location: CLLocation) -> URL? {
    guard var components = URLComponents(string:urlPath) else {
      return nil
    }

    // get appId from Info.plist
    let filePath = Bundle.main.path(forResource: "Info", ofType: "plist")!
    let parameters = NSDictionary(contentsOfFile:filePath)
    let appId = parameters!["OWMAccessToken"]! as! String

    let latitude = String(location.coordinate.latitude)
    let longitude = String(location.coordinate.longitude)

    components.queryItems = [URLQueryItem(name:"lat", value:latitude),
                             URLQueryItem(name:"lon", value:longitude),
                             URLQueryItem(name:"appid", value:appId)]

    return components.url
  }
}
