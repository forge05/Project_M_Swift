import System
import System.Collections.Generic
import System.ComponentModel
import System.Data
import System.Drawing
import System.Linq
import System.Text
import System.Windows.Forms

public __partial class frm_Einstellungen : Form {
	var frm_Menue : MainForm
	public init(myFrm: MainForm)	{
		frm_Menue = myFrm
		InitializeComponent()
	}

    func btn_zurueck_Click(_ sender: System.Object!, _ e: System.EventArgs!) {
        frm_Menue.Show()
        self.Hide()
    }

    func btn_starten_Click(_ sender: System.Object!, _ e: System.EventArgs!) {
        var Spiel = frm_Spielfeld(myFrm_M: frm_Menue , myFrm_E: self)
        Spiel.Show()
        self.Hide()
    }

    func frm_Einstellungen_Load(_ sender: System.Object!, _ e: System.EventArgs!) {
            
        //comboBoxen anlegen
        //cmb_spielerfarbe1.Items.Add("hallo");
        //cmb_spielerfarbe1.Items.Add("wergwe");
        //cmb_spielerfarbe1.Text = "Text";
    }

    func frm_Einstellungen_FormClosing(_ sender: System.Object!, _ e: System.Windows.Forms.FormClosingEventArgs!) {
        frm_Menue.Dispose()
        self.Dispose();
    }

    func rbtn_CheckedChange(_ sender: System.Object!, _ e: System.EventArgs!) {
        if(rbtn_anz_2.Checked)
        {
            tb_player3.Enabled = false;
            tb_player3.Text = "Yellow";
            //ckb_cpu_s3.Enabled = false;
            tb_player4.Enabled = false;
            tb_player4.Text = "Blue";
            //ckb_cpu_s4.Enabled = false;
        }
        else if(rbtn_anz_3.Checked)
        {
            tb_player3.Enabled = true;
            //ckb_cpu_s3.Enabled = true;
            tb_player4.Enabled = false;
            tb_player4.Text = "Blue";
            //ckb_cpu_s4.Enabled = false;
        }
        else
        {
            tb_player3.Enabled = true;
            //ckb_cpu_s3.Enabled = true;
            tb_player4.Enabled = true;
            //ckb_cpu_s4.Enabled = true;
        }
    }
}