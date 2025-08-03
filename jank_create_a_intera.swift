import Foundation

struct Notification {
    let title: String
    let message: String
}

class Notifier {
    private var notifications: [Notification] = []

    func addNotification(title: String, message: String) {
        let notification = Notification(title: title, message: message)
        notifications.append(notification)
    }

    func displayNotifications() {
        for notification in notifications {
            print("Notification: \(notification.title)")
            print("Message: \(notification.message)")
            print("---")
        }
    }
}

class CLINotifier {
    let notifier: Notifier

    init() {
        notifier = Notifier()
    }

    func run() {
        while true {
            print("Enter command (add/list/exit): ")
            let input = readLine() ?? ""

            switch input.lowercased() {
            case "add":
                print("Enter title: ")
                let title = readLine() ?? ""
                print("Enter message: ")
                let message = readLine() ?? ""
                notifier.addNotification(title: title, message: message)
                print("Notification added!")
            case "list":
                notifier.displayNotifications()
            case "exit":
                print("Exiting...")
                exit(0)
            default:
                print("Invalid command!")
            }
        }
    }
}

let cliNotifier = CLINotifier()
cliNotifier.run()