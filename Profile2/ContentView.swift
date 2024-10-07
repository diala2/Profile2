//
//  ContentView.swift
//  Balance
//
//  Created by Diala Abdulnasser Fayoumi on 26/03/1446 AH.
//
import SwiftUI

struct ContentView: View {
    @State private var choicmade = "options"
    @State private var selectedCategory: String? // Track the selected category
    @State private var amounts: [String: Int] = ["Food": 0, "Education": 0, "Transportation": 0, "Others": 0] // Dictionary to hold amounts
    @State private var showInput = false // State to control input visibility
    var goal: String

    private var totalBalance: Int {
        amounts.values.reduce(0, +) // Sum all amounts in the dictionary
    }
    
    // Calculate remaining days in the current month
    private var remainingDays: Int {
        let calendar = Calendar.current
        let today = Date()
        guard let endOfMonth = calendar.date(byAdding: .month, value: 1, to: calendar.date(from: calendar.dateComponents([.year, .month], from: today))!) else {
            return 0
        }
        return calendar.dateComponents([.day], from: today, to: endOfMonth).day ?? 0
    }

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    // Top Card Section with Bubbles
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                            .fill(Color.blue)
                            .frame(width: 360, height: 300)

                        // Adding Bubbles to Background
                        Circle()
                            .fill(Color.white.opacity(0.1))
                            .frame(width: 50, height: 50)
                            .offset(x: 150, y: -100)

                        Circle()
                            .fill(Color.white.opacity(0.1))
                            .frame(width: 50, height: 50)
                            .offset(x: -100, y: 80)

                        Circle()
                            .fill(Color.white.opacity(0.1))
                            .frame(width: 70, height: 70)
                            .offset(x: 80, y: 150)

                        // Card Content
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Welcome 🎉!")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding(.top, 50)
                                    .padding(.leading, 20)

                                Spacer()
                            }

                            VStack(alignment: .leading) {
                                Text("Balance")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                                    .padding(.leading, 20)

                                HStack {
                                    Text("\(totalBalance) SR /") // Display total balance
                                        .font(.system(size: 40, weight: .bold))
                                        .foregroundColor(.white)
                                    Text("\(goal) SR")
                                        .font(.system(size: 40))
                                        .foregroundColor(.white.opacity(0.7))
                                }
                                .padding(.leading, 20)

                                Text("\(remainingDays) days left") // Dynamic counter number of days
                                    .font(.footnote)
                                    .foregroundColor(.white)
                                    .padding(.leading, 20)
                                    .padding(.bottom, 20)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)

                    // Main Content Section
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Track Your Spending")
                                .font(.title2)
                                .bold()
                            Menu("History") {
                                Button("Others") { choicmade = "Others" }
                                Button("Transportation") { choicmade = "Transportation" }
                                Button("Education") { choicmade = "Education" }
                                Button("Food") { choicmade = "Food" }
                            }
                            .padding(.horizontal)
                        }

                        // Spending Categories List
                        ForEach(["Food", "Education", "Transportation", "Others"], id: \.self) { category in
                            SpendingCategoryView(
                                category: category,
                                description: categoryDescription(for: category),
                                amount: amounts[category] ?? 0,
                                selectedCategory: $selectedCategory,
                                showInput: $showInput
                            )
                        }
                        .padding(.top)
                    }
                    .padding(.horizontal)
                }

                // Spending Input Section
                if showInput {
                    SpendingsView(selectedCategory: selectedCategory ?? "", amounts: $amounts) {
                        showInput = false
                    }
                }
            }
            .navigationBarHidden(true) // This hides the navigation bar
        }
        .navigationBarHidden(true)
    }

    private func categoryDescription(for category: String) -> String {
        switch category {
        case "Food": return "Restaurants, food, grocery ..."
        case "Education": return "University supplements ..."
        case "Transportation": return "Gas, driver, car monthly rent ..."
        case "Others": return "Add other spendings ..."
        default: return ""
        }
    }
}

struct SpendingsView: View {
    var selectedCategory: String
    @Binding var amounts: [String: Int]
    var onDismiss: () -> Void

    @State private var checkAmount = 0
    @State private var spendings = ""

    var body: some View {
        VStack {
            Image(systemName: "fork.knife.circle.fill")
                .resizable()
                .frame(width: 75, height: 75)
                .foregroundColor(Color.blue)

            Text("Enter your spendings for \(selectedCategory)")
                .font(.title)
                .fontWeight(.bold)

            VStack(spacing: 20) {
                TextField("Enter spendings", text: $spendings)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)

                TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "SR"))
                    .keyboardType(.decimalPad)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
            }

            HStack(spacing: 40) {
                Button("Cancel") {
                    onDismiss()
                }
                .foregroundColor(.blue)
                .frame(width: 118, height: 45)
                .background(RoundedRectangle(cornerRadius: 8).fill(.white))
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.blue, lineWidth: 2))

                Button("Update") {
                    amounts[selectedCategory, default: 0] += checkAmount
                    onDismiss()
                }
                .foregroundColor(.white)
                .frame(width: 118, height: 45)
                .background(RoundedRectangle(cornerRadius: 8).fill(.blue))
            }
            .padding(.top)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 20)
        .padding(.horizontal)
        .transition(.move(edge: .bottom))
    }
}

//struct SpendingCategoryView: View {
//    var category: String
//    var description: String
//    var amount: Int
//    @Binding var selectedCategory: String?
//    @Binding var showInput: Bool
//
//    var body: some View {
//        HStack {
//            Circle()
//                .fill(Color.blue)
//                .frame(width: 40, height: 40)
//                .overlay(
//                    Image(systemName: categoryIcon(category: category))
//                        .foregroundColor(.white)
//                )
//
//            VStack(alignment: .leading) {
//                Text(category)
//                    .font(.headline)
//                Text(description)
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//            }
//
//            Spacer()
//
//            Text("\(amount) SR")
//                .bold()
//                .font(.headline)
//                .foregroundColor(.black)
//        }
//        .padding(.horizontal)
//        .padding(.vertical, 10)
//        .background(
//            RoundedRectangle(cornerRadius: 15)
//                .fill(Color.white)
//                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
//        )
//        .padding(.horizontal)
//        .onTapGesture {
//            selectedCategory = category // Set selected category on tap
//            showInput = true // Show the input fields
//        }
//    }
//
//    func categoryIcon(category: String) -> String {
//        switch category {
//        case "Food":
//            return "fork.knife"
//        case "Education":
//            return "book.fill"
//        case "Transportation":
//            return "car.fill"
//        case "Others":
//            return "ellipsis.circle.fill"
//        default:
//            return "questionmark"
//        }
//    }
//}

#Preview {
    ContentView(goal: "1000") // Provide a sample goal for preview
}
