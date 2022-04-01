/// Source:
/// https://www.hackingwithswift.com/books/ios-swiftui/binding-state-to-user-interface-controls

import SwiftUI



struct BindingState: View {
    
    // MARK: - Property Wrappers
    
    @State private var name: String = "Anonymous"
    
    
    // MARK: - Computed Properties
    
    var body: some View {
        
        Form {
            /// This tells Swift that it should read the value of the property
            /// but also write it back as any changes happen:
            TextField("Your name is:", text: $name)
            /// We don’t want a two-way binding here –
            /// — we want to read the value, yes,
            /// but we don’t want to write it back somehow,
            /// because that text view won’t change:
            Text("Hello, \(name)")
        }
    }
}




// MARK: - Previews

struct BindingState_Previews: PreviewProvider {
    
    static var previews: some View {
        
        BindingState()
    }
}
