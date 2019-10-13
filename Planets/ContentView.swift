//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AppViewModel

    var body: some View {
        NavigationView {
            List(viewModel.planets) {
                PlanetRowView(planet: $0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PlanetRowView: View {
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
        VStack(alignment: .leading, spacing: 16) {
            RemoteImage(url: planet.image)
                .clipShape(Circle())
                .shadow(radius: 20)
                .frame(width: 248, height: 248)
            
            Text("Mass: \(String(format: "%.02e", planet.mass))")
            Text("Distance: \(planet.orbitalDistanceInKm) KM")
            Text("Period: \(String(format: "%.02f", planet.orbitalPeriodInDays)) days")
            Text("Temperature Range: \(planet.surfaceTemperatureInCelsius.lowerBound) to \(planet.surfaceTemperatureInCelsius.upperBound)")
        }.navigationBarTitle(planet.name)
    }
}
