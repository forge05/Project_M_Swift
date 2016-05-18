import System
import System.Collections.Generic
import System.Linq
import System.Threading
import System.Windows.Forms

@main: STAThread
			
Application.EnableVisualStyles()
Application.SetCompatibleTextRenderingDefault(false)
Application.ThreadException += OnThreadException
		
var lMainForm = MainForm()
Application.Run(lMainForm)	

func OnThreadException(sender: Object, _ e: ThreadExceptionEventArgs) {
	
	System.Windows.Forms.MessageBox.Show(e.Exception.Message)
}