import Foundation

private let baseUrl = "https://api.weather.bom.gov.au/v1/"

struct Envelope<T: Decodable>: Decodable {
  let data: T
}

struct CurrentObservations: Decodable {
  let temp: Float
  let temp_feels_like: Float
}

typealias GeoHash = String

func getObservations(
  geoHash: GeoHash,
  completion: @escaping (Result<CurrentObservations, Never>) -> Void
) {
  let url = URL(string: baseUrl + "locations/\(geoHash)/observations")!

  let task = URLSession.shared.dataTask(with: url) { data, _, _ in
    let response = data.flatMap {
      try? JSONDecoder().decode(Envelope<CurrentObservations>.self, from: $0)
    }

    if let observations = response?.data {
      completion(.success(observations))
    }
  }

  task.resume()
}
