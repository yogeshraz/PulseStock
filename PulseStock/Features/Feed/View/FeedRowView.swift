//
//  FeedRowView.swift
//  PulseStock
//
//  Created by Yogesh Raj on 05/03/26.
//

import SwiftUI

struct FeedRowView: View {
    let stock: Stock
    @State private var flashOpacity: Double = 0
    
    var body: some View {
        HStack(spacing: 16) {
            // MARK: - Left Section: Symbol & Name
            VStack(alignment: .leading, spacing: 4) {
                Text(stock.symbol)
                    .font(.system(.headline, design: .rounded))
                    .fontWeight(.bold)
                
                Text("Live Market")
                    .font(.caption2)
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
                    .textCase(.uppercase)
            }
            
            Spacer()
            
            // MARK: - Right Section: Price & Trend
            VStack(alignment: .trailing, spacing: 6) {
                Text(String(format: "%.2f", stock.price))
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
                    .monospacedDigit()
                    .contentTransition(.numericText()) 
                
                // Trend Indicator Pill
                HStack(spacing: 4) {
                    Image(systemName: stock.isPositive ? "arrow.up" : "arrow.down")
                        .font(.system(size: 10, weight: .bold))
                    
                    Text(stock.isPositive ? "UP" : "DOWN")
                        .font(.system(size: 10, weight: .heavy))
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(stock.isPositive ? Color.green.opacity(0.15) : Color.red.opacity(0.15))
                .foregroundColor(stock.isPositive ? .green : .red)
                .cornerRadius(6)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color(.secondarySystemGroupedBackground))
                
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(stock.isPositive ? Color.green : Color.red)
                    .opacity(flashOpacity)
            }
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .stroke(Color.primary.opacity(0.05), lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
        .padding(.horizontal, 4) // Spacing from screen edges
        .onChange(of: stock.price) { _, _ in
            triggerFlash()
        }
    }
    
    private func triggerFlash() {
        withAnimation(.easeIn(duration: 0.1)) {
            flashOpacity = 0.12
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            withAnimation(.easeOut(duration: 0.8)) {
                flashOpacity = 0
            }
        }
    }
}
