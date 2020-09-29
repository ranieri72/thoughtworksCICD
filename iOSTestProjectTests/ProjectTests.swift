import XCTest
@testable import iOSTestProject

class ProjectTests: XCTestCase {

    var sut: HotelManagerProtocol?
    var dateFormatter: DateFormatter?

    override func setUp() {
        sut = HotelManager()

        dateFormatter = DateFormatter()
        dateFormatter?.dateFormat = "dd/MM/yyyy"
    }

    func testBooking1() {
        guard let startDate = dateFormatter?.date(from: "16/03/2020") else { return XCTFail() }
        guard let endDate = dateFormatter?.date(from: "18/03/2020") else { return XCTFail() }

        let currentHotel = sut?.checkBooking(startDate: startDate, endDate: endDate, discount: false)
        let correctHotel = Hotel(
            name: "Parque das floress",
            rating: 3,
            regularPriceOnWeekdays: 110,
            discountPriceOnWeekdays: 80,
            regularPriceOnWeekends: 90,
            discountPriceOnWeekends: 80
        )

        XCTAssertEqual(currentHotel?.name, correctHotel.name)
    }

    func testBooking2() {
        guard let startDate = dateFormatter?.date(from: "20/03/2020") else { return XCTFail() }
        guard let endDate = dateFormatter?.date(from: "22/03/2020") else { return XCTFail() }

        let currentHotel = sut?.checkBooking(startDate: startDate, endDate: endDate, discount: false)
        let correctHotel = Hotel(
            name: "Jardim Botânico",
            rating: 4,
            regularPriceOnWeekdays: 160,
            discountPriceOnWeekdays: 110,
            regularPriceOnWeekends: 60,
            discountPriceOnWeekends: 50
        )

        XCTAssertEqual(currentHotel?.name, correctHotel.name)
    }

    func testBooking3() {
        guard let startDate = dateFormatter?.date(from: "26/03/2020") else { return XCTFail() }
        guard let endDate = dateFormatter?.date(from: "28/03/2020") else { return XCTFail() }

        let currentHotel = sut?.checkBooking(startDate: startDate, endDate: endDate, discount: true)
        let correctHotel = Hotel(
            name: "Mar Atlântico",
            rating: 5,
            regularPriceOnWeekdays: 220,
            discountPriceOnWeekdays: 100,
            regularPriceOnWeekends: 150,
            discountPriceOnWeekends: 40
        )

        XCTAssertEqual(currentHotel?.name, correctHotel.name)
    }

}
