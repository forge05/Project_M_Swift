import System
import System.Collections.Generic
import System.ComponentModel
import System.Data
import System.Drawing
import System.Linq
import System.Text
import System.Threading.Tasks
import System.Windows.Forms

public __partial class MainForm : Form {
    
	public init() {

		InitializeComponent()
    }

    func btn_neues_spiel_Click(_ sender: System.Object!, _ e: System.EventArgs!) {
        var frm_einstellungen = frm_Einstellungen(menue : self)
        frm_einstellungen.Show()
        self.Hide()
    }

    func btn_beenden_Click(_ sender: System.Object!, _ e: System.EventArgs!) {
        self.Dispose()
    }
}