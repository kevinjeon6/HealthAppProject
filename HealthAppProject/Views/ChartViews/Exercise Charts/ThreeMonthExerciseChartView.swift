//
//  ThreeMonthExerciseChartView.swift
//  HealthAppProject
//
//  Created by Kevin Mattocks on 1/22/23.
//

import Charts
import SwiftUI

struct ThreeMonthExerciseChartView: View {
    @ObservedObject var healthStoreVM: HealthStoreViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Chart {
                ForEach(healthStoreVM.exerciseTime3Months, id: \.date) {
                    value in
                    
                    BarMark(x: .value("day", value.date, unit: .weekOfYear),
                             y: .value("ex time", value.exerValue)
                    )
                    .foregroundStyle(.green.gradient)
                    .cornerRadius(3)
                }
            }
            .frame(height: 200)
            .chartXAxis {
                AxisMarks(values: .stride(by: .month )) {
                    AxisGridLine()
                    AxisValueLabel(format: .dateTime.month().year())
                }
            }
        }
        .padding(.horizontal)
        
        List {
            ForEach(healthStoreVM.exerciseTime3Months.reversed(), id: \.date) { exTime in
                VStack(alignment: .leading, spacing: 5){
                    HStack {
                        Image(systemName: "figure.mixed.cardio")
                            .foregroundColor(.green)
                        Text("\(exTime.exerValue) mins")
                            .font(.title2)
                            .bold()
                    }
                    Text(exTime.date, style: .date)
                        .opacity(0.5)
                }
            }
        }
        .listStyle(.inset)
    }
}

struct ThreeMonthExerciseChartView_Previews: PreviewProvider {
    static var previews: some View {
        ThreeMonthExerciseChartView(healthStoreVM: HealthStoreViewModel())
    }
}
