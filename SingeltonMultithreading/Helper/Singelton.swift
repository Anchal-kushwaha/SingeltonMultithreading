import Foundation

final public class Singleton {
    private static var sharedObj: Singleton?
    static let serialQueue = DispatchQueue(label: "serial")
    
    private init () {}
    
    public static func getInstance() -> Singleton? {
        serialQueue.sync {
            guard let sharedObjectValue = sharedObj else {
                sharedObj = Singleton()
                return sharedObj
            }
            return sharedObjectValue
        }
    }
    
    /// Approach using Lock variable
//    public static func getInstance() -> Singleton? {
//          myLock.lock()
//          guard let sharedObjectValue = sharedObj else {
//              sharedObj = Singleton()
//              myLock.unlock()
//              return sharedObj
//          }
//          myLock.unlock()
//          return sharedObjectValue
//      }

}

