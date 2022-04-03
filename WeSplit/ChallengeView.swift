/// Source:
/// https://www.hackingwithswift.com/100/swiftui/18

import SwiftUI



struct ChallengeView: View {
    
    // MARK: - Property Wrappers
    @State private var billAmount: Double = 0.00
    @State private var selectedNumberOfParticipants: Int = 2
    @State private var selectedTipPercentage: Int = 10
    
    @FocusState private var billAmountInputFieldIsSelected: Bool
    
    
    // MARK: - Properties
    let tipPercentages: Array<Int> = [
        5, 10, 15, 20, 25
    ]
    
    
    // MARK: - Computed Properties
    var calculatedTipPercentage: Double {
        
        let tipPercentage: Double = Double(selectedTipPercentage) / 100
        return tipPercentage
    }
    
    
    var calculatedNumberOfParticipants: Double {
        
        let numberOfParticipants: Double = Double(selectedNumberOfParticipants + 2)
        return numberOfParticipants
    }
    
    
    var calculatedTipAmount: Double {
        
        let tipAmount: Double = billAmount * calculatedTipPercentage
        return tipAmount
    }
    
    
    var calculatedContribution: Double {
        
        let yourContribution: Double = (billAmount + calculatedTipAmount) / calculatedNumberOfParticipants
        return yourContribution
    }
    
    
    var calculatedTotalBillWithTipIncluded: Double {
        
        let totalBillWithTip: Double = billAmount + calculatedTipAmount
        return totalBillWithTip
    }
    
    
    var body: some View {
        
        NavigationView {
            Form {
                Section(header: Text("bill")) {
                    TextField("Bill amount.",
                              value: $billAmount,
                              format: .currency(code: Locale.current.currencyCode ?? "EUR"))
                    Picker("Number of participants.",
                           selection: $selectedNumberOfParticipants) {
                        ForEach(2..<10) {
                            Text("\($0)")
                        }
                    }
                }
                .focused($billAmountInputFieldIsSelected)
                
                Section(header: Text("Tip percentage.")) {
                    Picker("Select your tip percentage.",
                           selection: $selectedTipPercentage) {
                        ForEach(tipPercentages,
                                id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section(header: Text("Total bill")) {
                    Text(calculatedTotalBillWithTipIncluded,
                         format: .currency(code: Locale.current.currencyCode ?? "EUR"))
                }
                
                Section {
                    Text(calculatedContribution,
                         format: .currency(code: Locale.current.currencyCode ?? "EUR"))
                } header: {
                    Text("Your contribution")
                }
            }
            .navigationTitle("We Split")
            .keyboardType(.numberPad)
            .toolbar {
                ToolbarItemGroup(placement: ToolbarItemPlacement.keyboard) {
                    Spacer()
                    Button("Done",
                           action: {
                        billAmountInputFieldIsSelected.toggle()
                    })
                }
            }
        }
    }
}





// MARK: - Previews

struct ChallengeView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ChallengeView()
    }
}
