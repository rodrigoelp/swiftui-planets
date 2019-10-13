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
    let image: URL?
}
