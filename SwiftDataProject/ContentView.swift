//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by kalyan on 2/21/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \User.name) var users: [User]
    
    
        
    var body: some View {
        NavigationStack {
            List(users){ user in
                NavigationLink(value: user){
                    Text(user.name)
                }
            }.navigationTitle("users")
                .toolbar{
                    Button("Add Samples", systemImage: "plus"){
                    try? modelContext.delete(model : User.self)
                        let firstUser = User(name: "Ed sheeran", city: "Newyork", joinDate: .now.addingTimeInterval(86400 * -10))
                        let secondUser = User(name: "Rihanna", city: "Las vegas", joinDate: .now.addingTimeInterval(86400 * -5))
                        let thirdUser = User(name: "Bad Bunny", city: "Austin", joinDate: .now.addingTimeInterval(86400 * 5))
            
                            modelContext.insert(firstUser)
                            modelContext.insert(secondUser)
                            modelContext.insert(thirdUser)
                       
                    }
                }
                }
        }
    }


#Preview {
    do{
        
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: User.self, configurations: config)
        
        return ContentView()
        .modelContainer(container)}
    catch{
        return Text("something went wromg")
    }
}
