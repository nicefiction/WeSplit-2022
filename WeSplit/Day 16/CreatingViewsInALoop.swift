/// Source:
/// https://www.hackingwithswift.com/books/ios-swiftui/creating-views-in-a-loop
/// NOTE:
/// `ForEach` doesn’t get hit by the 10-view limit that would affect us if we had typed the views by hand.

import SwiftUI



struct CreatingViewsInALoop: View {
    
    
    // MARK: - Property Wrappers
    
    @State private var selectedStudent: String = "Glinda"
    
    
    // MARK: - Properties
    /// The `students` array doesn’t need to be marked with `@State`
    /// because it’s a constant; it isn’t going to change.
    let students: Array<String> = [
        "Dorothy", "Glinda", "Ozma", "Olivia"
    ]
    
    
    // MARK: - Computed Properties
    
    var body: some View {
        
        NavigationView {
            Form {
                Picker("Select a student from the list:",
                       selection: $selectedStudent) {
                    ForEach(students,
                            id: \.self) { (student: String) in
                        Text(student)
                    }
                }
                ForEach(1..<6) {
                    Text("Row \($0)")
                }
            }
            .navigationTitle("Students")
        }
    }
}




// MARK: - Previews
struct CreatingViewsInALoop_Previews: PreviewProvider {
    
    static var previews: some View {
        
        CreatingViewsInALoop()
    }
}
