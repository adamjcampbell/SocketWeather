import Foundation

private let baseUrl = "https://api.weather.bom.gov.au/v1/"

typealias GeoHash = String

func getObservations(geoHash: GeoHash) {
  let url = URL(string: baseUrl + "locations/\(geoHash)/observations")!

  let task = URLSession.shared.dataTask(with: url) { data, _, _ in
    let dataString = data.flatMap { String(data: $0, encoding: .utf8) }
    print(dataString as Any)
  }

  task.resume()
}
