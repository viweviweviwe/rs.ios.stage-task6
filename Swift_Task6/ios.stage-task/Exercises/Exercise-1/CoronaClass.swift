import Foundation

class CoronaClass {
 
     var seats = [Int]()
    var coronaClassSize: Int

     init(n: Int) {
        coronaClassSize = n
     }
     
     func seat() -> Int {
        var studentPlace = 0
        var tempDistance = 0
        var indexPlace = 0
        if seats.count == 0 {
            seats.append(0)
            studentPlace = 0
            return studentPlace
        }
        if seats.first == 0 && seats.count == 1 {
            studentPlace = coronaClassSize - 1
            seats.append(studentPlace)
            return studentPlace
        }
        
        for index in 1..<seats.count {
            if (seats[index] - seats[index - 1]) / 2 > tempDistance {
                tempDistance = (seats[index] - seats[index - 1]) / 2
                indexPlace = index
                studentPlace = seats[index - 1] + tempDistance            }
        }
        
        if seats.last != coronaClassSize - 1 && coronaClassSize - 1 - seats.last! > tempDistance {
            studentPlace = coronaClassSize - 1
            seats.append(studentPlace)
            return studentPlace
        }
        
        seats.insert(studentPlace, at: indexPlace)
        return studentPlace
     }
     
     func leave(_ p: Int) {
        if let leaveStudentIndex = seats.firstIndex(of: p) {
            seats.remove(at: leaveStudentIndex)
        }
     }
}
