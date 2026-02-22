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
    @State private var path = [User]()
    
        
    var body: some View {
        NavigationStack(path: $path) {
            List(users){ user in
                NavigationLink(value: user){
                    Text(user.name)
                }
            }.navigationTitle("users")
                .navigationDestination(for: User.self){ user in
                    EditUserView(user: user)
                    
                }
                .toolbar{
                    Button("add", systemImage: "plus"){
                        let user = User(name: "", city: "", joinDate: .now)
                            modelContext.insert(user)
                        path = [user]
                    }
                }
            
        }
        .padding()
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
