//
//  EditUserView.swift
//  SwiftDataProject
//
//  Created by kalyan on 2/21/26.
//
import SwiftData
import SwiftUI

struct EditUserView: View {
    @Bindable var user : User
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form{
            TextField("enter your name", text: $user.name)
            TextField("Enter your city", text: $user.city)
            DatePicker("Join Date" , selection: $user.joinDate)
            
            Button("done"){
                dismiss()}
           
        }
        .navigationTitle("Edit user")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    do{
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: User.self, configurations: config)
        let user = User(name: "mikey", city: "Austin", joinDate: .now)
        return EditUserView(user: user).modelContainer(container)
    }catch{
        return Text("sorry there is an error loading your preview\(error.localizedDescription)")
    }
}
