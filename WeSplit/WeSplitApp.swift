///  If you create something when the app launches
///  and keep it alive the entire time,
///  you’ll put it here.

import SwiftUI

@main
struct WeSplitApp: App {
    var body: some Scene {
        WindowGroup {
            // ContentView()
            AddingANavigationBar()
        }
    }
}