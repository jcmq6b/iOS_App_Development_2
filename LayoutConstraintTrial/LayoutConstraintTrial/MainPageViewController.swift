//
//  MainPageViewController.swift
//  LayoutConstraintTrial
//I followed along with a tutorial by Brian Advent on youtube.com/watch?v=6EEMofQG931
//I then added a bit more onto it by adding a reset button and class variables

import UIKit

class MainPageViewController: UIViewController {

    let colorView = UIView()
    //creating these variables so they can be called on by other funcs
    var initialConstraints = [NSLayoutConstraint]()
    var changeConstraints = [NSLayoutConstraint]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        colorView.translatesAutoresizingMaskIntoConstraints = false
        colorView.backgroundColor = UIColor.blue
        
        //Adding the view to the scene
        self.view.addSubview(colorView)

        //Adding Constraints
        let leadingConstraint = colorView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingConstraint = colorView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let topConstraint = colorView.topAnchor.constraint(equalTo: self.view.topAnchor)
        //Adding some space at the bottom for the label
        let bottomConstraint = colorView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -80)
        
        //right left top bottom
        initialConstraints.append(contentsOf: [leadingConstraint,trailingConstraint,topConstraint,bottomConstraint])
        
        NSLayoutConstraint.activate(initialConstraints)

    }
    
    @IBAction func changeConstraints(_ sender: Any) {
        //deactivate the constraints we set earlier
        NSLayoutConstraint.deactivate(initialConstraints)
        
        //set width and height of the new box constraints
        let widthConstraint = colorView.widthAnchor.constraint(equalToConstant: 100)
        let heightConstraint = colorView.heightAnchor.constraint(equalToConstant: 100)
        
        //center the new box constraints
        let centerXConstraint = colorView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let centerYConstraint = colorView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        
        changeConstraints.append(contentsOf: [widthConstraint, heightConstraint, centerXConstraint, centerYConstraint])
        
        //Apply the new constraints
        NSLayoutConstraint.activate(changeConstraints)
    }
    
    //Change the constraints back to the initial ones
    @IBAction func resetConstraints(_ sender: Any) {
        
        NSLayoutConstraint.deactivate(changeConstraints)
        
        NSLayoutConstraint.activate(initialConstraints)
        
    }
    
    
}
