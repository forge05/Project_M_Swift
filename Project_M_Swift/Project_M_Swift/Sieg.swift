import System
import System.Collections.Generic
import System.ComponentModel
import System.Data
import System.Drawing
import System.Linq
import System.Text
import System.Windows.Forms

public __partial class frm_Sieg: Form {
	var spielfeld : frm_Spielfeld
    var gewinner : String?
	public init(myFrm : frm_Spielfeld, gewinner : String?)	{
		self.gewinner = gewinner
        spielfeld = myFrm
		InitializeComponent()
        lbl_gewinnerName.Text = gewinner
	}

    func btn_okay_Click(_ sender: System.Object!, _ e: System.EventArgs!) {
        spielfeld.Show()
        self.Close()
    }
}