import System.Collections.Generic
import System.Linq
import System.Text

public class Player {

    var playerName : String?
    var playerFarbe : Feld.Content?
    var startfeldArray : Startfeld[]

    public init(startfelder : Startfeld[]){
        startfeldArray = startfelder
    }
}
