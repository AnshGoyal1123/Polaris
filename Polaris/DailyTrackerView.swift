//
//  DailyTrackerView.swift
//  Polaris
//
//  Created by Ansh Goyal on 7/28/25.
//



import SwiftUI

struct Habit: Identifiable {
    let id = UUID()
    let title: String
    let pillar: PillarType
    var isCompleted: Bool
}

enum PillarType: String, CaseIterable {
    case lifeSupport = "Life Support"
    case navigation = "Navigation"
    case explorationBay = "Exploration Bay"
    case crewQuarters = "Crew Quarters"
    case propulsion = "Propulsion"
}

struct DailyTrackerView: View {
    @State private var habits: [Habit] = [
        Habit(title: "Drink Water", pillar: .lifeSupport, isCompleted: false),
        Habit(title: "Workout", pillar: .lifeSupport, isCompleted: false),
        Habit(title: "Apply to 1 Job", pillar: .navigation, isCompleted: false),
        Habit(title: "Learn Swift", pillar: .navigation, isCompleted: false),
        Habit(title: "Read 30 mins", pillar: .explorationBay, isCompleted: false),
        Habit(title: "Call Family", pillar: .crewQuarters, isCompleted: false),
        Habit(title: "Do a kind act", pillar: .propulsion, isCompleted: false)
    ]
    
    @State private var showingAddHabit = false

    var body: some View {
        NavigationView {
            List {
                ForEach(PillarType.allCases, id: \.self) { pillar in
                    Section(header: Text(pillar.rawValue)) {
                        ForEach(habits.indices.filter { habits[$0].pillar == pillar }, id: \.self) { index in
                            HStack {
                                Text(habits[index].title)
                                Spacer()
                                Toggle("", isOn: $habits[index].isCompleted)
                                    .labelsHidden()
                            }
                        }
                    }
                }

                let total = habits.count
                let completed = habits.filter { $0.isCompleted }.count
                let progress = total == 0 ? 0 : Double(completed) / Double(total)

                Section {
                    VStack(alignment: .leading) {
                        Text("Thrust Generated: \(Int(progress * 100))%")
                        ProgressView(value: progress)
                    }
                    .padding(.vertical)
                }
            }
            .navigationTitle("Thrust")
            .navigationBarItems(trailing:
                Button(action: {
                    showingAddHabit = true
                }) {
                    Image(systemName: "plus")
                }
            )
            .sheet(isPresented: $showingAddHabit) {
                AddHabitView { newHabit in
                    habits.append(newHabit)
                }
            }
        }
    }
}
