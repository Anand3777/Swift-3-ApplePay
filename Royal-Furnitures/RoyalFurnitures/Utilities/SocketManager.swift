//import SocketIO
//
//class SocketHelper {
//
//    static let shared = SocketHelper()
//    var socket: SocketIOClient!
//
//    let manager = SocketManager(socketURL: URL(string: "http://cabby.tech:4005/")!, config: [.log(true), SocketIOClientOption.connectParams([:])])
//
//    private init() {
//        socket = manager.defaultSocket
//    }
//
//    func connectSocket(completion: @escaping(Bool) -> () ) {
//        disconnectSocket()
//        socket.on(clientEvent: .connect) {[weak self] (data, ack) in
//            print("socket connected")
//            self?.socket.removeAllHandlers()
//            completion(true)
//        }
//        socket.connect()
//    }
//
//    func disconnectSocket() {
//        socket.removeAllHandlers()
//        socket.disconnect()
//        print("socket Disconnected")
//    }
//
//    func checkConnection() -> Bool {
//        if socket.manager?.status == .connected {
//            return true
//        }
//        return false
//
//    }
//
//}
