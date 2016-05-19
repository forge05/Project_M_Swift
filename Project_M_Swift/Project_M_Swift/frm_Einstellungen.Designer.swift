public __partial class frm_Einstellungen {
		
	/// <summary>
	/// Required designer variable.
	/// </summary>
	var components: System.ComponentModel.IContainer! = nil
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    var btn_starten: System.Windows.Forms.Button!
    var btn_zurueck: System.Windows.Forms.Button!
    var ckb_spieler4: System.Windows.Forms.CheckBox!
    var ckb_spieler3: System.Windows.Forms.CheckBox!
    var ckb_spieler2: System.Windows.Forms.CheckBox!
    var ckb_spieler1: System.Windows.Forms.CheckBox!
    var cmb_spieler4: System.Windows.Forms.ComboBox!
    var cmb_spieler3: System.Windows.Forms.ComboBox!
    var cmb_spieler2: System.Windows.Forms.ComboBox!
    var cmb_spieler1: System.Windows.Forms.ComboBox!
    var tb_spieler4: System.Windows.Forms.TextBox!
    var tb_spieler3: System.Windows.Forms.TextBox!
    var tb_spieler2: System.Windows.Forms.TextBox!
    var tb_spieler1: System.Windows.Forms.TextBox!
    var rbtn_anz_4: System.Windows.Forms.RadioButton!
    var rbtn_anz_3: System.Windows.Forms.RadioButton!
    var rbtn_anz_2: System.Windows.Forms.RadioButton!
    var lbl_spieler4: System.Windows.Forms.Label!
    var lbl_spieler3: System.Windows.Forms.Label!
    var lbl_spieler2: System.Windows.Forms.Label!
    var lbl_spieler1: System.Windows.Forms.Label!
    var lbl_anzahl_spieler: System.Windows.Forms.Label!

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
        self.lbl_anzahl_spieler = System.Windows.Forms.Label()
        self.lbl_spieler1 = System.Windows.Forms.Label()
        self.lbl_spieler2 = System.Windows.Forms.Label()
        self.lbl_spieler3 = System.Windows.Forms.Label()
        self.lbl_spieler4 = System.Windows.Forms.Label()
        self.rbtn_anz_2 = System.Windows.Forms.RadioButton()
        self.rbtn_anz_3 = System.Windows.Forms.RadioButton()
        self.rbtn_anz_4 = System.Windows.Forms.RadioButton()
        self.tb_spieler1 = System.Windows.Forms.TextBox()
        self.tb_spieler2 = System.Windows.Forms.TextBox()
        self.tb_spieler3 = System.Windows.Forms.TextBox()
        self.tb_spieler4 = System.Windows.Forms.TextBox()
        self.cmb_spieler1 = System.Windows.Forms.ComboBox()
        self.cmb_spieler2 = System.Windows.Forms.ComboBox()
        self.cmb_spieler3 = System.Windows.Forms.ComboBox()
        self.cmb_spieler4 = System.Windows.Forms.ComboBox()
        self.ckb_spieler1 = System.Windows.Forms.CheckBox()
        self.ckb_spieler2 = System.Windows.Forms.CheckBox()
        self.ckb_spieler3 = System.Windows.Forms.CheckBox()
        self.ckb_spieler4 = System.Windows.Forms.CheckBox()
        self.btn_zurueck = System.Windows.Forms.Button()
        self.btn_starten = System.Windows.Forms.Button()
        self.SuspendLayout()
        //  lbl_anzahl_spieler
        self.lbl_anzahl_spieler.AutoSize = true
        self.lbl_anzahl_spieler.Location = System.Drawing.Point(184, 97)
        self.lbl_anzahl_spieler.Name = "lbl_anzahl_spieler"
        self.lbl_anzahl_spieler.Size = System.Drawing.Size(107, 17)
        self.lbl_anzahl_spieler.TabIndex = 0
        self.lbl_anzahl_spieler.Text = "Anzahl Spieler?"
        //  lbl_spieler1
        self.lbl_spieler1.AutoSize = true
        self.lbl_spieler1.Location = System.Drawing.Point(98, 147)
        self.lbl_spieler1.Name = "lbl_spieler1"
        self.lbl_spieler1.Size = System.Drawing.Size(64, 17)
        self.lbl_spieler1.TabIndex = 1
        self.lbl_spieler1.Text = "Spieler 1"
        //  lbl_spieler2
        self.lbl_spieler2.AutoSize = true
        self.lbl_spieler2.Location = System.Drawing.Point(98, 188)
        self.lbl_spieler2.Name = "lbl_spieler2"
        self.lbl_spieler2.Size = System.Drawing.Size(64, 17)
        self.lbl_spieler2.TabIndex = 2
        self.lbl_spieler2.Text = "Spieler 2"
        //  lbl_spieler3
        self.lbl_spieler3.AutoSize = true
        self.lbl_spieler3.Location = System.Drawing.Point(98, 224)
        self.lbl_spieler3.Name = "lbl_spieler3"
        self.lbl_spieler3.Size = System.Drawing.Size(64, 17)
        self.lbl_spieler3.TabIndex = 3
        self.lbl_spieler3.Text = "Spieler 3"
        //  lbl_spieler4
        self.lbl_spieler4.AutoSize = true
        self.lbl_spieler4.Location = System.Drawing.Point(98, 259)
        self.lbl_spieler4.Name = "lbl_spieler4"
        self.lbl_spieler4.Size = System.Drawing.Size(64, 17)
        self.lbl_spieler4.TabIndex = 4
        self.lbl_spieler4.Text = "Spieler 4"
        //  rbtn_anz_2
        self.rbtn_anz_2.AutoSize = true
        self.rbtn_anz_2.Location = System.Drawing.Point(298, 97)
        self.rbtn_anz_2.Name = "rbtn_anz_2"
        self.rbtn_anz_2.Size = System.Drawing.Size(37, 21)
        self.rbtn_anz_2.TabIndex = 5
        self.rbtn_anz_2.Text = "2"
        self.rbtn_anz_2.UseVisualStyleBackColor = true
        //  rbtn_anz_3
        self.rbtn_anz_3.AutoSize = true
        self.rbtn_anz_3.Location = System.Drawing.Point(342, 97)
        self.rbtn_anz_3.Name = "rbtn_anz_3"
        self.rbtn_anz_3.Size = System.Drawing.Size(37, 21)
        self.rbtn_anz_3.TabIndex = 6
        self.rbtn_anz_3.Text = "3"
        self.rbtn_anz_3.UseVisualStyleBackColor = true
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
        //  tb_spieler1
        self.tb_spieler1.Location = System.Drawing.Point(193, 144)
        self.tb_spieler1.Name = "tb_spieler1"
        self.tb_spieler1.Size = System.Drawing.Size(100, 22)
        self.tb_spieler1.TabIndex = 8
        self.tb_spieler1.Text = "Red"
        //  tb_spieler2
        self.tb_spieler2.Location = System.Drawing.Point(193, 185)
        self.tb_spieler2.Name = "tb_spieler2"
        self.tb_spieler2.Size = System.Drawing.Size(100, 22)
        self.tb_spieler2.TabIndex = 9
        self.tb_spieler2.Text = "Green"
        //  tb_spieler3
        self.tb_spieler3.Location = System.Drawing.Point(193, 221)
        self.tb_spieler3.Name = "tb_spieler3"
        self.tb_spieler3.Size = System.Drawing.Size(100, 22)
        self.tb_spieler3.TabIndex = 10
        self.tb_spieler3.Text = "Yellow"
        //  tb_spieler4
        self.tb_spieler4.Location = System.Drawing.Point(193, 256)
        self.tb_spieler4.Name = "tb_spieler4"
        self.tb_spieler4.Size = System.Drawing.Size(100, 22)
        self.tb_spieler4.TabIndex = 11
        self.tb_spieler4.Text = "Blue"
        //  cmb_spieler1
        self.cmb_spieler1.FormattingEnabled = true
        self.cmb_spieler1.Location = System.Drawing.Point(300, 144)
        self.cmb_spieler1.Name = "cmb_spieler1"
        self.cmb_spieler1.Size = System.Drawing.Size(121, 24)
        self.cmb_spieler1.TabIndex = 12
        //  cmb_spieler2
        self.cmb_spieler2.FormattingEnabled = true
        self.cmb_spieler2.Location = System.Drawing.Point(300, 185)
        self.cmb_spieler2.Name = "cmb_spieler2"
        self.cmb_spieler2.Size = System.Drawing.Size(121, 24)
        self.cmb_spieler2.TabIndex = 13
        //  cmb_spieler3
        self.cmb_spieler3.FormattingEnabled = true
        self.cmb_spieler3.Location = System.Drawing.Point(300, 221)
        self.cmb_spieler3.Name = "cmb_spieler3"
        self.cmb_spieler3.Size = System.Drawing.Size(121, 24)
        self.cmb_spieler3.TabIndex = 14
        //  cmb_spieler4
        self.cmb_spieler4.FormattingEnabled = true
        self.cmb_spieler4.Location = System.Drawing.Point(300, 256)
        self.cmb_spieler4.Name = "cmb_spieler4"
        self.cmb_spieler4.Size = System.Drawing.Size(121, 24)
        self.cmb_spieler4.TabIndex = 15
        //  ckb_spieler1
        self.ckb_spieler1.AutoSize = true
        self.ckb_spieler1.Location = System.Drawing.Point(439, 142)
        self.ckb_spieler1.Name = "ckb_spieler1"
        self.ckb_spieler1.Size = System.Drawing.Size(58, 21)
        self.ckb_spieler1.TabIndex = 16
        self.ckb_spieler1.Text = "CPU"
        self.ckb_spieler1.UseVisualStyleBackColor = true
        //  ckb_spieler2
        self.ckb_spieler2.AutoSize = true
        self.ckb_spieler2.Location = System.Drawing.Point(439, 187)
        self.ckb_spieler2.Name = "ckb_spieler2"
        self.ckb_spieler2.Size = System.Drawing.Size(58, 21)
        self.ckb_spieler2.TabIndex = 17
        self.ckb_spieler2.Text = "CPU"
        self.ckb_spieler2.UseVisualStyleBackColor = true
        //  ckb_spieler3
        self.ckb_spieler3.AutoSize = true
        self.ckb_spieler3.Location = System.Drawing.Point(439, 223)
        self.ckb_spieler3.Name = "ckb_spieler3"
        self.ckb_spieler3.Size = System.Drawing.Size(58, 21)
        self.ckb_spieler3.TabIndex = 18
        self.ckb_spieler3.Text = "CPU"
        self.ckb_spieler3.UseVisualStyleBackColor = true
        //  ckb_spieler4
        self.ckb_spieler4.AutoSize = true
        self.ckb_spieler4.Location = System.Drawing.Point(439, 258)
        self.ckb_spieler4.Name = "ckb_spieler4"
        self.ckb_spieler4.Size = System.Drawing.Size(58, 21)
        self.ckb_spieler4.TabIndex = 19
        self.ckb_spieler4.Text = "CPU"
        self.ckb_spieler4.UseVisualStyleBackColor = true
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
        self.Controls.Add(self.ckb_spieler4)
        self.Controls.Add(self.ckb_spieler3)
        self.Controls.Add(self.ckb_spieler2)
        self.Controls.Add(self.ckb_spieler1)
        self.Controls.Add(self.cmb_spieler4)
        self.Controls.Add(self.cmb_spieler3)
        self.Controls.Add(self.cmb_spieler2)
        self.Controls.Add(self.cmb_spieler1)
        self.Controls.Add(self.tb_spieler4)
        self.Controls.Add(self.tb_spieler3)
        self.Controls.Add(self.tb_spieler2)
        self.Controls.Add(self.tb_spieler1)
        self.Controls.Add(self.rbtn_anz_4)
        self.Controls.Add(self.rbtn_anz_3)
        self.Controls.Add(self.rbtn_anz_2)
        self.Controls.Add(self.lbl_spieler4)
        self.Controls.Add(self.lbl_spieler3)
        self.Controls.Add(self.lbl_spieler2)
        self.Controls.Add(self.lbl_spieler1)
        self.Controls.Add(self.lbl_anzahl_spieler)
        self.Name = "frm_Einstellungen"
        self.Text = "frm_Einstellungen"
        self.FormClosing += System.Windows.Forms.FormClosingEventHandler(self.frm_Einstellungen_FormClosing)
        self.Load += System.EventHandler(self.frm_Einstellungen_Load)
        self.ResumeLayout(false)
        self.PerformLayout()
    }

	#endregion
}