//
//  HotelManager.swift
//  iOSTestProject
//
//  Created by ranieri.f.aguiar on 23/09/20.
//  Copyright © 2020 ThoughtWorks. All rights reserved.
//

import Foundation

protocol HotelManagerProtocol {
    func checkBooking(startDate: Date, endDate: Date, discount: Bool) -> Hotel?
}

class HotelManager: HotelManagerProtocol {

    func checkBooking(startDate: Date, endDate: Date, discount: Bool) -> Hotel? {
        let data = DataModel()
        let listHotels = data.getHotels()
        let bookingDays = countDays(startDate: startDate, endDate: endDate)
        var bestBooking: (hotel: Hotel?, totalCost: Float) = (nil, Float.greatestFiniteMagnitude)

        for hotel in listHotels {
            let weekendCost = discount ? hotel.discountPriceOnWeekends : hotel.regularPriceOnWeekends
            let weekdayCost = discount ? hotel.discountPriceOnWeekdays : hotel.regularPriceOnWeekdays

            let totalWeekendCost = Float(bookingDays.weekends) * weekendCost
            let totalWeekdayCost = Float(bookingDays.weekdays) * weekdayCost

            let totalBookingCost = totalWeekdayCost + totalWeekendCost

            if totalBookingCost < bestBooking.totalCost ||
                (totalBookingCost == bestBooking.totalCost &&
                    hotel.rating > bestBooking.hotel?.rating ?? 0) {
                bestBooking = (hotel, totalBookingCost)
            }
        }

        return bestBooking.hotel
    }
    
    private func countDays(startDate: Date, endDate: Date) -> (weekdays: Int, weekends: Int) {
        guard startDate < endDate else { return (0, 0) }

        let calendar = Calendar.current
        var weekdays = 0
        var weekends = 0
        var date = startDate

        while date <= endDate {
            if calendar.isDateInWeekend(date) {
                weekends += 1
            } else {
                weekdays += 1
            }

            if let nextDay = calendar.date(byAdding: .day, value: 1, to: date) {
                date = nextDay
            }
        }

        return (weekdays, weekends)
    }

}
