

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    //скрываем навигэйшн бар сверху, на этом экране он не нужен
    override func viewWillAppear(_ animated: Bool) {
        //в документации сказано что когда мы переопределяем метод viewWillAppear мы должны использовать super. If you override (our custom functionality) this method, you must call 'super' at some point in your implementation
        super.viewWillAppear(animated) //просто написав 'super', xcode сам предлагает полный вызов супера
        navigationController?.isNavigationBarHidden = true
    }
    //а теперь возвращаем его на место перед переходом на следующее окно, сразу после нажатия на login or registration buttons, иначе бар исчезнет со всех экранов!
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = ""
        
        var charIndex = 0.0
        let titleText = K.appName
        for letter in titleText {
            print("-")
            print(0.2 * charIndex)
            print(letter)
            
            Timer.scheduledTimer(withTimeInterval: 0.2 * Double(charIndex), repeats: false) { timer in
                self.titleLabel.text?.append(letter)
            }
            charIndex += 1
        }

    }

}
