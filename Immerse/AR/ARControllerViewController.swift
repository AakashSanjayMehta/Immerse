//
//  ARControllerViewController.swift
//  Immerse
//
//  Created by Aakash Sanjay Mehta on 24/8/18.
//  Copyright © 2018 Aakash Sanjay Mehta. All rights reserved.
//

import UIKit
import ARKit

class ARControllerViewController: UIViewController, ARSCNViewDelegate {

    
    @IBOutlet weak var sceneView: ARSCNView!
    var wolfNode: SCNNode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        // Create a new scene
        let scene = SCNScene()
        // Set the scene to the view
        sceneView.scene = scene

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Pause the view's session
        sceneView.session.pause()
    }
    
    
    /** create and return ARPlaneNode */
    func createARPlaneNode(anchor: ARPlaneAnchor) -> SCNNode {
        let pos = SCNVector3Make(anchor.transform.columns.3.x, anchor.transform.columns.3.y, anchor.transform.columns.3.z)
        print("New surface detected at \(pos)")
        
        // Create the geometry and its materials
        let plane = SCNPlane(width: CGFloat(anchor.extent.x), height: CGFloat(anchor.extent.z))
        let grassImage = UIImage(named: "grass")
        let grassMaterial = SCNMaterial()
        grassMaterial.diffuse.contents = grassImage
        grassMaterial.isDoubleSided = true
        plane.materials = [grassMaterial]
        // Create a plane node with the plane geometry
        let planeNode = SCNNode(geometry: plane)
        planeNode.position = pos
        planeNode.transform = SCNMatrix4MakeRotation(-Float.pi / 2, 1, 0, 0)
        
        // add the wolf to pos of the plane node
        if wolfNode == nil {
            if let wolfScene = SCNScene(named: "ARAssets.scnassets/ImmerseModel1.scn") {
                wolfNode = wolfScene.rootNode.childNode(withName: "model1", recursively: true)
                wolfNode.position = pos
                
                sceneView.scene.rootNode.addChildNode(wolfNode)
                //sceneView.scene.rootNode.addChildNode(keyboard)
            }
        }
        return planeNode
    }
    // plane node didAdd when detected
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
        let planeNode = createARPlaneNode(anchor: planeAnchor)
        node.addChildNode(planeNode)
    }
    
    // when detected new plane, update
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
        // remove existing plane nodes
        node.enumerateChildNodes { (childNode, _) in
            childNode.removeFromParentNode()
        }
        let planeNode = createARPlaneNode(anchor: planeAnchor)
        node.addChildNode(planeNode)
    }
    
    // when detected plane removed, didRemove the plane
    func renderer(_ renderer: SCNSceneRenderer, didRemove node: SCNNode, for anchor: ARAnchor) {
        guard anchor is ARPlaneAnchor else { return }
        // remove existing plane nodes
        node.enumerateChildNodes { (childNode, _) in
            childNode.removeFromParentNode()
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    // MARK: - ARSCNViewDelegate
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
