/// Source:
/// https://www.hackingwithswift.com/books/ios-swiftui/adding-a-navigation-bar

import SwiftUI



struct AddingANavigationBar: View {
    
    // MARK: - Computed Properties
    
    var body: some View {
        
        NavigationView {
            Form {
                Text("Hello, World!")
            }
            .navigationTitle("We Split")
            .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.inline)
        }
    }
}





// MARK: - Previews

struct AddingANavigationBar_Previews: PreviewProvider {
    
    // MARK: - Computed Properties
    
    static var previews: some View {
        
        AddingANavigationBar()
    }
}
