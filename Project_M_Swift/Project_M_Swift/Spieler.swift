import System.Collections.Generic
import System.Linq
import System.Text


public class Spieler : Player{


    public init( inhalt : Feld.Content , name : String?){
        self.spielerFarbe = inhalt
        self.spielerName = name
    }
}
