import System.Collections.Generic
import System.Linq
import System.Text
import System.Windows.Forms


public class Feld : Button {
    
    var nachbarn : Feld[]?
    var inhalt : Content?
    var entfernung_zum_ziel : Int32?
    

    func setAttributes(inhalt : Feld.Content , distanz : Integer){
        self.inhalt = inhalt
        entfernung_zum_ziel = distanz
    }

    func setNachbar(felder : Feld...){
        nachbarn = felder
    }

    public enum Content{
        case RED = 1, GREEN = 2, YELLOW = 3, BLUE = 4, BLACK = 5, GOAL = 6, BLOCK = 7
        //case RED = 1, GREEN, YELLOW, BLUE, BLACK, GOAL, BLOCK             //Nummerierung wird implizit fortgeführt
    }
}
