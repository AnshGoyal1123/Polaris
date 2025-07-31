//
//  AddHabitView.swift
//  Polaris
//
//  Created by Ansh Goyal on 7/30/25.
//

import SwiftUI

struct AddHabitView: View{
    @Environment(\.dismiss) var dismiss
    
    @State private var title: String = ""
    @State private var selectedPillar: PillarType = .lifeSupport
    
    var onSave: (Habit) -> Void
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Habit Tite")){
                    TextField("e.g. Meditate for 10 mins", text: $title)
                }
                Section(header: Text("Pillar")){
                    Picker("Select Pillar", selection: $selectedPillar){
                        ForEach(PillarType.allCases, id: \.self) {pillar in Text(pillar.rawValue).tag(pillar)
                        }
                    }
                    .pickerStyle(.wheel)
                }
            }
            .navigationTitle(Text("Add Habit"))
                .toolbar {
                    ToolbarItem(placement: .confirmationAction){
                        Button("Save") {
                            let newHabit = Habit(title: title, pillar: selectedPillar, isCompleted: false)
                            onSave(newHabit)
                            dismiss()
                        }
                    }
                }
        }
    }
}
