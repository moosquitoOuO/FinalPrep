import SwiftUI

@main
struct FinalPrepApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Tempreture.self)
    }
}

