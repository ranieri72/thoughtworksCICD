import SwiftUI

struct ContentView: View {

    @State private var checkInDate = Date()
    @State private var checkOutDate = Date()
    @State private var bestHotel: Hotel?
    @State private var isRewardClient = false
    @State private var showingAlert = false
    private let manager = HotelManager()

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text("Check in date")
                DatePicker(
                    "",
                    selection: $checkInDate,
                    displayedComponents: .date
                ).labelsHidden()

                Text("Check out date")
                DatePicker(
                    "",
                    selection: $checkOutDate,
                    displayedComponents: .date
                ).labelsHidden()

                Text("Reward client?")
                Toggle(
                    "",
                    isOn: $isRewardClient
                ).labelsHidden()

                Button(action: {
                    self.bestHotel = self.manager.checkBooking(
                        startDate: self.checkInDate,
                        endDate: self.checkOutDate,
                        discount: self.isRewardClient
                    )
                    self.showingAlert = true
                }) {
                    Text("Best hotel")
                }
                .alert(isPresented: $showingAlert) {
                    let hotelName = bestHotel?.name ?? ""
                    return Alert(
                        title: Text("Best hotel"),
                        message: Text(hotelName),
                        dismissButton: .default(Text("Got it!"))
                    )
                }
            }.padding(16)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
