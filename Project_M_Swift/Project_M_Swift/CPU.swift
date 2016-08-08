import System.Collections.Generic
import System.Linq
import System.Text

public class CPU : Player{

    public init(cpuName : String?, cpuInhalt : Feld.Content, startfelder : Startfeld...){
        super.init(startfelder : startfelder)
        self.playerName = cpuName
        self.playerFarbe = cpuInhalt
    }
}
