public __partial class frm_Sieg {
		
	/// <summary>
	/// Required designer variable.
	/// </summary>
	var components: System.ComponentModel.IContainer! = nil
    
    
    
    
    var btn_okay: System.Windows.Forms.Button!
    var lbl_gewinnerName: System.Windows.Forms.Label!
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
        self.label1 = System.Windows.Forms.Label()
        self.lbl_gewinnerName = System.Windows.Forms.Label()
        self.btn_okay = System.Windows.Forms.Button()
        self.SuspendLayout()
        //  label1
        self.label1.AutoSize = true
        self.label1.Font = System.Drawing.Font("Microsoft Sans Serif", 16.2000007629395, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, 0 as! System.Byte)
        self.label1.Location = System.Drawing.Point(7, 13)
        self.label1.Name = "label1"
        self.label1.Size = System.Drawing.Size(310, 32)
        self.label1.TabIndex = 0
        self.label1.Text = "Sie haben gewonnen:"
        //  lbl_gewinnerName
        self.lbl_gewinnerName.AutoSize = true
        self.lbl_gewinnerName.Font = System.Drawing.Font("Microsoft Sans Serif", 10.1999998092651, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, 0 as! System.Byte)
        self.lbl_gewinnerName.Location = System.Drawing.Point(102, 58)
        self.lbl_gewinnerName.Name = "lbl_gewinnerName"
        self.lbl_gewinnerName.Size = System.Drawing.Size(121, 20)
        self.lbl_gewinnerName.TabIndex = 1
        self.lbl_gewinnerName.Text = "Gewinnername"
        self.lbl_gewinnerName.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        //  btn_okay
        self.btn_okay.Location = System.Drawing.Point(79, 115)
        self.btn_okay.Name = "btn_okay"
        self.btn_okay.Size = System.Drawing.Size(167, 64)
        self.btn_okay.TabIndex = 2
        self.btn_okay.Text = "Okay"
        self.btn_okay.UseVisualStyleBackColor = true
        self.btn_okay.Click += System.EventHandler(self.btn_okay_Click)
        //  frm_Sieg
        self.AutoScaleDimensions = System.Drawing.SizeF(8.0, 16)
        self.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        self.ClientSize = System.Drawing.Size(324, 203)
        self.Controls.Add(self.btn_okay)
        self.Controls.Add(self.lbl_gewinnerName)
        self.Controls.Add(self.label1)
        self.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
        self.Name = "frm_Sieg"
        self.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        self.Text = "Sieg"
        self.ResumeLayout(false)
        self.PerformLayout()
    }

	#endregion
}