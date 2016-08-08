import System.Collections.Generic
import System.Linq
import System.Text

public class Spieler : Player{

    public init(spielerName : String?, spielerFarbe : Feld.Content, startfelder : Startfeld...){
        super.init(startfelder : startfelder)
        self.playerName = spielerName
        self.playerFarbe = spielerFarbe
    }
}
