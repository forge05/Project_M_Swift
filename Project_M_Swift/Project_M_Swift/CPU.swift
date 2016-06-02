import System.Collections.Generic
import System.Linq
import System.Text


public class CPU : Player{

    public init(inhalt : Feld.Content , name : String?, startfelder : Startfeld...){
        super.init(startfelder : startfelder)
        self.spielerFarbe = inhalt
        self.spielerName = name
    }
}
