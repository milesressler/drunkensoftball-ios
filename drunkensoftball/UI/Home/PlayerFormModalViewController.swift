//
//  PlayerFormModalViewController.swift
//  drunkensoftball
//
//  Created by Miles Ressler on 5/11/17.
//  Copyright © 2017 Miles Ressler. All rights reserved.
//

import Foundation

class PlayerFormModalViewController: UIViewController {
    
    let playerForm = PlayerFormView()
    var player: Player?
    var successHandler: (() -> Void)?
    var cancelHandler: (() -> Void)?
    
    init(displayTitle: String, player: Player) {
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .overFullScreen
        self.player = player
        self.playerForm.config(title: displayTitle, name: player.name)
    }
    
    func present(presentingVC: UIViewController, successHandler: @escaping () -> Void, cancelHandler: @escaping () -> Void) {
        self.successHandler = successHandler
        self.cancelHandler = cancelHandler
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = playerForm
        playerForm.delegate = self
        
        self.modalTransitionStyle = .crossDissolve
    }
    
    
    func dismiss() {
        self.dismiss(animated: false, completion: nil)
    }
}

extension PlayerFormModalViewController: PlayerFormDelegate {
    func didCancel() {
        cancelHandler?()
        dismiss()
    }
    
    func didTapOkay(name: String) {
        player?.name = name
        successHandler?()
        dismiss()
    }
}
