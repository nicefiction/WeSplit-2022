import SwiftUI



struct ContentView: View {
    
    // MARK: - PROPERTY WRAPPERS
    
    @State private var checkAmount: Double = 0.00
    @State private var selectedNumberOfParticipants: Int = 0
    @State private var selectedTipPercentage: Int = 15
    
    
    
    // MARK: - Properties
    
    var tipPercentages: Array<Int> = [
        5, 10, 15, 20, 25
    ]
    
    
    
    // MARK: - Computed Properties
    
    var body: some View {
        
        NavigationView {
            Form {
                Section("Start amount") {
                    TextField("Enter your amount:",
                              value: $checkAmount,
                              format: .currency(code: Locale.current.currencyCode ?? "EUR"))
                    .keyboardType(UIKeyboardType.decimalPad)
                    Picker("Divided by",
                           selection: $selectedNumberOfParticipants) {
                        ForEach(2..<10) {
                            Text("\($0)")
                        }
                    }
                }
                Section {
                    Picker("Select the tip percentage you want to give.",
                           selection: $selectedTipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text("\($0)")
                        }
                    }
                           .pickerStyle(.segmented)
                } header: {
                    Text("Tip percentage")
                }
                Section {
                    Text(checkAmount,
                         format: .currency(code: Locale.current.currencyCode ?? "EUR"))
                }
    //            Section {
    //                Text(Decimal.FormatStyle.Currency.FormatInput(amount),
    //                     format: Decimal.FormatStyle.Currency.currency(code: Locale.current.currencyCode ?? "EUR"))
    //            }
            }
            .navigationTitle("We Split")
        }
    }
}

/*
 Picker("Number of people", selection: $numberOfPeople) {
         ForEach(2 ..< 100) {
             Text("\($0) people")
         }
     }
 */



// MARK: - Previews

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView()
    }
}
