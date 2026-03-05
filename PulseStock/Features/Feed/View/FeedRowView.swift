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
        
        HStack(spacing: 12) {
            
            VStack(alignment: .leading, spacing: 4) {
                
                Text(stock.symbol)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Text("Live Market")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                
                Text(String(format: "%.2f", stock.price))
                    .font(.title3)
                    .fontWeight(.bold)
                
                HStack(spacing: 4) {
                    
                    Image(systemName: stock.isPositive ? "arrow.up.right" : "arrow.down.right")
                    
                    Text(stock.isPositive ? "UP" : "DOWN")
                        .font(.caption)
                }
                .foregroundColor(stock.isPositive ? .green : .red)
            }
        }
        .padding()
        .background(
            ZStack {
                
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.systemBackground))
                
                RoundedRectangle(cornerRadius: 12)
                    .fill(stock.isPositive ? Color.green : Color.red)
                    .opacity(flashOpacity)
            }
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(.systemGray5), lineWidth: 1)
        )
        .onChange(of: stock.price) { _, _ in
            triggerFlash()
        }
    }
    
    private func triggerFlash() {
        
        flashOpacity = 0.35
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(.easeOut(duration: 0.6)) {
                flashOpacity = 0
            }
        }
    }
}

