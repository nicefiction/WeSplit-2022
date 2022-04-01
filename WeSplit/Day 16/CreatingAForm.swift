/// Source:
/// https://www.hackingwithswift.com/books/ios-swiftui/creating-a-form

import SwiftUI



struct CreatingAForm: View {
    
    // MARK: - Computed Properties
    
    var body: some View {
        
        Form {
            Section("intro") {
                Text("Hello, World!")
            }
            Section {
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
            }
        }
    }
}

struct CreatingAForm_Previews: PreviewProvider {
    static var previews: some View {
        CreatingAForm()
    }
}
