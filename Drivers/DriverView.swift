import SwiftUI

struct DriverFixedRowView: View {
    var body: some View {
        ZStack {
            Text("MacLaren")
                .textCase( .uppercase)
                .bold()
                .padding(5)
                .overlay {
                    Capsule()
                        .stroke(style:
                                .init(lineWidth: 2))
                }
                .foregroundStyle(Color(.blue))
                .rotationEffect(.degrees(-25))
                .opacity(0.25)
            
            HStack {
                Image(.Drivers.oscarPiastri2025)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 52)
                    .clipShape(.circle)
                
                VStack(alignment: .leading) {
                    Text("Oscar **Piastri**")
                        .font(.title)
                    Text("Australiano")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Edad: \(22)")
            }
        }
    }
}

struct DriverVariableRowView: View {
    let driver: DriverF1
    
    var body: some View {
        ZStack {
            Text(driver.team)
                .textCase( .uppercase)
                .bold()
                .padding(5)
                .overlay {
                    Capsule()
                        .stroke(style:
                                .init(lineWidth: 2))
                }
                .foregroundStyle(Color(.blue))
                .rotationEffect(.degrees(-25))
                .opacity(0.25)
            
            HStack {
                Image(.Drivers.maxVerstappen2025)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 52)
                    .clipShape(.circle)
                
                VStack(alignment: .leading) {
                    Text("\(driver.name) **\(driver.surname)**")
                        .font(.title)
                    Text(driver.country)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                if let team = F1Team.from(teamName: driver.team) {
                    Image(team.logoName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                }
                
                Text("Edad: \(driver.age)")
            }
        }
    }
}

struct DriverF1 {
    let name: String
    let surname: String
    let team: String
    let age: Int
    let country: String
    let image: String
}

let verstappen = DriverF1(
    name: "Max",
    surname: "Verstappen",
    team: "Red Bull Racing",
    age: 27,
    country: "Holandés",
    image: "verstappen")

enum F1Team: String, CaseIterable {
    case redbull = "Red Bull Racing"
    case ferrari = "Ferrari"
    case mercedes = "Mercedes"
    case mcLaren = "McLaren"
    case williams = "Williams"
    case haas = "Haas"
    case astonmartin = "Aston Martin"
    case kicksauber = "Kick Sauber"
    case racingbulls = "Racing Bulls"
    
    var logoName: String {
        switch self {
        case .redbull:
            return "f1teams/red-bull-racing-logo"
        case .ferrari:
            return "f1teams/ferrari-logo"
        case .mercedes:
            return "f1teams/mercedes-logo"
        case .mcLaren:
            return "f1teams/mclaren-logo"
        case .williams:
            return "f1teams/williams-logo"
        case .haas:
            return "f1teams/haas-logo"
        case .astonmartin:
            return "f1teams/aston-martin-logo"
        case .kicksauber:
            return "f1teams/kick-sauber-logo"
        case .racingbulls:
            return "f1teams/racing-bulls-logo"
        }
    }
    
    static func from(teamName: String) -> F1Team? {
        return F1Team.allCases.first { $0.rawValue == teamName }
    }
}




#Preview {
    List {
        DriverFixedRowView()
        
        DriverVariableRowView(driver: verstappen)
    }
    .listStyle(.plain)
}
