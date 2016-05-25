import System
import System.Collections.Generic
import System.ComponentModel
import System.Data
import System.Drawing
import System.Linq
import System.Text
import System.Windows.Forms

public __partial class frm_Einstellungen: Form {
	var frm_menue : MainForm
	public init(menue : MainForm)	{
		frm_menue = menue
		InitializeComponent()
	}

    func frm_Einstellungen_Load(_ sender: System.Object!, _ e: System.EventArgs!) {
            
            //comboBoxen anlegen
            //cmb_spielerfarbe1.Items.Add("hallo");
            //cmb_spielerfarbe1.Items.Add("wergwe");
            //cmb_spielerfarbe1.Text = "Text";
    }

    func btn_zurueck_Click(_ sender: System.Object!, _ e: System.EventArgs!) {
        frm_menue.Show()
        self.Dispose()
    }

    func btn_starten_Click(_ sender: System.Object!, _ e: System.EventArgs!) {
        var frm_spielfeld = frm_Spielfeld(menue : frm_menue , einstellungen : self)
        frm_spielfeld.Show()
        self.Hide()
    }

    func frm_Einstellungen_FormClosing(_ sender: System.Object!, _ e: System.Windows.Forms.FormClosingEventArgs!) {
        frm_menue.Dispose()
    }

    func rbtn_anz_3_CheckedChanged(_ sender: System.Object!, _ e: System.EventArgs!) {
        tb_spieler3.Enabled = true
        cmb_spieler3.Enabled = true
        ckb_spieler3.Enabled = true
        tb_spieler4.Enabled = false 
        cmb_spieler4.Enabled = false
        ckb_spieler4.Enabled = false
    }

    func rbtn_anz_2_CheckedChanged(_ sender: System.Object!, _ e: System.EventArgs!) {
        tb_spieler3.Enabled = false
        cmb_spieler3.Enabled = false
        ckb_spieler3.Enabled = false
        tb_spieler4.Enabled = false 
        cmb_spieler4.Enabled = false
        ckb_spieler4.Enabled = false
    }

    func rbtn_anz_4_CheckedChanged(_ sender: System.Object!, _ e: System.EventArgs!) {
        tb_spieler3.Enabled = true
        cmb_spieler3.Enabled = true
        ckb_spieler3.Enabled = false
        tb_spieler4.Enabled = true 
        cmb_spieler4.Enabled = true
        ckb_spieler4.Enabled = false
    }
}