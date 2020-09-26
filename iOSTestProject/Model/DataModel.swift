//
//  DataModel.swift
//  iOSTestProject
//
//  Created by ranieri.f.aguiar on 23/09/20.
//  Copyright © 2020 ThoughtWorks. All rights reserved.
//

class DataModel {

    func getHotels() -> [Hotel] {
        var hotelList = [Hotel]()

        let hotel1 = Hotel(
            name: "Parque das flores",
            rating: 3,
            regularPriceOnWeekdays: 110,
            discountPriceOnWeekdays: 80,
            regularPriceOnWeekends: 90,
            discountPriceOnWeekends: 80
        )
        hotelList.append(hotel1)
        
        let hotel2 = Hotel(
            name: "Jardim Botânico",
            rating: 4,
            regularPriceOnWeekdays: 160,
            discountPriceOnWeekdays: 110,
            regularPriceOnWeekends: 60,
            discountPriceOnWeekends: 50
        )
        hotelList.append(hotel2)

        let hotel3 = Hotel(
            name: "Mar Atlântico",
            rating: 5,
            regularPriceOnWeekdays: 220,
            discountPriceOnWeekdays: 100,
            regularPriceOnWeekends: 150,
            discountPriceOnWeekends: 40
        )
        hotelList.append(hotel3)
        
        return hotelList
    }

}
