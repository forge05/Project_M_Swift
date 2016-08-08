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
    
    var frmEinstellungen : frm_Einstellungen
	public init() {
		InitializeComponent()
        frmEinstellungen = frm_Einstellungen(myFrm : self)
    }

    func btn_beenden_Click(_ sender: System.Object!, _ e: System.EventArgs!) {
        Dispose()
    }

    func btn_neues_spiel_Click(_ sender: System.Object!, _ e: System.EventArgs!) {
        frmEinstellungen.Show()
        self.Hide()
    }
}