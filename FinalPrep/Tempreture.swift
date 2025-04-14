import SwiftUI
import Observation
import SwiftData


@Model
class Tempreture: Identifiable{
    var tempreture = 25.5

    
    init(tempreture: Double) {
        self.tempreture = tempreture
    }
    
    func setTemp(temp: Double){
        self.tempreture = temp
    }
    
}

