//
//  AboutViewController.swift
//  lab6_task5
//
//  Created by Екатерина Алейник on 20.04.25.
//
import UIKit

class AboutViewController: UIViewController {
  @IBAction func close(sender: AnyObject) {
    presentingViewController?.dismiss(animated: true, completion: nil)
  }
}
