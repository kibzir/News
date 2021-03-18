//
//  StartScreen.swift
//  NewsApp
//
//  Created by Владислав Козырь on 18.03.21.
//

import UIKit

class StartScreen: UIViewController {

    @IBOutlet weak var Animated: UIImageView!
    
   
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

          
        
        UIView.animateKeyframes(withDuration: 5, delay: 0.2, options: .repeat, animations: {
            
            self.Animated.center.y -= 100
            
            
            
        }, completion: nil)
       
        
        
      /*  //self.Animated.center = self.view.center
         self.Animated.frame.size.width = 10
         */
        
        
        
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
