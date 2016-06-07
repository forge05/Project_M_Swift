import System
import System.Collections.Generic
import System.ComponentModel
import System.Data
import System.Drawing
import System.Linq
import System.Text
import System.Windows.Forms
import RemObjects.Elements.System

public __partial class frm_Spielfeld: Form {

    var frm_einstellungen : frm_Einstellungen
    var frm_menue : MainForm
    var wurfzahl : Int32?
    var allePlayer : List<Player> 
    var iter : IEnumerator<Player>
    var playerAnzahl : Integer!
    var playerName1 : String?
    var playerName2 : String?
    var playerName3 : String?
    var playerName4 : String?
    var schonGewuerfelt = false
    var someoneWon = false
    var blockZuSetzen = false
    var player_1 : Player!
    var player_2 : Player!
    var player_3 : Player!
    var player_4 : Player!
    var player : Player[4]
    var yourTurn : Player?
    //var an_der_Reihe_Index = -1
    var propagierender : Feld!


	public init(menue : MainForm, einstellungen : frm_Einstellungen)	{
		frm_menue = menue
        frm_einstellungen = einstellungen
        allePlayer = List<Player>()
		InitializeComponent()
        erstellePlayer()
        iter = allePlayer.GetEnumerator()
        setAttributes()
        setNeighbors()
        nextPlayer()
	}


    func nextPlayer(){
        //        an_der_Reihe_Index++
        //        if(an_der_Reihe_Index >= playerAnzahl){
        //            //label auktualisiert
        //            an_der_Reihe_Index = 0
        //        }
        if !(iter.MoveNext()){
            iter.Reset()
            iter.MoveNext()
        }
        yourTurn = iter.Current
        lbl_anDerReihe.Text = "Spieler " + yourTurn!.spielerName + ": Bitte würfeln Sie."
        lbl_wurfzahl.Text = ""
        schonGewuerfelt = false
        btn_wuerfeln.Enabled = true
        btn_aussetzen.Enabled = false
        //propagiereZuruecksetzen()
        playerButtonsDisablen()
        

    }

    func playerButtonsDisablen(){
        for c in self.Controls{
            if let feld = c as? Startfeld{
                if feld.inhalt!.rawValue <= (playerAnzahl){
                    if yourTurn!.spielerFarbe != feld.inhalt{
                        feld.Enabled = false
                        feld.BackColor = Color.DarkGray
                    }
                    else if !feld.schonGeruecktWorden{
                        feld.Enabled = true
                        feld.BackColor = getColorFromContent(feld.inhalt)
                    }
                }
            }
        }
    }

    func getColorFromContent(inhalt : Feld.Content?) -> Color{
        switch inhalt!.rawValue{
            case 1: return Color.Red
            case 2: return Color.Green
            case 3: return Color.Yellow
            case 4: return Color.Blue
            case 5: return Color.Black
            case 6: return Color.Magenta
            case 7: return Color.White
            default: return Color.Purple
        }
    }

    func erstellePlayer(){
        var CPU1 = false
        var CPU2 = false
        var CPU3 = false
        var CPU4 = false
        //Startfelder außerhalb des Designers ausgrauen
        for c in self.Controls{
            if let startfeld = c as? Startfeld{
                startfeld.BackColor = Color.DarkGray
            }
        }

        for  c in frm_einstellungen.Controls{
            if let rbtn = c as? RadioButton{
                if rbtn.Checked{
                    playerAnzahl = Integer.Parse(rbtn.Text)
                }
            }
            else if let tf = c as? TextBox{
                if tf.Name == "tb_player1"{
                    playerName1 = tf.Text
                }
                else if tf.Name == "tb_player2"{
                    playerName2 = tf.Text
                }
                else if tf.Name == "tb_player3"{
                    playerName3 = tf.Text
                }
                else if tf.Name == "tb_player4"{
                    playerName4 = tf.Text
                }
            }
            else if let cb = c as? CheckBox{
                if cb.Name == "ckb_spieler1"{
                    if cb.Checked{
                        CPU1 = true
                    }
                }
                else if cb.Name == "ckb_spieler2"{
                    if cb.Checked{
                        CPU2 = true
                    }
                }
                else if cb.Name == "ckb_spieler3"{
                    if cb.Checked{
                        CPU3 = true
                    }
                }
                else if cb.Name == "ckb_spieler4"{
                    if cb.Checked{
                        CPU4 = true
                    }
                }
            }
            //comboBoxen auslesen
            //ComboBox cmb = (ComboBox)sender;
            //foreach ComboBox : Form1.Controls
            //if (cmb == cmb_spielerfarbe1)
            //cmb_spielerfarbe2.Items.Remove(cmb.SelectedItem);
        }
        if CPU1 {
            player_1 = CPU (inhalt : Feld.Content.RED , name : playerName1, startfelder : sf_red_1, sf_red_2, sf_red_3, sf_red_4, sf_red_5)
        }
        else{
            player_1 = Spieler (inhalt : Feld.Content.RED , name : playerName1, startfelder : sf_red_1, sf_red_2, sf_red_3, sf_red_4, sf_red_5)
        }
        allePlayer.Add(player_1)
        lbl_playerName1.Text = player_1.spielerName
        if CPU2 {
            player_2 = CPU (inhalt : Feld.Content.GREEN , name : playerName2, startfelder : sf_green_1, sf_green_2, sf_green_3, sf_green_4, sf_green_5)
        }
        else{
            player_2 = Spieler (inhalt : Feld.Content.GREEN , name : playerName2, startfelder : sf_green_1, sf_green_2, sf_green_3, sf_green_4, sf_green_5)
        }
        allePlayer.Add(player_2)
        lbl_playerName2.Text = player_2.spielerName
        if playerAnzahl > 2{
            if CPU1 {
                player_3 = CPU (inhalt : Feld.Content.YELLOW , name : playerName3, startfelder : sf_yellow_1, sf_yellow_2, sf_yellow_3, sf_yellow_4, sf_yellow_5)
            }
            else{
                player_3 = Spieler (inhalt : Feld.Content.YELLOW , name : playerName3, startfelder : sf_yellow_1, sf_yellow_2, sf_yellow_3, sf_yellow_4, sf_yellow_5)
            }
            allePlayer.Add(player_3)
            lbl_playerName3.Text = player_3.spielerName
            //Player3 einfärben
            for sf in player_3.startfeldArray
            {
                sf.BackColor = getColorFromContent(player_3.spielerFarbe);
            }
            if(playerAnzahl > 3){
                if CPU1 {
                    player_4 = CPU (inhalt : Feld.Content.BLUE , name : playerName4, startfelder : sf_blue_1, sf_blue_2, sf_blue_3, sf_blue_4, sf_blue_5)
                }
                else{
                    player_4 = Spieler (inhalt : Feld.Content.BLUE , name : playerName4, startfelder : sf_blue_1, sf_blue_2, sf_blue_3, sf_blue_4, sf_blue_5)
                }
                allePlayer.Add(player_4)
                lbl_playerName4.Text = player_4.spielerName
                //Player3 einfärben
                for sf in player_4.startfeldArray
                {
                    sf.BackColor = getColorFromContent(player_4.spielerFarbe);
                }
            }
        }
    }

    func rueckOptionenZuruecksetzen(){

        for c in self.Controls{
            if let f = c as? Feld{
                if !(f is Startfeld){
                    f.BackColor = getColorFromContent(f.inhalt)
                    if (f.inhalt != Feld.Content.GOAL)
                    {
                        f.Text = ""
                        f.ForeColor = Color.Black
                    }
                }
            }
        }
    }

    func propagiereRueckOptionen(aktuellesFeld : Feld, spruenge : Int32?, altesFeld : Feld, playerContent : Feld.Content?){
        if spruenge != 0 {
            if aktuellesFeld.inhalt != Feld.Content.BLOCK{
                if let nachbarn = aktuellesFeld.nachbarn as? Feld[]{
                    for nachbar  in nachbarn{
                        if nachbar != altesFeld{
                            propagiereRueckOptionen(nachbar, spruenge: spruenge - 1 , altesFeld: aktuellesFeld , playerContent: playerContent )
                        }
                    }
                }
                
            }
        }
        else if aktuellesFeld.inhalt != playerContent{
            aktuellesFeld.BackColor = Color.Brown
            if aktuellesFeld.inhalt == Feld.Content.BLOCK{
                aktuellesFeld.Text = "Block"
            }
            if aktuellesFeld.inhalt!.rawValue <= playerAnzahl && aktuellesFeld.inhalt != playerContent{
            aktuellesFeld.Text = "Gegner"
            aktuellesFeld.ForeColor = getColorFromContent(aktuellesFeld.inhalt)
            }else if aktuellesFeld.inhalt == Feld.Content.GOAL{
                aktuellesFeld.Text = "Ziel!"
            }
        }
    }

    func ruecken(propTer : Feld , propDer : Feld!){
        var ursprungscontent = propTer.inhalt
        propTer.inhalt = propDer.inhalt
        propTer.BackColor = propDer.BackColor
        if propDer is Startfeld {
            propDer.Enabled = false
            propDer.schonGeruecktWorden = true
        } else {
            propDer.inhalt = Feld.Content.BLACK
            propDer.BackColor = Color.Black
        }

        switch ursprungscontent!.rawValue {                       //eigene Figuren können nicht geschlagen werden
            case 1:
                fallthrough
            case 2:
                fallthrough
            case 3:
                fallthrough
            case 4:
                schlagen(ursprungscontent)
                break;
            case 6:
                gewinnen()
                break;
            case 7:
                lbl_anDerReihe.Text = "Spieler " + yourTurn!.spielerName + ": Bitte Block setzen. Hinweis: unterste Reihe tabu."
                blockZuSetzen = true
                btn_aussetzen.Enabled = false
                break;
            default:
                break;
        }

        rueckOptionenZuruecksetzen();
        
    }

    func schlagen(geschlagenerInhalt : Feld.Content?){
        for c in self.Controls{
            if let startfeld = c as? Startfeld{
                if startfeld.inhalt == geschlagenerInhalt{
                    if !startfeld.Enabled && startfeld.schonGeruecktWorden{
                        startfeld.Enabled = true
                        startfeld.schonGeruecktWorden = false
                        break;
                    }
                }
            }
        }
    }

    func blockieren(wirdBlock : Feld){
        wirdBlock.inhalt = Feld.Content.BLOCK
        wirdBlock.BackColor = Color.White
        blockZuSetzen = false;
    }
    func gewinnen(){
        someoneWon = true
        btn_wuerfeln.Enabled = false
        btn_aussetzen.Enabled = false
        lbl_anDerReihe.Text = "Spieler " + yourTurn!.spielerName + ": Sie haben gewonnen!"
        var siegesNachricht = frm_Sieg(myFrm : self , gewinner : yourTurn!.spielerName)
        siegesNachricht.Show()
        self.Hide()
    }
    
    func btn_Click(_ sender: System.Object!, _ e: System.EventArgs!) {
        if let feld = sender as? Feld{
            if !someoneWon {
                if !blockZuSetzen {
                    if schonGewuerfelt {
                        if feld.BackColor != Color.Brown {
                            rueckOptionenZuruecksetzen()
                        }
                        if feld.BackColor == Color.Brown {
                            ruecken(feld, propDer : propagierender);
                            if !blockZuSetzen && !someoneWon {
                                nextPlayer()
                            }
                        } else if feld.inhalt == yourTurn!.spielerFarbe{
                            propagierender = feld
                            propagiereRueckOptionen(feld, spruenge : wurfzahl, altesFeld : feld, playerContent : feld.inhalt)
                        }     
                    }
                } else  if feld.entfernung_zum_ziel <= 36 && feld.inhalt == Feld.Content.BLACK{                                                                   
                        blockieren(feld)
                        nextPlayer()
                }
            }
        }
    }

    func btn_beenden_Click(_ sender: System.Object!, _ e: System.EventArgs!) {
        frm_einstellungen.Dispose()
        frm_menue.Show()
        self.Dispose()
    }

    func frm_Spielfeld_FormClosing(_ sender: System.Object!, _ e: System.Windows.Forms.FormClosingEventArgs!) {
        frm_einstellungen.Dispose()
        frm_menue.Dispose()
    }

    func btn_wuerfeln_Click(_ sender: System.Object!, _ e: System.EventArgs!) {
        var zahlenfee = Random()
        wurfzahl = zahlenfee.Next(1, 7)
        lbl_wurfzahl.Text = wurfzahl!.ToString()
        schonGewuerfelt = true
        btn_aussetzen.Enabled = true
        btn_wuerfeln.Enabled = false
        lbl_anDerReihe.Text = "Spieler " + yourTurn!.spielerName + ": Bitte rücken Sie. Eigene Figur anklicken, um Rückoptionen anzeigen zu lassen."
    }


    func btn_aussetzen_Click(_ sender: System.Object!, _ e: System.EventArgs!) {
        nextPlayer()
    }
    

    func btn_reset_Click(_ sender: System.Object!, _ e: System.EventArgs!) {
        resetSpielfeld()
    }

    func resetSpielfeld(){
        setAttributes()
        //booleans zurücksetzen
        someoneWon = false
        blockZuSetzen = false
        schonGewuerfelt = false
        //neu zeichnen
        iter.Reset()
        nextPlayer()
        //Startfelder zurücksetzen und alle Felder mit ihrem neuen-alten Content zeichnen
        for c in self.Controls{
            if let feld = c as? Feld{
                feld.BackColor = getColorFromContent(feld.inhalt)
                if let sf = c as? Startfeld{
                    sf.schonGeruecktWorden = false
                }
            }
        }
        //Buttons disablen
        playerButtonsDisablen();
        //Actionbuttons zurücksetzen
        btn_wuerfeln.Enabled = true;
        btn_aussetzen.Enabled = false;
    }


    func setAttributes(){
        btn_0_ziel.setAttributes(Feld.Content.GOAL, distanz : 0)
        btn_1.setAttributes(Feld.Content.BLOCK, distanz : 1)
        btn_2_1.setAttributes(Feld.Content.BLACK, distanz : 2)
        btn_2_2.setAttributes(Feld.Content.BLACK, distanz : 2)
        btn_3_1.setAttributes(Feld.Content.BLACK, distanz : 3)
        btn_3_2.setAttributes(Feld.Content.BLACK, distanz : 3)
        btn_4_1.setAttributes(Feld.Content.BLACK, distanz : 4)
        btn_4_2.setAttributes(Feld.Content.BLACK, distanz : 4)
        btn_5_1.setAttributes(Feld.Content.BLACK, distanz : 5)
        btn_5_2.setAttributes(Feld.Content.BLACK, distanz : 5)
        btn_6_1.setAttributes(Feld.Content.BLACK, distanz : 6)
        btn_6_2.setAttributes(Feld.Content.BLACK, distanz : 6)
        btn_7_1.setAttributes(Feld.Content.BLACK, distanz : 7)
        btn_7_2.setAttributes(Feld.Content.BLACK, distanz : 7)
        btn_8_1.setAttributes(Feld.Content.BLACK, distanz : 8)
        btn_8_2.setAttributes(Feld.Content.BLACK, distanz : 8)
        btn_9_1.setAttributes(Feld.Content.BLACK, distanz : 9)
        btn_9_2.setAttributes(Feld.Content.BLACK, distanz : 9)
        btn_10_1.setAttributes(Feld.Content.BLACK, distanz : 10)
        btn_10_2.setAttributes(Feld.Content.BLACK, distanz : 10)
        btn_11_1.setAttributes(Feld.Content.BLACK, distanz : 11)
        btn_11_2.setAttributes(Feld.Content.BLACK, distanz : 11)
        btn_12_1.setAttributes(Feld.Content.BLACK, distanz : 12)
        btn_12_2.setAttributes(Feld.Content.BLACK, distanz : 12)
        btn_13_1.setAttributes(Feld.Content.BLACK, distanz : 13)
        btn_13_2.setAttributes(Feld.Content.BLACK, distanz : 13)
        btn_14_1.setAttributes(Feld.Content.BLACK, distanz : 14)
        btn_14_2.setAttributes(Feld.Content.BLACK, distanz : 14)
        btn_15_1.setAttributes(Feld.Content.BLACK, distanz : 15)
        btn_15_2.setAttributes(Feld.Content.BLACK, distanz : 15)
        btn_16_1.setAttributes(Feld.Content.BLACK, distanz : 16)
        btn_16_2.setAttributes(Feld.Content.BLACK, distanz : 16)
        btn_17_1.setAttributes(Feld.Content.BLACK, distanz : 17)
        btn_17_2.setAttributes(Feld.Content.BLACK, distanz : 17)
        btn_18_1.setAttributes(Feld.Content.BLACK, distanz : 18)
        btn_18_2.setAttributes(Feld.Content.BLACK, distanz : 18)
        btn_19_1.setAttributes(Feld.Content.BLOCK, distanz : 19)
        btn_20_1.setAttributes(Feld.Content.BLOCK, distanz : 20)
        btn_21_1.setAttributes(Feld.Content.BLOCK, distanz : 21)
        btn_22_1.setAttributes(Feld.Content.BLACK, distanz : 22)
        btn_22_2.setAttributes(Feld.Content.BLACK, distanz : 22)
        btn_23_1.setAttributes(Feld.Content.BLACK, distanz : 23)
        btn_23_2.setAttributes(Feld.Content.BLACK, distanz : 23)
        btn_24_1.setAttributes(Feld.Content.BLACK, distanz : 24)
        btn_24_2.setAttributes(Feld.Content.BLACK, distanz : 24)
        btn_25_1.setAttributes(Feld.Content.BLOCK, distanz : 25)
        btn_25_2.setAttributes(Feld.Content.BLOCK, distanz : 25)
        btn_26_1.setAttributes(Feld.Content.BLACK, distanz : 26)
        btn_26_2.setAttributes(Feld.Content.BLACK, distanz : 26)
        btn_26_3.setAttributes(Feld.Content.BLACK, distanz : 26)
        btn_26_4.setAttributes(Feld.Content.BLACK, distanz : 26)
        btn_27_1.setAttributes(Feld.Content.BLACK, distanz : 27)
        btn_27_2.setAttributes(Feld.Content.BLACK, distanz : 27)
        btn_27_3.setAttributes(Feld.Content.BLACK, distanz : 27)
        btn_28_1.setAttributes(Feld.Content.BLACK, distanz : 28)
        btn_28_2.setAttributes(Feld.Content.BLACK, distanz : 28)
        btn_29_1.setAttributes(Feld.Content.BLACK, distanz : 29)
        btn_29_2.setAttributes(Feld.Content.BLACK, distanz : 29)
        btn_30_1.setAttributes(Feld.Content.BLACK, distanz : 30)
        btn_30_2.setAttributes(Feld.Content.BLACK, distanz : 30)
        btn_30_3.setAttributes(Feld.Content.BLACK, distanz : 30)
        btn_30_4.setAttributes(Feld.Content.BLACK, distanz : 30)
        btn_31_1.setAttributes(Feld.Content.BLACK, distanz : 31)
        btn_31_2.setAttributes(Feld.Content.BLACK, distanz : 31)
        btn_31_3.setAttributes(Feld.Content.BLACK, distanz : 31)
        btn_31_4.setAttributes(Feld.Content.BLACK, distanz : 31)
        btn_32_1.setAttributes(Feld.Content.BLACK, distanz : 32)
        btn_32_2.setAttributes(Feld.Content.BLACK, distanz : 32)
        btn_32_3.setAttributes(Feld.Content.BLACK, distanz : 32)
        btn_32_4.setAttributes(Feld.Content.BLACK, distanz : 32)
        btn_32_5.setAttributes(Feld.Content.BLACK, distanz : 32)
        btn_32_6.setAttributes(Feld.Content.BLACK, distanz : 32)
        btn_33_1.setAttributes(Feld.Content.BLACK, distanz : 33)
        btn_33_2.setAttributes(Feld.Content.BLACK, distanz : 33)
        btn_33_3.setAttributes(Feld.Content.BLACK, distanz : 33)
        btn_33_4.setAttributes(Feld.Content.BLACK, distanz : 33)
        btn_33_5.setAttributes(Feld.Content.BLACK, distanz : 33)
        btn_34_1.setAttributes(Feld.Content.BLACK, distanz : 34)
        btn_34_2.setAttributes(Feld.Content.BLACK, distanz : 34)
        btn_34_3.setAttributes(Feld.Content.BLACK, distanz : 34)
        btn_34_4.setAttributes(Feld.Content.BLACK, distanz : 34)
        btn_34_5.setAttributes(Feld.Content.BLACK, distanz : 34)
        btn_34_6.setAttributes(Feld.Content.BLACK, distanz : 34)
        btn_34_7.setAttributes(Feld.Content.BLACK, distanz : 34)
        btn_34_8.setAttributes(Feld.Content.BLACK, distanz : 34)
        btn_35_1.setAttributes(Feld.Content.BLOCK, distanz : 35)
        btn_35_2.setAttributes(Feld.Content.BLOCK, distanz : 35)
        btn_35_3.setAttributes(Feld.Content.BLOCK, distanz : 35)
        btn_35_4.setAttributes(Feld.Content.BLOCK, distanz : 35)
        btn_35_5.setAttributes(Feld.Content.BLOCK, distanz : 35)
        btn_36_1.setAttributes(Feld.Content.BLACK, distanz : 36)
        btn_36_2.setAttributes(Feld.Content.BLACK, distanz : 36)
        btn_36_3.setAttributes(Feld.Content.BLACK, distanz : 36)
        btn_36_4.setAttributes(Feld.Content.BLACK, distanz : 36)
        btn_36_5.setAttributes(Feld.Content.BLACK, distanz : 36)
        btn_37_1.setAttributes(Feld.Content.BLACK, distanz : 37)
        btn_37_2.setAttributes(Feld.Content.BLACK, distanz : 37)
        btn_37_3.setAttributes(Feld.Content.BLACK, distanz : 37)
        btn_37_4.setAttributes(Feld.Content.BLACK, distanz : 37)
        btn_37_5.setAttributes(Feld.Content.BLACK, distanz : 37)
        btn_38_1.setAttributes(Feld.Content.BLACK, distanz : 38)
        btn_38_2.setAttributes(Feld.Content.BLACK, distanz : 38)
        btn_38_3.setAttributes(Feld.Content.BLACK, distanz : 38)
        btn_38_4.setAttributes(Feld.Content.BLACK, distanz : 38)
        btn_38_5.setAttributes(Feld.Content.BLACK, distanz : 38)
        btn_38_6.setAttributes(Feld.Content.BLACK, distanz : 38)
        btn_38_7.setAttributes(Feld.Content.BLACK, distanz : 38)
        btn_38_8.setAttributes(Feld.Content.BLACK, distanz : 38)
        btn_39_1.setAttributes(Feld.Content.BLACK, distanz : 39)
        btn_39_2.setAttributes(Feld.Content.BLACK, distanz : 39)
        btn_39_3.setAttributes(Feld.Content.BLACK, distanz : 39)
        btn_39_4.setAttributes(Feld.Content.BLACK, distanz : 39)
        sf_red_1.setAttributes(Feld.Content.RED, distanz : 40)
        sf_red_2.setAttributes(Feld.Content.RED, distanz : 40)
        sf_red_3.setAttributes(Feld.Content.RED, distanz : 40)
        sf_red_4.setAttributes(Feld.Content.RED, distanz : 40)
        sf_red_5.setAttributes(Feld.Content.RED, distanz : 40)
        sf_green_1.setAttributes(Feld.Content.GREEN, distanz : 40)
        sf_green_2.setAttributes(Feld.Content.GREEN, distanz : 40)
        sf_green_3.setAttributes(Feld.Content.GREEN, distanz : 40)
        sf_green_4.setAttributes(Feld.Content.GREEN, distanz : 40)
        sf_green_5.setAttributes(Feld.Content.GREEN, distanz : 40)
        sf_yellow_1.setAttributes(Feld.Content.YELLOW, distanz : 40)
        sf_yellow_2.setAttributes(Feld.Content.YELLOW, distanz : 40)
        sf_yellow_3.setAttributes(Feld.Content.YELLOW, distanz : 40)
        sf_yellow_4.setAttributes(Feld.Content.YELLOW, distanz : 40)
        sf_yellow_5.setAttributes(Feld.Content.YELLOW, distanz : 40)
        sf_blue_1.setAttributes(Feld.Content.BLUE, distanz : 40)
        sf_blue_2.setAttributes(Feld.Content.BLUE, distanz : 40)
        sf_blue_3.setAttributes(Feld.Content.BLUE, distanz : 40)
        sf_blue_4.setAttributes(Feld.Content.BLUE, distanz : 40)
        sf_blue_5.setAttributes(Feld.Content.BLUE, distanz : 40)
    }

    func setNeighbors(){
        //weise nachbarn zu
        btn_0_ziel.setNachbar(btn_1)
        btn_1.setNachbar(btn_0_ziel, btn_2_1, btn_2_2)
        btn_2_1.setNachbar(btn_1, btn_3_1)
        btn_2_2.setNachbar(btn_1, btn_3_2)
        btn_3_1.setNachbar(btn_2_1, btn_4_1)
        btn_3_2.setNachbar(btn_2_2, btn_4_2)
        btn_4_1.setNachbar(btn_3_1, btn_5_1)
        btn_4_2.setNachbar(btn_3_2, btn_5_2)
        btn_5_1.setNachbar(btn_4_1, btn_6_1)
        btn_5_2.setNachbar(btn_4_2, btn_6_2)
        btn_6_1.setNachbar(btn_5_1, btn_7_1)
        btn_6_2.setNachbar(btn_5_2, btn_7_2)
        btn_7_1.setNachbar(btn_6_1, btn_8_1)
        btn_7_2.setNachbar(btn_6_2, btn_8_2)
        btn_8_1.setNachbar(btn_7_1, btn_9_1)
        btn_8_2.setNachbar(btn_7_2, btn_9_2)
        btn_9_1.setNachbar(btn_8_1, btn_10_1)
        btn_9_2.setNachbar(btn_8_2, btn_10_2)
        btn_10_1.setNachbar(btn_9_1, btn_11_1)
        btn_10_2.setNachbar(btn_9_2, btn_11_2)
        btn_11_1.setNachbar(btn_10_1, btn_12_1)
        btn_11_2.setNachbar(btn_10_2, btn_12_2)
        btn_12_1.setNachbar(btn_11_1, btn_13_1)
        btn_12_2.setNachbar(btn_11_2, btn_13_2)
        btn_13_1.setNachbar(btn_12_1, btn_14_1)
        btn_13_2.setNachbar(btn_12_2, btn_14_2)
        btn_14_1.setNachbar(btn_13_1, btn_15_1)
        btn_14_2.setNachbar(btn_13_2, btn_15_2)
        btn_15_1.setNachbar(btn_14_1, btn_16_1)
        btn_15_2.setNachbar(btn_14_2, btn_16_2)
        btn_16_1.setNachbar(btn_15_1, btn_17_1)
        btn_16_2.setNachbar(btn_15_2, btn_17_2)
        btn_17_1.setNachbar(btn_16_1, btn_18_1)
        btn_17_2.setNachbar(btn_16_2, btn_18_2)
        btn_18_1.setNachbar(btn_17_1, btn_19_1)
        btn_18_2.setNachbar(btn_17_2, btn_19_1)
        btn_19_1.setNachbar(btn_18_1, btn_18_2, btn_20_1)
        btn_20_1.setNachbar(btn_19_1, btn_21_1)
        btn_21_1.setNachbar(btn_20_1, btn_22_1, btn_22_2)
        btn_22_1.setNachbar(btn_21_1, btn_23_1)
        btn_22_2.setNachbar(btn_21_1, btn_23_2)
        btn_23_1.setNachbar(btn_22_1, btn_24_1)
        btn_23_2.setNachbar(btn_22_2, btn_24_2)
        btn_24_1.setNachbar(btn_23_1, btn_25_1)
        btn_24_2.setNachbar(btn_23_2, btn_25_2)
        btn_25_1.setNachbar(btn_24_1, btn_26_1, btn_26_2)
        btn_25_2.setNachbar(btn_24_2, btn_26_3, btn_26_4)
        btn_26_1.setNachbar(btn_25_1, btn_27_1)
        btn_26_2.setNachbar(btn_25_1, btn_27_2)
        btn_26_3.setNachbar(btn_25_2, btn_27_2)
        btn_26_4.setNachbar(btn_25_2, btn_27_3)
        btn_27_1.setNachbar(btn_26_1, btn_28_1)
        btn_27_2.setNachbar(btn_26_2, btn_26_3)
        btn_27_3.setNachbar(btn_26_4, btn_28_2)
        btn_28_1.setNachbar(btn_27_1, btn_29_1)
        btn_28_2.setNachbar(btn_27_3, btn_29_2)
        btn_29_1.setNachbar(btn_28_1, btn_30_1, btn_30_2)
        btn_29_2.setNachbar(btn_28_2, btn_30_3, btn_30_4)
        btn_30_1.setNachbar(btn_29_1, btn_31_1)
        btn_30_2.setNachbar(btn_29_1, btn_31_2)
        btn_30_3.setNachbar(btn_29_2, btn_31_3)
        btn_30_4.setNachbar(btn_29_2, btn_31_4)
        btn_31_1.setNachbar(btn_30_1, btn_32_1)
        btn_31_2.setNachbar(btn_30_2, btn_32_2, btn_32_3)
        btn_31_3.setNachbar(btn_30_3, btn_32_4, btn_32_5)
        btn_31_4.setNachbar(btn_30_4, btn_32_6)
        btn_32_1.setNachbar(btn_31_1, btn_33_1)
        btn_32_2.setNachbar(btn_31_2, btn_33_2)
        btn_32_3.setNachbar(btn_31_2, btn_33_3)
        btn_32_4.setNachbar(btn_31_3, btn_33_3)
        btn_32_5.setNachbar(btn_31_3, btn_33_4)
        btn_32_6.setNachbar(btn_31_4, btn_33_5)
        btn_33_1.setNachbar(btn_32_1, btn_34_1, btn_34_2)
        btn_33_2.setNachbar(btn_32_2, btn_34_3, btn_34_4)
        btn_33_3.setNachbar(btn_32_3, btn_32_4)
        btn_33_4.setNachbar(btn_32_5, btn_34_5, btn_34_6)
        btn_33_5.setNachbar(btn_32_6, btn_34_7, btn_34_8)
        btn_34_1.setNachbar(btn_33_1, btn_35_1)
        btn_34_2.setNachbar(btn_33_1, btn_35_2)
        btn_34_3.setNachbar(btn_33_2, btn_35_2)
        btn_34_4.setNachbar(btn_33_2, btn_35_3)
        btn_34_5.setNachbar(btn_33_4, btn_35_3)
        btn_34_6.setNachbar(btn_33_4, btn_35_4)
        btn_34_7.setNachbar(btn_33_5, btn_35_4)
        btn_34_8.setNachbar(btn_33_5, btn_35_5)
        btn_35_1.setNachbar(btn_34_1, btn_36_1)
        btn_35_2.setNachbar(btn_34_2, btn_34_3, btn_36_2)
        btn_35_3.setNachbar(btn_34_4, btn_34_5, btn_36_3)
        btn_35_4.setNachbar(btn_34_6, btn_34_7, btn_36_4)
        btn_35_5.setNachbar(btn_34_8, btn_36_5)
        btn_36_1.setNachbar(btn_35_1, btn_37_1)
        btn_36_2.setNachbar(btn_35_2, btn_37_2)
        btn_36_3.setNachbar(btn_35_3, btn_37_3)
        btn_36_4.setNachbar(btn_35_4, btn_37_4)
        btn_36_5.setNachbar(btn_35_5, btn_37_5)
        btn_37_1.setNachbar(btn_36_1, btn_38_1)
        btn_37_2.setNachbar(btn_36_2, btn_38_2, btn_38_3)
        btn_37_3.setNachbar(btn_36_3, btn_38_4, btn_38_5)
        btn_37_4.setNachbar(btn_36_4, btn_38_6, btn_38_7)
        btn_37_5.setNachbar(btn_36_5, btn_38_8)
        btn_38_1.setNachbar(btn_37_1, btn_39_1)
        btn_38_2.setNachbar(btn_37_2, btn_39_1)
        btn_38_3.setNachbar(btn_37_2, btn_39_2)
        btn_38_4.setNachbar(btn_37_3, btn_39_2)
        btn_38_5.setNachbar(btn_37_3, btn_39_3)
        btn_38_6.setNachbar(btn_37_4, btn_39_3)
        btn_38_7.setNachbar(btn_37_4, btn_39_4)
        btn_38_8.setNachbar(btn_37_5, btn_39_4)
        btn_39_1.setNachbar(btn_38_1, btn_38_2)   //, sf_red_1, sf_red_2, sf_red_3, sf_red_4, sf_red_5)                         //wollen nie in startfelder zurückrücken
        btn_39_2.setNachbar(btn_38_3, btn_38_4) //, sf_green_1, sf_green_2, sf_green_3, sf_green_4, sf_green_5)
        btn_39_3.setNachbar(btn_38_5, btn_38_6) //, sf_yellow_1, sf_yellow_2, sf_yellow_3, sf_yellow_4, sf_yellow_5)
        btn_39_4.setNachbar(btn_38_7, btn_38_8) //, sf_blue_1, sf_blue_2, sf_blue_3, sf_blue_4, sf_blue_5)
        sf_red_1.setNachbar(btn_39_1)
        sf_red_2.setNachbar(btn_39_1)
        sf_red_3.setNachbar(btn_39_1)
        sf_red_4.setNachbar(btn_39_1)
        sf_red_5.setNachbar(btn_39_1)
        sf_green_1.setNachbar(btn_39_2)
        sf_green_2.setNachbar(btn_39_2)
        sf_green_3.setNachbar(btn_39_2)
        sf_green_4.setNachbar(btn_39_2)
        sf_green_5.setNachbar(btn_39_2)
        sf_yellow_1.setNachbar(btn_39_3)
        sf_yellow_2.setNachbar(btn_39_3)
        sf_yellow_3.setNachbar(btn_39_3)
        sf_yellow_4.setNachbar(btn_39_3)
        sf_yellow_5.setNachbar(btn_39_3)
        sf_blue_1.setNachbar(btn_39_4)
        sf_blue_2.setNachbar(btn_39_4)
        sf_blue_3.setNachbar(btn_39_4)
        sf_blue_4.setNachbar(btn_39_4)
        sf_blue_5.setNachbar(btn_39_4)
    }
}