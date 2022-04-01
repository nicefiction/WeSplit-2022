/// Source:
/// https://www.hackingwithswift.com/books/ios-swiftui/modifying-program-state

import SwiftUI



struct ModifyingProgramState: View {
    
    // MARK: - Property Wrappers
    
    @State private var tapCount: Int = 0
    
    
    
    // MARK: - Computed Properties
    
    var body: some View {
        
        Form {
            Button("Tap Up: \(tapCount)") {
                self.tapCount += 1
            }
            
            Button("Tap Down: \(tapCount)") {
                self.tapCount -= 1
            }
        }
    }
}




// MARK: - Previews

struct ModifyingProgramState_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ModifyingProgramState()
    }
}
