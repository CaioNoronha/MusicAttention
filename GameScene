import AVFoundation
import SpriteKit


public struct NoteInterval{
    let first: Double
    let second: Double
}


//Gameplay Scene
public class GameScene: SKScene {
    
    //TAMANHO DO IPHONE 7 =  375 667
    
    //Properties
    
    var score = 0
    var timerS = 0.5
    var waitTimer = 21.0
    var flag = 0
    var speaker: SKSpriteNode?
    var isPresentingTutorialLeft = true
    var isPresentingTutorialRight = true
    
    //Seconds Left
    var leftNotesInterval: [NoteInterval] = [NoteInterval(first: 20.5, second: 21.8),NoteInterval(first: 24.5, second: 25.8),NoteInterval(first: 28.7, second: 30.0),NoteInterval(first: 30.8, second: 32.1), NoteInterval(first: 34.9, second: 36.2), NoteInterval(first: 43.0, second: 44.3), NoteInterval(first: 45.0, second: 46.3), NoteInterval(first: 49.0, second: 50.3), NoteInterval(first: 53.0, second: 54.30), NoteInterval(first: 55.0, second: 56.3), NoteInterval(first: 63.3, second: 64.6), NoteInterval(first: 69.5, second: 70.8), NoteInterval(first: 71.5, second: 72.8), NoteInterval(first: 75.5, second: 76.1), NoteInterval(first: 77.9, second: 79.2), NoteInterval(first: 81.9, second: 83.2)]
    
    //Seconds Right
    var rightNotesInterval: [NoteInterval] = [NoteInterval(first: 22.5, second: 23.8), NoteInterval(first: 26.8, second: 28.1), NoteInterval(first: 32.9, second: 34.2), NoteInterval(first: 36.9, second: 38.2), NoteInterval(first: 38.6, second: 39.9), NoteInterval(first: 41, second: 42.3), NoteInterval(first: 47, second: 48.3), NoteInterval(first: 51, second: 52.3), NoteInterval(first: 57.7, second: 59), NoteInterval(first: 59.1, second: 60.4),  NoteInterval(first: 61.4, second: 62.9), NoteInterval(first: 65.6, second: 66.9), NoteInterval(first: 67.9, second: 69.20), NoteInterval(first: 73.8, second: 75.1),NoteInterval(first: 79.7, second: 81),  NoteInterval(first: 84, second: 85.3)]
    
    //BackGrounds
    let orangeBackGround = SKSpriteNode(imageNamed: "orange.png")
    let greenBackGround = SKSpriteNode(imageNamed: "green.png")
    let redBackGround = SKSpriteNode(imageNamed: "red.png")
    
    
    //Buttons
    var leftButton: SKNode?
    var rightButton: SKNode?
    var playButton: SKNode?
    
    //Labels
    
    //Single variables
    var textLabelReady: SKLabelNode?
    var textLabelPlay: SKLabelNode?
    var textLabelTitle: SKLabelNode?
    var textLabelTutorial: SKLabelNode?
    var textLabelScore: SKLabelNode?
    var textLabelFinalScore: SKLabelNode?
    var timeCounterLabel: SKLabelNode?
    
    //Left
    var textLabelLeft1: SKLabelNode?
    var textLabelLeft2: SKLabelNode?
    
    //Right
    var textLabelRight1: SKLabelNode?
    var textLabelRight2: SKLabelNode?
    
    //Color of the label
    let textLabelColor : UIColor = #colorLiteral(red: 0, green: 0.462745098, blue: 0.6980392157, alpha: 1)
    
    
    public init(frame: CGRect) {
        super.init(size: frame.size)
    }
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //Operations
    public override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        //Start the menu
        self.menu()
        
    }
    
    public func menu(){
        
        //Add the orange background
        self.addBackGround()
        
        //Add the play Button
        self.addPlayButton()
        
        //Add the Title lable
        self.addTitleLabel()
        
    }
    
    //Start the tutorial
    public func startTutorial(){
        
        //Add the speaker image
        self.addSpeaker()
        
        //Configurate the backgrounds
        self.configurateBackGrounds()
        
        //Add the tutorial label
        self.fisrtTutorialLabel()
        
        //Add the Left Label
        self.addLeftLabel()
        
        //Add the buttons
        self.addButtons()
        
        //Start the left song tutorial
        let playLeft1 = SKAction.playSoundFileNamed("left1.mpeg", waitForCompletion: true)
        let playerLeft2 = SKAction.playSoundFileNamed("left2.mpeg", waitForCompletion: true)
        let playerLeftAction = SKAction.sequence([playLeft1, playerLeft2])
        self.run(playerLeftAction, withKey: "playerLeftAction")
        
    }
    
    
    //Methods
    
    //Add the Ready Label
    func setupTutorialSongSequences() {
        
    }
    
    public func addReadyLabel(){
        self.textLabelReady = SKLabelNode()
        self.textLabelReady?.text = "Get Ready..."
        self.textLabelReady?.position = CGPoint(x:frame.midX , y: frame.midY)
        self.textLabelReady?.fontName = "Arial"
        self.textLabelReady?.fontSize = 24
        self.textLabelReady?.fontColor = textLabelColor
        self.addChild((self.textLabelReady!))
    }
    
    //Remove the Ready Label
    public func removeReadyLabel(){
        self.textLabelReady?.removeFromParent()
    }
    
    //Add the play Label
    public func addPlayLagel(){
        self.textLabelPlay = SKLabelNode()
        self.textLabelPlay?.text = "Let's Play!"
        self.textLabelPlay?.position = CGPoint(x:frame.midX , y: frame.midY)
        self.textLabelPlay?.fontName = "Arial"
        self.textLabelPlay?.fontSize = 24
        self.textLabelPlay?.fontColor = textLabelColor
        self.addChild((self.textLabelPlay!))
    }

    
    //Remove the playLabel
    public func removePlayLabel(){
        self.textLabelPlay?.removeFromParent()
    }
    
    //Add the Play Button
    public func addPlayButton(){
        
        let playButton = SKSpriteNode(imageNamed: "playButton.png")
        playButton.position = CGPoint(x: frame.midX*1.1, y:frame.midY)
        playButton.name = "playButton"
        
        self.playButton = playButton
        self.addChild(playButton)
    }
    
    //Remove the Play Button
    public func removePlayButton(){

        self.playButton?.removeFromParent()
    }
    
    //Add the TitleLabel
    public func addTitleLabel(){
        
        //TitleLabel
        self.textLabelTitle = SKLabelNode()
        self.textLabelTitle?.text = "MUSIC ATTENTION"
        self.textLabelTitle?.position = CGPoint(x:frame.midX , y: frame.midY*1.7)
        self.textLabelTitle?.fontName = "Arial"
        self.textLabelTitle?.fontSize = 24
        self.textLabelTitle?.fontColor = textLabelColor
        self.addChild((self.textLabelTitle!))
    }
    
    //Remove the TitleLabel
    public func removeTitleLabel(){
        
        self.textLabelTitle?.removeFromParent()
        
    }
    
    //Inicializate the speaker
    public func addSpeaker(){
        
        let side = frame.width*0.1
        let speaker = SKSpriteNode(imageNamed: "headphone.png")
        speaker.position = CGPoint(x: frame.midX, y: frame.midY*(1.5))
        speaker.size = CGSize( width: side, height: side)
        
        self.speaker = speaker
        self.addChild(speaker)
        
    }
    
    //Remove the speaker
    public func removeSpeaker(){
        
        self.speaker?.removeFromParent()
    }
    
    //Add the orange background
    public func addBackGround(){
        
        //Orange BackGround
        let orangePosition = CGPoint(x: frame.midX, y: frame.midY)
        orangeBackGround.position = orangePosition
        scene?.addChild(orangeBackGround)
    }
    
    //Add the Score Label
    public func addScoreLabel(){
        //Label Text
        self.textLabelScore = SKLabelNode()
        self.textLabelScore?.numberOfLines = 2
        self.textLabelScore?.position = CGPoint(x:frame.midX , y: frame.midY*1.6)
        self.textLabelScore?.fontName = "Arial Bold"
        self.textLabelScore?.fontColor = #colorLiteral(red: 0, green: 0.462745098, blue: 0.6980392157, alpha: 1)
        self.addChild((self.textLabelScore!))
        
    }
    
    //Configurate the backgrounds
    public func configurateBackGrounds(){
        
        //Green BackGround
        let greenPosition = CGPoint(x: frame.midX, y: frame.midY)
        greenBackGround.position = greenPosition
        
        //Red BackGround
        let redPosition = CGPoint(x: frame.midX, y: frame.midY)
        redBackGround.position = redPosition
    }
    
    //Add the buttons
    public func addButtons(){
        
        //Left Button
        leftButton = SKSpriteNode(color: SKColor.clear, size: CGSize(width: frame.size.width*0.5, height: frame.size.height*1.5))
        leftButton?.position = CGPoint(x: 95, y: 170)
        leftButton?.name = "left"
        self.addChild(leftButton!)
        
        
        //Right Button
        rightButton = SKSpriteNode(color: SKColor.clear, size: CGSize(width: frame.size.width*0.5, height: frame.size.height*1.5))
        rightButton?.position = CGPoint(x: 280, y: 170)
        rightButton?.name = "right"
        self.addChild(rightButton!)
    }
    
    //Add the tutorial label
    public func fisrtTutorialLabel(){
        
        //Tutorial Label
        self.textLabelTutorial = SKLabelNode()
        self.textLabelTutorial?.text = "Wear headphones for a better experience"
        self.textLabelTutorial?.position = CGPoint(x:frame.midX , y: frame.midY*1.7)
        self.textLabelTutorial?.fontName = "Arial"
        self.textLabelTutorial?.fontSize = 18
        self.textLabelTutorial?.fontColor = textLabelColor
        self.addChild((self.textLabelTutorial!))
    }
    
    //Remove the tutorial label
    public func removeTutorialLabel(){
        self.textLabelTutorial?.removeFromParent()
        
    }
    
    //Add the left label
    public func addLeftLabel(){
        
        //First left label
        self.textLabelLeft1 = SKLabelNode()
        self.textLabelLeft1?.text = "When you hear sound on left"
        self.textLabelLeft1?.position = CGPoint(x:frame.midX*0.512 , y: frame.midY*0.47)
        self.textLabelLeft1?.fontName = "Arial"
        self.textLabelLeft1?.fontSize = 15
        self.textLabelLeft1?.fontColor = textLabelColor
        
        //Second left label
        self.textLabelLeft2 = SKLabelNode()
        self.textLabelLeft2?.text = "TOUCH IN THE LEFT"
        self.textLabelLeft2?.position = CGPoint(x: frame.midX*0.512, y: frame.midY*0.4)
        self.textLabelLeft2?.fontName = "Arial"
        self.textLabelLeft2?.fontSize = 15
        self.textLabelLeft2?.fontColor = textLabelColor
        
        
        self.addChild(self.textLabelLeft1!)
        self.addChild(self.textLabelLeft2!)
        
    }
    
    //Remove the left label
    public func removeLeftLabel(){
        self.textLabelLeft1?.removeFromParent()
        self.textLabelLeft2?.removeFromParent()
    }
    
    //Add the right label
    public func addRightLabel(){
        
        //First right label
        self.textLabelRight1 = SKLabelNode()
        self.textLabelRight1?.text = "When you hear sound on right"
        self.textLabelRight1?.position = CGPoint(x:frame.midX*1.45 , y: frame.midY*0.47)
        self.textLabelRight1?.fontName = "Arial"
        self.textLabelRight1?.fontSize = 15
        self.textLabelRight1?.fontColor = textLabelColor
        
        //Second right label
        self.textLabelRight2 = SKLabelNode()
        self.textLabelRight2?.text = "TOUCH IN THE RIGHT"
        self.textLabelRight2?.position = CGPoint(x: frame.midX*1.512, y: frame.midY*0.4)
        self.textLabelRight2?.fontName = "Arial"
        self.textLabelRight2?.fontSize = 15
        self.textLabelRight2?.fontColor = textLabelColor
        
        
        self.addChild(self.textLabelRight1!)
        self.addChild(self.textLabelRight2!)
    }
    
    //Remove right label
    public func removeRightLabel(){
        self.textLabelRight1?.removeFromParent()
        self.textLabelRight2?.removeFromParent()
    }
    
    
    
    //Start the game with song
    public func startGame(){
        
        //Add the music
        addScoreLabel()
        restartTimer()
        let playAction = SKAction.playSoundFileNamed("music.mpeg", waitForCompletion: false)
        self.scene?.run(playAction)
        
    }
    
    //Timer for the music
    public func restartTimer() {
        
        let wait = SKAction.wait(forDuration: 0.5)
        let finishTimer = SKAction.run {
            self.timerS = self.timerS + 0.5
            self.waitTimer -= 0.5
            
            if self.timerS < 86 {
                self.restartTimer()
            }
            
            if (self.waitTimer.remainder(dividingBy: 1) == 0) && (self.waitTimer > 0) {
                
                if(self.waitTimer==20){
                    self.addReadyLabel()
                }
                
                if(self.waitTimer<=1){
                    self.textLabelScore?.text = "SCORE"                    
                }else{
                    self.textLabelScore?.text = "\(Int(self.waitTimer))"
                }
                
                if(self.waitTimer == 2){
                    
                    self.removeReadyLabel()
                    self.addPlayLagel()

                    self.run(SKAction.wait(forDuration: 1), completion: {
                        self.removePlayLabel()
                    })
                }
            }
            
            print(self.timerS)
        }
        
        let seq = SKAction.sequence([wait, finishTimer])
        self.run(seq)
    }
    
    public override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        
    }
}
