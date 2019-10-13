//

import Foundation

/// A planet, is any body orbiting a start that has cleared its orbital path (sorry pluto)
struct Planet: Identifiable, Hashable {
    var id: UInt { return order }
    let order: UInt
    let name: String
    let equatorialDiametreInKm: Int64?
    let polarDiametreInKm: Int64?
    let mass: Double
    let orbitalDistanceInKm: Int64
    let orbitalPeriodInDays: Double
    let surfaceTemperatureInCelsius: ClosedRange<Int>
}

func loadPlanets() -> [Planet] { // this could easily come from a json file or something.
    return [
        Planet(order: 1,
               name: "Mercury",
               equatorialDiametreInKm: nil,
               polarDiametreInKm: nil,
               mass: 3.29*pow(10, 23),
               orbitalDistanceInKm: 57909227,
               orbitalPeriodInDays: 88,
               surfaceTemperatureInCelsius: -173...427),
        Planet(order: 2,
               name: "Venus",
               equatorialDiametreInKm: nil,
               polarDiametreInKm: nil,
               mass: 4.87*pow(10, 24),
               orbitalDistanceInKm: 108209475,
               orbitalPeriodInDays: 225,
               surfaceTemperatureInCelsius: -462...465),
        Planet(order: 3,
               name: "Earth",
               equatorialDiametreInKm: 12756,
               polarDiametreInKm: 12714,
               mass: 5.97*pow(10, 24),
               orbitalDistanceInKm: 149598262,
               orbitalPeriodInDays: 365.24,
               surfaceTemperatureInCelsius: -88...58),
        Planet(order: 4,
               name: "Mars",
               equatorialDiametreInKm: nil,
               polarDiametreInKm: nil,
               mass: 6.39*pow(10, 23),
               orbitalDistanceInKm: 227943824,
               orbitalPeriodInDays: 687,
               surfaceTemperatureInCelsius: (-87)...(-5)),
    ]
}
