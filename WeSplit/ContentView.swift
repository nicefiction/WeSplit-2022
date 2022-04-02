import SwiftUI



struct ContentView: View {
    
    // MARK: - PROPERTY WRAPPERS
    
    @State private var amount: Double = 0.00
    
    
    
    // MARK: - Computed Properties
    
    var body: some View {
        
        Form {
            Section {
                TextField("Enter your amount:",
                          value: $amount,
                          format: .currency(code: Locale.current.currencyCode ?? "USD"))
                .padding()
                .keyboardType(UIKeyboardType.decimalPad)
            }
            Section {
                Text(amount,
                     format: .currency(code: Locale.current.currencyCode ?? "USD"))
            }
        }
    }
}





// MARK: - Previews

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView()
    }
}
