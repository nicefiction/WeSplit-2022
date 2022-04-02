import SwiftUI



struct ContentView: View {
    
    // MARK: - PROPERTY WRAPPERS
    
    @State private var checkAmount: Double = 0.00
    @State private var selectedNumberOfParticipants: Int = 0
    @State private var selectedTipPercentage: Int = 15
    /// `@FocusState` STEP 1
    @FocusState private var checkAmountInputFieldIsActive: Bool
    
    
    
    // MARK: - Properties
    
    var tipPercentages: Array<Int> = [
        5, 10, 15, 20, 25
    ]
    
    
    
    // MARK: - Computed Properties
    
    var calculatedAmount: Double {
        
        /// STEP 1
        let numberOfParticipants: Double = Double(selectedNumberOfParticipants + 2)
        /// STEP 2
        let tipSelection: Double = Double(selectedTipPercentage) / 100
        let tipAmount: Double = checkAmount * tipSelection
        let grandTotal = checkAmount + tipAmount
        /// STEP 3
        let billPerParticipant = grandTotal / numberOfParticipants
        /// STEP 4
        return billPerParticipant
    }
    
    
    var body: some View {
        
        NavigationView {
            Form {
                Section("Start amount") {
                    TextField("Enter your amount:",
                              value: $checkAmount,
                              format: .currency(code: Locale.current.currencyCode ?? "EUR"))
                    .keyboardType(UIKeyboardType.decimalPad)
                    /// `@FocusState` STEP 2
                    .focused($checkAmountInputFieldIsActive)
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
                        ForEach(tipPercentages,
                                id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Tip percentage")
                }
                Section {
                    Text(calculatedAmount,
                         format: .currency(code: Locale.current.currencyCode ?? "EUR"))
                }
            }
            .navigationTitle("We Split")
            /// `@FocusState` STEP 3
            .toolbar {
                ToolbarItemGroup(placement: ToolbarItemPlacement.keyboard) {
                    Spacer()
                    Button("Done") {
                        checkAmountInputFieldIsActive = false
                    }
                }
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
