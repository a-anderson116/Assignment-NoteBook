//
//  AddAssignment.swift
//  Assignment NoteBook
//
//  Created by Alex Anderson on 2/9/23.
//

import SwiftUI

struct AddAssignment: View {
    @ObservedObject var assignment: AssignmentNotebook
    @State private var importance = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @Environment(\.presentationMode) var presentationMode
    static let importances = [ "Math", "Social Studies", "Sciences", "Computer Science", "English", "Foreign Language"]
    var body: some View {
        ZStack
        {
            NavigationView{
                Form{
                    Picker("importance", selection: $importance){
                        ForEach(Self.importances, id: \.self){
                            importance in Text(importance)
                        }
                    }
                    TextField("Description", text: $description)
                    DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                }
                .navigationBarTitle("Add New Assignment", displayMode: .inline)
                .navigationBarItems(trailing: Button("Save"){
                    if importance.count > 0 && description.count > 0{
                        let Assignment = Assignment(id: UUID(), importance: importance, description: description, dueDate: dueDate)
                        assignment.Assignments.append(Assignment)
                        presentationMode.wrappedValue.dismiss()
                    }
                })
                .accentColor(.cyan)
                .background(Color.mint)
            }
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddAssignment(assignment: AssignmentNotebook())
    }
}
