//
//  ARControllerViewController.swift
//  Immerse
//
//  Created by Aakash Sanjay Mehta on 24/8/18.
//  Copyright © 2018 Aakash Sanjay Mehta. All rights reserved.
//

import UIKit
import ARKit
var scenecounter:Int = 0

class ARControllerViewController: UIViewController, ARSCNViewDelegate {

    
    @IBOutlet weak var sceneView: ARSCNView!
<<<<<<< HEAD
    
    var planeGeometry:SCNPlane!
    var anchors = [ARAnchor]()

    var sceneLight:SCNLight!
    var overheadLabel: UILabel!
    
    
=======
    var wolfNode: SCNNode!

>>>>>>> master
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the view's delegate
        sceneView.delegate = self
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = false
        sceneView.autoenablesDefaultLighting = false
        let scene = SCNScene()
        
        // Set the scene to the view
        sceneView.scene = scene
        
        sceneLight = SCNLight()
        sceneLight.type = .omni
        
        let lightNode = SCNNode()
        lightNode.light = sceneLight
        lightNode.position = SCNVector3(x:0, y:10, z:2)
        
//        sceneView.scene.rootNode.addChildNode(lightNode)
        
        
        
    }
<<<<<<< HEAD
    
=======

>>>>>>> master
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        configuration.isLightEstimationEnabled = true
        
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
<<<<<<< HEAD
    
=======


>>>>>>> master
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
<<<<<<< HEAD
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: sceneView)
        
        
        addNodeAtLocation(location: location!)
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    
    // MARK: - ARSCNViewDelegate
    
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        if let estimate = self.sceneView.session.currentFrame?.lightEstimate {
            sceneLight.intensity = estimate.ambientIntensity
        }
    }
    
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        var node:SCNNode?
        
        if let planeAnchor = anchor as? ARPlaneAnchor {
            node = SCNNode()
            planeGeometry = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
            planeGeometry.firstMaterial?.diffuse.contents = UIColor.white.withAlphaComponent(0.5)
            
            let planeNode = SCNNode(geometry: planeGeometry)
            planeNode.position = SCNVector3(x: planeAnchor.center.x, y:0, z: planeAnchor.center.z)
            planeNode.transform = SCNMatrix4MakeRotation(-Float.pi / 2, 1, 0, 0)
            
            updateMaterial()
            
            node?.addChildNode(planeNode)
            anchors.append(planeAnchor)
        }
        
        return node
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        if let planeAnchor = anchor as? ARPlaneAnchor {
            if anchors.contains(planeAnchor) {
                if node.childNodes.count > 0 {
                    let planeNode = node.childNodes.first!
                    planeNode.position = SCNVector3(x: planeAnchor.center.x, y: 0, z: planeAnchor.center.z)
                    
                    if let plane = planeNode.geometry as? SCNPlane {
                        plane.width = CGFloat(planeAnchor.extent.x)
                        plane.height = CGFloat(planeAnchor.extent.z)
                        updateMaterial()
                    }
                }
            }
        }
    }
    
    
    // MARK: - The marking of the plane thing
    func updateMaterial() {
        let material = self.planeGeometry.materials.first!
//        planeGeometry = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
//        planeGeometry.firstMaterial?.diffuse.contents = UIColor.white.withAlphaComponent(0.5)
        material.diffuse.contentsTransform = SCNMatrix4MakeScale(Float(self.planeGeometry.width), Float(self.planeGeometry.height), 1)
    }
    
    
    // MARK: - Adding Node at the location
    func addNodeAtLocation (location:CGPoint) {
        guard anchors.count > 0 else {print("anchros are not created yet"); return}
        
        let hitResults = sceneView.hitTest(location, types: .existingPlaneUsingExtent)
        
        if hitResults.count > 0 {
            let result = hitResults.first!
            let newLocation = SCNVector3(x: result.worldTransform.columns.3.x, y: result.worldTransform.columns.3.y + 0.15, z: result.worldTransform.columns.3.z)
            let schoolNode = SCNScene(named: "ARAssets.scnassets/IMMERSE 3D SCH MODEL.dae")?.rootNode.childNode(withName: "SketchUp", recursively: true)
            schoolNode?.rotation.y = -90
            schoolNode?.rotation.x = 90
            schoolNode?.position = newLocation
            schoolNode?.scale = SCNVector3(x: 0.0005, y: 0.0005, z: 0.0005)
            
            
            sceneView.scene.rootNode.addChildNode(schoolNode!)
        }
        
        
    }
    
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
    }
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
    }
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
    }
}
=======


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
        guard let planeAnchor = anchor as? ARPlaneAnchor else {
            return
        }
        let planeNode = createARPlaneNode(anchor: planeAnchor)
        node.addChildNode(planeNode)
    }

    // when detected new plane, update
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor else {
            return
        }
        // remove existing plane nodes
        node.enumerateChildNodes { (childNode, _) in
            childNode.removeFromParentNode()
        }
        let planeNode = createARPlaneNode(anchor: planeAnchor)
        node.addChildNode(planeNode)
    }

    // when detected plane removed, didRemove the plane
    func renderer(_ renderer: SCNSceneRenderer, didRemove node: SCNNode, for anchor: ARAnchor) {
        guard anchor is ARPlaneAnchor else {
            return
        }
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
>>>>>>> master

//    func createARPlaneNode(anchor: ARPlaneAnchor) -> SCNNode {
//        let pos = SCNVector3Make(anchor.transform.columns.3.x, anchor.transform.columns.3.y, anchor.transform.columns.3.z)
//        print("New surface detected at \(pos)")
//
//        // Create the geometry and its materials
//        let plane = SCNPlane(width: CGFloat(anchor.extent.x), height: CGFloat(anchor.extent.z))
//        let grassImage = UIImage(named: "grass")
//        let grassMaterial = SCNMaterial()
//        grassMaterial.diffuse.contents = grassImage
//        grassMaterial.isDoubleSided = true
//        plane.materials = [grassMaterial]
//        // Create a plane node with the plane geometry
//        let planeNode = SCNNode(geometry: plane)
//        planeNode.position = pos
//        planeNode.transform = SCNMatrix4MakeRotation(-Float.pi / 2, 1, 0, 0)
//
//        // add the wolf to pos of the plane node
//        if wolfNode == nil {
//            if let wolfScene = SCNScene(named: "ARAssets.scnassets/ImmerseModel1.scn") {
//                wolfNode = wolfScene.rootNode.childNode(withName: "model1", recursively: true)
//                wolfNode.position = pos
//
//                sceneView.scene.rootNode.addChildNode(wolfNode)
//                //sceneView.scene.rootNode.addChildNode(keyboard)
//            }
//        }
//        return planeNode
//    }

