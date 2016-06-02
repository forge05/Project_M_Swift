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
    var cmb_player4 : System.Windows.Forms.ComboBox!
    var cmb_player3: System.Windows.Forms.ComboBox!
    var cmb_player2: System.Windows.Forms.ComboBox!
    var cmb_player1: System.Windows.Forms.ComboBox!
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
        self.cmb_player1 = System.Windows.Forms.ComboBox()
        self.cmb_player2 = System.Windows.Forms.ComboBox()
        self.cmb_player3 = System.Windows.Forms.ComboBox()
        self.cmb_player4 = System.Windows.Forms.ComboBox()
        self.ckb_player1 = System.Windows.Forms.CheckBox()
        self.ckb_player2 = System.Windows.Forms.CheckBox()
        self.ckb_player3 =  System.Windows.Forms.CheckBox()
        self.ckb_player4 = System.Windows.Forms.CheckBox()
        self.btn_zurueck = System.Windows.Forms.Button()
        self.btn_starten = System.Windows.Forms.Button()
        self.SuspendLayout()
        //  lbl_anzahl_player
        self.lbl_anzahlPlayer.AutoSize = true
        self.lbl_anzahlPlayer.Location = System.Drawing.Point(184, 97)
        self.lbl_anzahlPlayer.Name = "lbl_anzahlPlayer"
        self.lbl_anzahlPlayer.Size = System.Drawing.Size(107, 17)
        self.lbl_anzahlPlayer.TabIndex = 0
        self.lbl_anzahlPlayer.Text = "Anzahl player?"
        //  lbl_player1
        self.lbl_player1.AutoSize = true
        self.lbl_player1.Location = System.Drawing.Point(98, 147)
        self.lbl_player1.Name = "lbl_player1"
        self.lbl_player1.Size = System.Drawing.Size(64, 17)
        self.lbl_player1.TabIndex = 1
        self.lbl_player1.Text = "player 1"
        //  lbl_player2
        self.lbl_player2.AutoSize = true
        self.lbl_player2.Location = System.Drawing.Point(98, 188)
        self.lbl_player2.Name = "lbl_player2"
        self.lbl_player2.Size = System.Drawing.Size(64, 17)
        self.lbl_player2.TabIndex = 2
        self.lbl_player2.Text = "player 2"
        //  lbl_player3
        self.lbl_player3.AutoSize = true
        self.lbl_player3.Location = System.Drawing.Point(98, 224)
        self.lbl_player3.Name = "lbl_player3"
        self.lbl_player3.Size = System.Drawing.Size(64, 17)
        self.lbl_player3.TabIndex = 3
        self.lbl_player3.Text = "player 3"
        //  lbl_player4
        self.lbl_player4.AutoSize = true
        self.lbl_player4.Location = System.Drawing.Point(98, 259)
        self.lbl_player4.Name = "lbl_player4"
        self.lbl_player4.Size = System.Drawing.Size(64, 17)
        self.lbl_player4.TabIndex = 4
        self.lbl_player4.Text = "player 4"
        //  rbtn_anz_2
        self.rbtn_anz_2.AutoSize = true
        self.rbtn_anz_2.Location = System.Drawing.Point(298, 97)
        self.rbtn_anz_2.Name = "rbtn_anz_2"
        self.rbtn_anz_2.Size = System.Drawing.Size(37, 21)
        self.rbtn_anz_2.TabIndex = 5
        self.rbtn_anz_2.Text = "2"
        self.rbtn_anz_2.UseVisualStyleBackColor = true
        self.rbtn_anz_2.CheckedChanged += System.EventHandler(self.rbtn_anz_2_CheckedChanged)
        //  rbtn_anz_3
        self.rbtn_anz_3.AutoSize = true
        self.rbtn_anz_3.Location = System.Drawing.Point(342, 97)
        self.rbtn_anz_3.Name = "rbtn_anz_3"
        self.rbtn_anz_3.Size = System.Drawing.Size(37, 21)
        self.rbtn_anz_3.TabIndex = 6
        self.rbtn_anz_3.Text = "3"
        self.rbtn_anz_3.UseVisualStyleBackColor = true
        self.rbtn_anz_3.CheckedChanged += System.EventHandler(self.rbtn_anz_3_CheckedChanged)
        //  rbtn_anz_4
        self.rbtn_anz_4.AutoSize = true
        self.rbtn_anz_4.Checked = true
        self.rbtn_anz_4.Location = System.Drawing.Point(386, 97)
        self.rbtn_anz_4.Name = "rbtn_anz_4"
        self.rbtn_anz_4.Size = System.Drawing.Size(37, 21)
        self.rbtn_anz_4.TabIndex = 7
        self.rbtn_anz_4.TabStop = true
        self.rbtn_anz_4.Text = "4"
        self.rbtn_anz_4.UseVisualStyleBackColor = true
        self.rbtn_anz_4.CheckedChanged += System.EventHandler(self.rbtn_anz_4_CheckedChanged)
        //  tb_player1
        self.tb_player1.Location = System.Drawing.Point(193, 144)
        self.tb_player1.Name = "tb_player1"
        self.tb_player1.Size = System.Drawing.Size(100, 22)
        self.tb_player1.TabIndex = 8
        self.tb_player1.Text = "Red"
        //  tb_player2
        self.tb_player2.Location = System.Drawing.Point(193, 185)
        self.tb_player2.Name = "tb_player2"
        self.tb_player2.Size = System.Drawing.Size(100, 22)
        self.tb_player2.TabIndex = 9
        self.tb_player2.Text = "Green"
        //  tb_player3
        self.tb_player3.Location = System.Drawing.Point(193, 221)
        self.tb_player3.Name = "tb_player3"
        self.tb_player3.Size = System.Drawing.Size(100, 22)
        self.tb_player3.TabIndex = 10
        self.tb_player3.Text = "Yellow"
        //  tb_player4
        self.tb_player4.Location = System.Drawing.Point(193, 256)
        self.tb_player4.Name = "tb_player4"
        self.tb_player4.Size = System.Drawing.Size(100, 22)
        self.tb_player4.TabIndex = 11
        self.tb_player4.Text = "Blue"
        //  cmb_player1
        self.cmb_player1.FormattingEnabled = true
        self.cmb_player1.Location = System.Drawing.Point(300, 144)
        self.cmb_player1.Name = "cmb_player1"
        self.cmb_player1.Size = System.Drawing.Size(121, 24)
        self.cmb_player1.TabIndex = 12
        //  cmb_player2
        self.cmb_player2.FormattingEnabled = true
        self.cmb_player2.Location = System.Drawing.Point(300, 185)
        self.cmb_player2.Name = "cmb_player2"
        self.cmb_player2.Size = System.Drawing.Size(121, 24)
        self.cmb_player2.TabIndex = 13
        //  cmb_player3
        self.cmb_player3.FormattingEnabled = true
        self.cmb_player3.Location = System.Drawing.Point(300, 221)
        self.cmb_player3.Name = "cmb_player3"
        self.cmb_player3.Size = System.Drawing.Size(121, 24)
        self.cmb_player3.TabIndex = 14
        //  cmb_player4
        self.cmb_player4.FormattingEnabled = true
        self.cmb_player4.Location = System.Drawing.Point(300, 256)
        self.cmb_player4.Name = "cmb_player4"
        self.cmb_player4.Size = System.Drawing.Size(121, 24)
        self.cmb_player4.TabIndex = 15
        //  ckb_player1
        self.ckb_player1.AutoSize = true
        self.ckb_player1.Location = System.Drawing.Point(439, 142)
        self.ckb_player1.Name = "ckb_player1"
        self.ckb_player1.Size = System.Drawing.Size(58, 21)
        self.ckb_player1.TabIndex = 16
        self.ckb_player1.Text = "CPU"
        self.ckb_player1.UseVisualStyleBackColor = true
        //  ckb_player2
        self.ckb_player2.AutoSize = true
        self.ckb_player2.Location = System.Drawing.Point(439, 187)
        self.ckb_player2.Name = "ckb_player2"
        self.ckb_player2.Size = System.Drawing.Size(58, 21)
        self.ckb_player2.TabIndex = 17
        self.ckb_player2.Text = "CPU"
        self.ckb_player2.UseVisualStyleBackColor = true
        //  ckb_player3
        self.ckb_player3.AutoSize = true
        self.ckb_player3.Location = System.Drawing.Point(439, 223)
        self.ckb_player3.Name = "ckb_player3"
        self.ckb_player3.Size = System.Drawing.Size(58, 21)
        self.ckb_player3.TabIndex = 18
        self.ckb_player3.Text = "CPU"
        self.ckb_player3.UseVisualStyleBackColor = true
        //  ckb_player4
        self.ckb_player4.AutoSize = true
        self.ckb_player4.Location = System.Drawing.Point(439, 258)
        self.ckb_player4.Name = "ckb_player4"
        self.ckb_player4.Size = System.Drawing.Size(58, 21)
        self.ckb_player4.TabIndex = 19 
        self.ckb_player4.Text = "ckb_player4"
        self.ckb_player4.UseVisualStyleBackColor = true
        //  btn_zurueck
        self.btn_zurueck.Location = System.Drawing.Point(101, 297)
        self.btn_zurueck.Name = "btn_zurueck"
        self.btn_zurueck.Size = System.Drawing.Size(192, 23)
        self.btn_zurueck.TabIndex = 20
        self.btn_zurueck.Text = "Zurück zum Menü"
        self.btn_zurueck.UseVisualStyleBackColor = true
        self.btn_zurueck.Click += System.EventHandler(self.btn_zurueck_Click)
        //  btn_starten
        self.btn_starten.Location = System.Drawing.Point(300, 296)
        self.btn_starten.Name = "btn_starten"
        self.btn_starten.Size = System.Drawing.Size(197, 23)
        self.btn_starten.TabIndex = 21
        self.btn_starten.Text = "Spiel starten"
        self.btn_starten.UseVisualStyleBackColor = true
        self.btn_starten.Click += System.EventHandler(self.btn_starten_Click)
        //  frm_Einstellungen
        self.AutoScaleDimensions = System.Drawing.SizeF(8.0, 16)
        self.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        self.ClientSize = System.Drawing.Size(590, 390)
        self.Controls.Add(self.btn_starten)
        self.Controls.Add(self.btn_zurueck)
        self.Controls.Add(self.ckb_player4)
        self.Controls.Add(self.ckb_player3)
        self.Controls.Add(self.ckb_player2)
        self.Controls.Add(self.ckb_player1)
        self.Controls.Add(self.cmb_player4)
        self.Controls.Add(self.cmb_player3)
        self.Controls.Add(self.cmb_player2)
        self.Controls.Add(self.cmb_player1)
        self.Controls.Add(self.tb_player4)
        self.Controls.Add(self.tb_player3)
        self.Controls.Add(self.tb_player2)
        self.Controls.Add(self.tb_player1)
        self.Controls.Add(self.rbtn_anz_4)
        self.Controls.Add(self.rbtn_anz_3)
        self.Controls.Add(self.rbtn_anz_2)
        self.Controls.Add(self.lbl_player4)
        self.Controls.Add(self.lbl_player3)
        self.Controls.Add(self.lbl_player2)
        self.Controls.Add(self.lbl_player1)
        self.Controls.Add(self.lbl_anzahlPlayer)
        self.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
        self.Name = "frm_Einstellungen"
        self.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        self.Text = "frm_Einstellungen"
        self.FormClosing += System.Windows.Forms.FormClosingEventHandler(self.frm_Einstellungen_FormClosing)
        self.Load += System.EventHandler(self.frm_Einstellungen_Load)
        self.ResumeLayout(false)
        self.PerformLayout()
    }

	#endregion
}