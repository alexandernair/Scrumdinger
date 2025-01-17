//
//  DetailsEditView.swift
//  Scrumdinger
//
//  Created by Alex Nair on 1/20/25.
//

import SwiftUI

struct DetailsEditView: View {
    @State private var scrum = DailyScrum.emptyScrum
    @State private var newAttendeeName = ""
    var body: some View {
        Form{
            Section(header: Text("Meeting Info")){
                TextField("Title", text: $scrum.title )
            }
            HStack{
                Slider(value: $scrum.lengthInMinutesAsDouble,
                       in: 5...30, step: 1){
                    Text("Length")
                }
                .accessibilityValue("\(scrum.lengthInMinutes) minutes")
                Spacer()
                Text("\(scrum.lengthInMinutes) minutes")
                    .accessibilityHidden(true)
            }
            Section(header: Text("Attendees")){
                ForEach(scrum.attendees){
                    attendee in Text(attendee.name)
                }
                .onDelete { indices in
                    scrum.attendees.remove(atOffsets: indices)
                }
                HStack{
                    TextField("New Attendee", text: $newAttendeeName)
                    Button(action: {
                        withAnimation{
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            scrum.attendees.append(attendee)
                            newAttendeeName = ""
                        }
                    }){
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }
                    .disabled(newAttendeeName.isEmpty)
                }
            }
        }
    }
}

#Preview {
    DetailsEditView()
}
