import SwiftUI

struct DriversView: View {
    let drivers: [Driver]
    
    var body: some View {
        List {
            ForEach(drivers) { driver in
                DriverRowView(driver: driver)
            }
        }
    }
}

struct DriverRowView: View {
    let driver: Driver
    
    var body: some View {
        ZStack {
//            Text(driver.equipo)
//                .textCase( .uppercase)
//                .bold()
//                .padding(5)
//                .overlay {
//                    Capsule()
//                        .stroke(style:
//                                .init(lineWidth: 2))
//                }
//                .foregroundStyle(Color(.blue))
//                .rotationEffect(.degrees(-25))
//                .opacity(0.25)
            
            HStack {
                Image("drivers/\(driver.imagen)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 52)
                    .clipShape(.circle)
                
                VStack(alignment: .leading) {
                    Text("\(driver.nombre)")
                        .font(.title)
                        .lineLimit(1)
                    Text(driver.nacionalidad)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                if let team = F1Team.from(teamName: driver.equipo) {
                    Image(team.logoName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                }
                
                Text("Edad: \(driver.edad)")
            }
        }
    }
}

#Preview {
    DriversView(drivers: try! Drivers.cargar())
}
