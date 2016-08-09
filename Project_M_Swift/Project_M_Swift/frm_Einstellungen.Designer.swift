public __partial class frm_Einstellungen {
		
	/// <summary>
	/// Required designer variable.
	/// </summary>
	var components: System.ComponentModel.IContainer! = nil
    var btn_starten: System.Windows.Forms.Button!
    var btn_zurueck: System.Windows.Forms.Button!
    var ckb_player4: System.Windows.Forms.CheckBox!
    var ckb_player3: System.Windows.Forms.CheckBox!
    var ckb_player2: System.Windows.Forms.CheckBox!
    var ckb_player1: System.Windows.Forms.CheckBox!
    
    
    
    
    var rbtn_anz_4: System.Windows.Forms.RadioButton!
    var rbtn_anz_3: System.Windows.Forms.RadioButton!
    var rbtn_anz_2: System.Windows.Forms.RadioButton!
    var lbl_player4: System.Windows.Forms.Label!
    var lbl_player3: System.Windows.Forms.Label!
    var lbl_player2: System.Windows.Forms.Label!
    var lbl_player1: System.Windows.Forms.Label!
    var lbl_anzahlPlayer: System.Windows.Forms.Label!
    var tb_player4: System.Windows.Forms.TextBox!
    var tb_player3: System.Windows.Forms.TextBox!
    var tb_player2: System.Windows.Forms.TextBox!
    var tb_player1: System.Windows.Forms.TextBox!
    var gb_s_setup: System.Windows.Forms.GroupBox!
    var label4: System.Windows.Forms.Label!
    var label3: System.Windows.Forms.Label!
    var label2: System.Windows.Forms.Label!
    var label1: System.Windows.Forms.Label!

	/// <summary>
	/// Clean up any resources being used.
	/// </summary>
	/// <param name="disposing">true if managed resources should be disposed otherwise, false.</param>
	public override func Dispose(disposing: Boolean) {
		
		if (disposing && (components != nil)) {	
			
			components.Dispose()
		}
		super.Dispose(disposing)
	}

	#region Windows Form Designer generated code

	/// <summary>
	/// Required method for Designer support - do not modify
	/// the contents of this method with the code editor.
	/// </summary>
	func InitializeComponent() {
        self.lbl_anzahlPlayer = System.Windows.Forms.Label()
        self.lbl_player1 = System.Windows.Forms.Label()
        self.lbl_player2 = System.Windows.Forms.Label()
        self.lbl_player3 = System.Windows.Forms.Label()
        self.lbl_player4 = System.Windows.Forms.Label()
        self.rbtn_anz_2 = System.Windows.Forms.RadioButton()
        self.rbtn_anz_3 = System.Windows.Forms.RadioButton()
        self.rbtn_anz_4 = System.Windows.Forms.RadioButton()
        self.tb_player1 = System.Windows.Forms.TextBox()
        self.tb_player2 = System.Windows.Forms.TextBox()
        self.tb_player3 = System.Windows.Forms.TextBox()
        self.tb_player4 = System.Windows.Forms.TextBox()
        self.ckb_player1 = System.Windows.Forms.CheckBox()
        self.ckb_player2 = System.Windows.Forms.CheckBox()
        self.ckb_player3 = System.Windows.Forms.CheckBox()
        self.ckb_player4 = System.Windows.Forms.CheckBox()
        self.btn_zurueck = System.Windows.Forms.Button()
        self.btn_starten = System.Windows.Forms.Button()
        self.label1 = System.Windows.Forms.Label()
        self.label2 = System.Windows.Forms.Label()
        self.label3 = System.Windows.Forms.Label()
        self.label4 = System.Windows.Forms.Label()
        self.gb_s_setup = System.Windows.Forms.GroupBox()
        self.gb_s_setup.SuspendLayout()
        self.SuspendLayout()
        //  lbl_anzahlPlayer
        self.lbl_anzahlPlayer.AutoSize = true
        self.lbl_anzahlPlayer.Location = System.Drawing.Point(23, 32)
        self.lbl_anzahlPlayer.Name = "lbl_anzahlPlayer"
        self.lbl_anzahlPlayer.Size = System.Drawing.Size(107, 17)
        self.lbl_anzahlPlayer.TabIndex = 0
        self.lbl_anzahlPlayer.Text = "Anzahl Spieler?"
        //  lbl_player1
        self.lbl_player1.AutoSize = true
        self.lbl_player1.Location = System.Drawing.Point(23, 74)
        self.lbl_player1.Name = "lbl_player1"
        self.lbl_player1.Size = System.Drawing.Size(68, 17)
        self.lbl_player1.TabIndex = 1
        self.lbl_player1.Text = "Spieler 1:"
        //  lbl_player2
        self.lbl_player2.AutoSize = true
        self.lbl_player2.Location = System.Drawing.Point(23, 102)
        self.lbl_player2.Name = "lbl_player2"
        self.lbl_player2.Size = System.Drawing.Size(68, 17)
        self.lbl_player2.TabIndex = 2
        self.lbl_player2.Text = "Spieler 2:"
        //  lbl_player3
        self.lbl_player3.AutoSize = true
        self.lbl_player3.Location = System.Drawing.Point(23, 130)
        self.lbl_player3.Name = "lbl_player3"
        self.lbl_player3.Size = System.Drawing.Size(68, 17)
        self.lbl_player3.TabIndex = 3
        self.lbl_player3.Text = "Spieler 3:"
        //  lbl_player4
        self.lbl_player4.AutoSize = true
        self.lbl_player4.Location = System.Drawing.Point(23, 158)
        self.lbl_player4.Name = "lbl_player4"
        self.lbl_player4.Size = System.Drawing.Size(68, 17)
        self.lbl_player4.TabIndex = 4
        self.lbl_player4.Text = "Spieler 4:"
        //  rbtn_anz_2
        self.rbtn_anz_2.AutoSize = true
        self.rbtn_anz_2.Location = System.Drawing.Point(137, 32)
        self.rbtn_anz_2.Name = "rbtn_anz_2"
        self.rbtn_anz_2.Size = System.Drawing.Size(37, 21)
        self.rbtn_anz_2.TabIndex = 5
        self.rbtn_anz_2.Text = "2"
        self.rbtn_anz_2.UseVisualStyleBackColor = true
        self.rbtn_anz_2.CheckedChanged += System.EventHandler(self.rbtn_CheckedChange)
        //  rbtn_anz_3
        self.rbtn_anz_3.AutoSize = true
        self.rbtn_anz_3.Location = System.Drawing.Point(181, 32)
        self.rbtn_anz_3.Name = "rbtn_anz_3"
        self.rbtn_anz_3.Size = System.Drawing.Size(37, 21)
        self.rbtn_anz_3.TabIndex = 6
        self.rbtn_anz_3.Text = "3"
        self.rbtn_anz_3.UseVisualStyleBackColor = true
        self.rbtn_anz_3.CheckedChanged += System.EventHandler(self.rbtn_CheckedChange)
        //  rbtn_anz_4
        self.rbtn_anz_4.AutoSize = true
        self.rbtn_anz_4.Checked = true
        self.rbtn_anz_4.Location = System.Drawing.Point(225, 32)
        self.rbtn_anz_4.Name = "rbtn_anz_4"
        self.rbtn_anz_4.Size = System.Drawing.Size(37, 21)
        self.rbtn_anz_4.TabIndex = 7
        self.rbtn_anz_4.TabStop = true
        self.rbtn_anz_4.Text = "4"
        self.rbtn_anz_4.UseVisualStyleBackColor = true
        self.rbtn_anz_4.CheckedChanged += System.EventHandler(self.rbtn_CheckedChange)
        //  tb_player1
        self.tb_player1.Location = System.Drawing.Point(97, 71)
        self.tb_player1.Name = "tb_player1"
        self.tb_player1.Size = System.Drawing.Size(100, 22)
        self.tb_player1.TabIndex = 8
        self.tb_player1.Text = "Red"
        //  tb_player2
        self.tb_player2.Location = System.Drawing.Point(97, 99)
        self.tb_player2.Name = "tb_player2"
        self.tb_player2.Size = System.Drawing.Size(100, 22)
        self.tb_player2.TabIndex = 9
        self.tb_player2.Text = "Green"
        //  tb_player3
        self.tb_player3.Location = System.Drawing.Point(97, 127)
        self.tb_player3.Name = "tb_player3"
        self.tb_player3.Size = System.Drawing.Size(100, 22)
        self.tb_player3.TabIndex = 10
        self.tb_player3.Text = "Yellow"
        //  tb_player4
        self.tb_player4.Location = System.Drawing.Point(97, 155)
        self.tb_player4.Name = "tb_player4"
        self.tb_player4.Size = System.Drawing.Size(100, 22)
        self.tb_player4.TabIndex = 11
        self.tb_player4.Text = "Blue"
        //  ckb_player1
        self.ckb_player1.AutoSize = true
        self.ckb_player1.Enabled = false
        self.ckb_player1.Location = System.Drawing.Point(234, 72)
        self.ckb_player1.Name = "ckb_player1"
        self.ckb_player1.Size = System.Drawing.Size(58, 21)
        self.ckb_player1.TabIndex = 16
        self.ckb_player1.Text = "CPU"
        self.ckb_player1.UseVisualStyleBackColor = true
        //  ckb_player2
        self.ckb_player2.AutoSize = true
        self.ckb_player2.Enabled = false
        self.ckb_player2.Location = System.Drawing.Point(234, 100)
        self.ckb_player2.Name = "ckb_player2"
        self.ckb_player2.Size = System.Drawing.Size(58, 21)
        self.ckb_player2.TabIndex = 17
        self.ckb_player2.Text = "CPU"
        self.ckb_player2.UseVisualStyleBackColor = true
        //  ckb_player3
        self.ckb_player3.AutoSize = true
        self.ckb_player3.Enabled = false
        self.ckb_player3.Location = System.Drawing.Point(234, 128)
        self.ckb_player3.Name = "ckb_player3"
        self.ckb_player3.Size = System.Drawing.Size(58, 21)
        self.ckb_player3.TabIndex = 18
        self.ckb_player3.Text = "CPU"
        self.ckb_player3.UseVisualStyleBackColor = true
        //  ckb_player4
        self.ckb_player4.AutoSize = true
        self.ckb_player4.Enabled = false
        self.ckb_player4.Location = System.Drawing.Point(234, 156)
        self.ckb_player4.Name = "ckb_player4"
        self.ckb_player4.Size = System.Drawing.Size(58, 21)
        self.ckb_player4.TabIndex = 19
        self.ckb_player4.Text = "CPU"
        self.ckb_player4.UseVisualStyleBackColor = true
        //  btn_zurueck
        self.btn_zurueck.Location = System.Drawing.Point(61, 238)
        self.btn_zurueck.Name = "btn_zurueck"
        self.btn_zurueck.Size = System.Drawing.Size(197, 23)
        self.btn_zurueck.TabIndex = 20
        self.btn_zurueck.Text = "Zurück zum Menü"
        self.btn_zurueck.UseVisualStyleBackColor = true
        self.btn_zurueck.Click += System.EventHandler(self.btn_zurueck_Click)
        //  btn_starten
        self.btn_starten.Location = System.Drawing.Point(61, 209)
        self.btn_starten.Name = "btn_starten"
        self.btn_starten.Size = System.Drawing.Size(197, 23)
        self.btn_starten.TabIndex = 21
        self.btn_starten.Text = "Spiel starten"
        self.btn_starten.UseVisualStyleBackColor = true
        self.btn_starten.Click += System.EventHandler(self.btn_starten_Click)
        //  label1
        self.label1.BackColor = System.Drawing.Color.Red
        self.label1.Location = System.Drawing.Point(203, 71)
        self.label1.Name = "label1"
        self.label1.Size = System.Drawing.Size(25, 22)
        self.label1.TabIndex = 22
        //  label2
        self.label2.BackColor = System.Drawing.Color.FromArgb((0 as! System.Byte) as! System.Int32, (192 as! System.Byte) as! System.Int32, (0 as! System.Byte) as! System.Int32)
        self.label2.Location = System.Drawing.Point(203, 99)
        self.label2.Name = "label2"
        self.label2.Size = System.Drawing.Size(25, 22)
        self.label2.TabIndex = 23
        //  label3
        self.label3.BackColor = System.Drawing.Color.Yellow
        self.label3.Location = System.Drawing.Point(203, 127)
        self.label3.Name = "label3"
        self.label3.Size = System.Drawing.Size(25, 22)
        self.label3.TabIndex = 24
        //  label4
        self.label4.BackColor = System.Drawing.Color.Blue
        self.label4.Location = System.Drawing.Point(203, 155)
        self.label4.Name = "label4"
        self.label4.Size = System.Drawing.Size(25, 22)
        self.label4.TabIndex = 25
        //  gb_s_setup
        self.gb_s_setup.Controls.Add(self.lbl_anzahlPlayer)
        self.gb_s_setup.Controls.Add(self.label4)
        self.gb_s_setup.Controls.Add(self.lbl_player1)
        self.gb_s_setup.Controls.Add(self.label3)
        self.gb_s_setup.Controls.Add(self.lbl_player2)
        self.gb_s_setup.Controls.Add(self.label2)
        self.gb_s_setup.Controls.Add(self.lbl_player3)
        self.gb_s_setup.Controls.Add(self.label1)
        self.gb_s_setup.Controls.Add(self.lbl_player4)
        self.gb_s_setup.Controls.Add(self.rbtn_anz_2)
        self.gb_s_setup.Controls.Add(self.rbtn_anz_3)
        self.gb_s_setup.Controls.Add(self.ckb_player4)
        self.gb_s_setup.Controls.Add(self.rbtn_anz_4)
        self.gb_s_setup.Controls.Add(self.ckb_player3)
        self.gb_s_setup.Controls.Add(self.tb_player1)
        self.gb_s_setup.Controls.Add(self.ckb_player2)
        self.gb_s_setup.Controls.Add(self.tb_player2)
        self.gb_s_setup.Controls.Add(self.ckb_player1)
        self.gb_s_setup.Controls.Add(self.tb_player3)
        self.gb_s_setup.Controls.Add(self.tb_player4)
        self.gb_s_setup.Location = System.Drawing.Point(12, 12)
        self.gb_s_setup.Name = "gb_s_setup"
        self.gb_s_setup.Size = System.Drawing.Size(296, 191)
        self.gb_s_setup.TabIndex = 26
        self.gb_s_setup.TabStop = false
        self.gb_s_setup.Text = "Spieler-Setup"
        //  frm_Einstellungen
        self.AutoScaleDimensions = System.Drawing.SizeF(8.0, 16)
        self.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        self.ClientSize = System.Drawing.Size(317, 288)
        self.Controls.Add(self.gb_s_setup)
        self.Controls.Add(self.btn_starten)
        self.Controls.Add(self.btn_zurueck)
        self.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
        self.Name = "frm_Einstellungen"
        self.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        self.Text = "frm_Einstellungen"
        self.FormClosing += System.Windows.Forms.FormClosingEventHandler(self.frm_Einstellungen_FormClosing)
        self.Load += System.EventHandler(self.frm_Einstellungen_Load)
        self.gb_s_setup.ResumeLayout(false)
        self.gb_s_setup.PerformLayout()
        self.ResumeLayout(false)
    }

	#endregion
}