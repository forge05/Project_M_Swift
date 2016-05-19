import System.Collections.Generic
import System.Linq
import System.Text
import System.Windows.Forms


public class Feld : Button {
    var entfernung_zum_ziel : Integer?
    var inhalt : Content?
    var nachbarn : Feld[]?
    var schonGeruecktWorden = false
    var button1: System.Windows.Forms.Button!
    

    func setAttributes(c : Feld.Content , distanz : Integer){
        entfernung_zum_ziel = distanz
        inhalt = c
    }

    func setNachbar(felder : Feld...){
        nachbarn = felder
    }

    public enum Content : Integer{
        case RED = 1, GREEN, YELLOW, BLUE, BLACK, GOAL, BLOCK

//        private final int stelle
//
//        content(int stelle) {
//            this.stelle = stelle
//        }
//
//        public int getStelle() {
//            return this.stelle
//        }
    }


//    func InitializeComponent() {
//        self.button1 = System.Windows.Forms.Button()
//        self.SuspendLayout()
//        //  button1
//        self.button1.Location = System.Drawing.Point(0, 0)
//        self.button1.Name = "button1"
//        self.button1.Size = System.Drawing.Size(75, 23)
//        self.button1.TabIndex = 0
//        self.button1.Text = "button1"
//        self.button1.UseVisualStyleBackColor = true
//        self.ResumeLayout(false)
//    }
}
