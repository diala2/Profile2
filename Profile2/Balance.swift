//
//  Balance.swift
//  Profile2
//
//  Created by Wajd Wael on 03/04/1446 AH.
//

import SwiftUI

struct Balance: View {
    @State private var choicmade = "options"
    @State private var offset = CGSize.zero
    @State private var selectedCategory: String? // Track the selected category
    @State private var amounts: [String: Int] = ["Food": 0, "Education": 0, "Transportation": 0, "Others": 0] // Dictionary to hold amounts
    @State private var spendings = ""
    @State private var showInput = false // State to control input visibility
    @State private var checkAmount: Int = 0 // Amount to input
    var goal: String

    // Computed property to calculate total balance
    private var totalBalance: Int {
        amounts.values.reduce(0, +) // Sum all amounts in the dictionary
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
                                Text("Welcome back 🎉!")
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

                                Text("18 days left")//counter number of days
                                    .font(.footnote)
                                    .foregroundColor(.white)
                                    .padding(.leading, 20)
                                    .padding(.bottom, 20)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 20)

                    // Main Content Section
                    VStack(alignment: .leading) {
                        // HStack to Align "Track Your Spending" and "History" on the Same Line
                        HStack {
                            Text("Track Your Spending")
                                .font(.title2)
                                .bold()

                            Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.top, 10)

                        // Spending Categories List
                        SpendingCategoryView(category: "Food", description: "Restaurants, food, grocery ...", amount: amounts["Food"] ?? 0, selectedCategory: $selectedCategory, showInput: $showInput)
                        SpendingCategoryView(category: "Education", description: "University supplements ...", amount: amounts["Education"] ?? 0, selectedCategory: $selectedCategory, showInput: $showInput)
                        SpendingCategoryView(category: "Transportation", description: "Gas, driver, car monthly rent ...", amount: amounts["Transportation"] ?? 0, selectedCategory: $selectedCategory, showInput: $showInput)
                        SpendingCategoryView(category: "Others", description: "Add other spendings ...", amount: amounts["Others"] ?? 0, selectedCategory: $selectedCategory, showInput: $showInput)
                    }
                    .padding(.top)
                }

                // Spending Input Section
                if showInput {
                    Color.black.opacity(0.4) // Dim the background
                        .edgesIgnoringSafeArea(.all)

                    VStack(spacing: 20) {
                        Text("Enter your spendings for \(selectedCategory ?? "Category")")
                            .font(.headline)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                            .padding(.top, 40) // Add some space from the top

                        TextField("Enter spendings", text: $spendings)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)

                        TextField("Amount", value: $checkAmount, format: .number)
                            .keyboardType(.decimalPad)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)

                        HStack(spacing: 40) {
                            Button("Cancel") {
                                showInput = false // Hide the input fields
                                selectedCategory = nil // Reset selected category
                            }
                            .foregroundColor(.blue)
                            .frame(width: 100, height: 45)
                            .background(RoundedRectangle(cornerRadius: 8).fill(.white))
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.blue, lineWidth: 2))

                            Button("Update") {
                                if let category = selectedCategory {
                                    amounts[category] = (amounts[category] ?? 0) + checkAmount // Update the amount for the selected category
                                }
                                showInput = false // Hide the input fields after update
                                selectedCategory = nil // Reset selected category
                                checkAmount = 0 // Reset the input amount
                            }
                            .foregroundColor(.white)
                            .frame(width: 100, height: 45)
                            .background(RoundedRectangle(cornerRadius: 8).fill(.blue))
                        }
                        .padding(.top)
                    }
                    .padding()
                    .background(Color.white) // Modal background
                    .cornerRadius(15)
                    .shadow(radius: 20)
                    .padding(.horizontal)
                    .transition(.move(edge: .bottom)) // Transition effect
                }
            }
            .navigationBarHidden(true) // This hides the navigation bar
        }
    }
}

struct SpendingCategoryView: View {
    var category: String
    var description: String
    var amount: Int
    @Binding var selectedCategory: String? // Binding to track selected category
    @Binding var showInput: Bool // Binding to control input visibility

    var body: some View {
        HStack {
            // Icon placeholder
            Circle()
                .fill(Color.blue)
                .frame(width: 40, height: 40)
                .overlay(
                    Image(systemName: categoryIcon(category: category))
                        .foregroundColor(.white)
                )

            VStack(alignment: .leading) {
                Text(category)
                    .font(.headline)

                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()

            Text("\(amount) SR")
                .bold()
                .font(.headline)
                .foregroundColor(.black)
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
        )
        .padding(.horizontal)
        .onTapGesture {
            selectedCategory = category // Set selected category on tap
            showInput = true // Show the input fields
        }
    }

    func categoryIcon(category: String) -> String {
        switch category {
        case "Food":
            return "fork.knife"
        case "Education":
            return "book.fill"
        case "Transportation":
            return "car.fill"
        case "Others":
            return "ellipsis.circle.fill"
        default:
            return "questionmark"
        }
    }
}

#Preview {
    Balance(goal: "1000") // Provide a sample goal for preview
}
