//

import SwiftUI

struct ContentView: View {
    let planets: [Planet] // you don't need to initialise this if
    // you are expecting to pass this data around.

    var body: some View {
        NavigationView {
            List(planets) {
                PlanetCell(planet: $0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(planets: loadPlanets().filter({ $0.order < 3 }))
    }
}

struct PlanetCell: View {
    let planet: Planet

    var body: some View {
        NavigationLink(destination: PlanetDetails(planet: planet)) {
            Text(planet.name)
        }
    }
}

struct PlanetDetails: View {
    let planet: Planet

    var body: some View {
        VStack {
            Circle()
                .fill(Color.orange)
                .shadow(radius: 20)
                .frame(width: 300, height: 300)
            Text("Name: \(planet.name)")
            Text("Mass: \(planet.mass)")
            Text("Distance: \(planet.orbitalDistanceInKm) KM")
            Text("Period: \(planet.orbitalPeriodInDays) days")
            Text("Temperature Range: \(planet.surfaceTemperatureInCelsius.lowerBound) to \(planet.surfaceTemperatureInCelsius.upperBound)")
        }.navigationBarTitle(planet.name)
    }
}
