import SwiftUI

struct TodoRow: View {
    @Binding var todo: String
    @Binding var isTextFieldVisible: Bool

    var body: some View {
        HStack {
            Button(action: {
                isTextFieldVisible.toggle()
            }) {
                Circle()
                    .stroke(Color.yellow, lineWidth: 2)
                    .frame(width: 20, height: 20)
                    .padding(.trailing, 8)
            }
            if isTextFieldVisible {
                TextField("", text: $todo)
                    .font(.headline)
                    .foregroundColor(.yellow)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .cornerRadius(8)
                    .padding(.vertical, 4)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

struct ContentView: View {
    @State private var todos: [String] = []
    @State private var isTextFieldVisibleArray: [Bool] = []

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                Text("Todoey")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.yellow)
                    .padding(.top)
                    .padding(.leading)

                ForEach(todos.indices, id: \.self) { index in
                    TodoRow(todo: $todos[index], isTextFieldVisible: $isTextFieldVisibleArray[index])
                        .padding(.horizontal)
                        .padding(.vertical, 4)
                    Divider().background(Color.gray)
                }

                Spacer()

                HStack {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.yellow)
                        .font(.title2)
                    Text("New Reminder")
                        .font(.headline)
                        .foregroundColor(.yellow)
                    Spacer()
                }
                .padding()
                .onTapGesture {

                    todos.append("")
                    isTextFieldVisibleArray.append(true)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
