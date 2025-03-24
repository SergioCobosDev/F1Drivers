import SwiftUI

@main
struct DriversApp: App {
    var body: some Scene {
        WindowGroup {
            DriversView(drivers: try! Drivers.cargar())
        }
    }
}
