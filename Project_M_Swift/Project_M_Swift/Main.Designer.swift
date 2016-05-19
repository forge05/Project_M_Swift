public __partial class MainForm {

	/// <summary>
	/// Required designer variable.
	/// </summary>
	
    var components: System.ComponentModel.IContainer!
    
    
    var btn_beenden: System.Windows.Forms.Button!
    var btn_neues_spiel: System.Windows.Forms.Button!

	/// <summary>
	/// Clean up any resources being used.
	/// </summary>
	/// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
	public override func Dispose(disposing: Boolean) {
		
		if (disposing && (components != nil)) {	
			
			components.Dispose()
		}
		super.Dispose(disposing)
	}

	func InitializeComponent() {
        var resources: System.ComponentModel.ComponentResourceManager! = System.ComponentModel.ComponentResourceManager(MainForm.Type)
        self.btn_neues_spiel = System.Windows.Forms.Button()
        self.btn_beenden = System.Windows.Forms.Button()
        self.SuspendLayout()
        //  btn_neues_spiel
        self.btn_neues_spiel.Location = System.Drawing.Point(60, 29)
        self.btn_neues_spiel.Name = "btn_neues_spiel"
        self.btn_neues_spiel.Size = System.Drawing.Size(107, 23)
        self.btn_neues_spiel.TabIndex = 0
        self.btn_neues_spiel.Text = "Neues Spiel"
        self.btn_neues_spiel.UseVisualStyleBackColor = true
        self.btn_neues_spiel.Click += System.EventHandler(self.btn_neues_spiel_Click)
        //  btn_beenden
        self.btn_beenden.Location = System.Drawing.Point(60, 72)
        self.btn_beenden.Name = "btn_beenden"
        self.btn_beenden.Size = System.Drawing.Size(107, 23)
        self.btn_beenden.TabIndex = 1
        self.btn_beenden.Text = "Beenden"
        self.btn_beenden.UseVisualStyleBackColor = true
        self.btn_beenden.Click += System.EventHandler(self.btn_beenden_Click)
        //  MainForm
        self.ClientSize = System.Drawing.Size(235, 139)
        self.Controls.Add(self.btn_beenden)
        self.Controls.Add(self.btn_neues_spiel)
        self.Icon = resources.GetObject("$this.Icon") as! System.Drawing.Icon
        self.Name = "MainForm"
        self.Text = "MainForm"
        self.ResumeLayout(false)
    }
}
