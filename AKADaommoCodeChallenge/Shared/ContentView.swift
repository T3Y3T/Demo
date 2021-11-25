//
//  ContentView.swift
//  Shared
//
//  Created by tongtong on 11/23/21.
//

import SwiftUI
import CoreData
import UIKit

struct ContentView: View {

    @Environment(\.managedObjectContext) private var viewContext
  
    @FetchRequest(
      sortDescriptors: [NSSortDescriptor(keyPath: \PostItem.createdAt, ascending: true)],
        animation: .default)
    private var items: FetchedResults<PostItem>
    
    
    let agenda = Bundle.main.decode([MeetingSection].self, from: "agenda.json")
  
    var body: some View {
      NavigationView{
        VStack (alignment: .center){
            Text("Meetings")
              Form {
                  HStack {
                    Text("Date")
                      .font(.subheadline)
                      .fontWeight(.bold)
                      .foregroundColor(Color.purple)
                    Spacer()
                    Text("Link")
                      .font(.subheadline)
                      .fontWeight(.bold)
                      .foregroundColor(Color.purple)
                      .multilineTextAlignment(.leading)
                    Spacer()
                    Text("Presenter")
                      .font(.subheadline)
                      .fontWeight(.bold)
                      .foregroundColor(Color.purple)
                  }
                List {
                  ForEach (agenda) { section in
                    Section(header: Text(section.topic)) {
                      ForEach(section.items) { item in
                        NavigationLink(destination: Text(item.name)) {
                          ItemRow(item: item)
                        }
                      }
                    }
                  }
                  HStack {
                    Text("11/23/2021")
                      .font(.body)
                      .fontWeight(.regular)
                      .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.407))
                      .multilineTextAlignment(.leading)
                    Spacer()
                    Text("https://developer.apple.com/tutorials/swiftui/creating-and-combining-views")
                      .font(.body)
                      .fontWeight(.regular)
                      .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.407))
                      .multilineTextAlignment(.leading)
                    Spacer()
                    Text("Tongtong Liu; Andy Lu; Wei Li")
                      .font(.body)
                      .fontWeight(.regular)
                      .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.407))
                      .multilineTextAlignment(.leading)
                  }
                }
              }
            }
        .padding()
        .navigationBarTitle(Text("Agenda"))
        .listStyle(GroupedListStyle())
      }
    }
  
  

    private func addItem() {
        withAnimation {
            let newItem = PostItem(context: viewContext)
            newItem.name = "String"
          
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
          ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext).previewInterfaceOrientation(.portrait)
       }
    }
}
