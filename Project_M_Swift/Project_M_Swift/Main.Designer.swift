__partial class MainForm {

	/// <summary>
	/// Required designer variable.
	/// </summary>
	
    var components: System.ComponentModel.IContainer!
    var button2: System.Windows.Forms.Button!
    var button1: System.Windows.Forms.Button!

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
        self.button1 = System.Windows.Forms.Button()
        self.button2 = System.Windows.Forms.Button()
        self.SuspendLayout()
        //  button1
        self.button1.Location = System.Drawing.Point(120, 57)
        self.button1.Name = "button1"
        self.button1.Size = System.Drawing.Size(75, 23)
        self.button1.TabIndex = 0
        self.button1.Text = "button1"
        self.button1.UseVisualStyleBackColor = true
        //  button2
        self.button2.Location = System.Drawing.Point(120, 100)
        self.button2.Name = "button2"
        self.button2.Size = System.Drawing.Size(75, 23)
        self.button2.TabIndex = 1
        self.button2.Text = "button2"
        self.button2.UseVisualStyleBackColor = true
        //  MainForm
        self.ClientSize = System.Drawing.Size(292, 273)
        self.Controls.Add(self.button2)
        self.Controls.Add(self.button1)
        self.Icon = resources.GetObject("$this.Icon") as! System.Drawing.Icon
        self.Name = "MainForm"
        self.Text = "MainForm"
        self.ResumeLayout(false)
    }
}
