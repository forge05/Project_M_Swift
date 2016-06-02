import System.Collections.Generic
import System.Linq
import System.Text


public class Player {

    var spielerFarbe : Feld.Content?
    var spielerName : String?
    var startfeldArray : Startfeld[]

    public init(startfelder : Startfeld[]){
        startfeldArray = startfelder
    }

}
