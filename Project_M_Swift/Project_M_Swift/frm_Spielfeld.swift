﻿import System
import System.Collections.Generic
import System.ComponentModel
import System.Data
import System.Drawing
import System.Linq
import System.Text
import System.Windows.Forms
import RemObjects.Elements.System

public __partial class frm_Spielfeld: Form {

    var frm_menue : MainForm
    var frm_einstellungen : frm_Einstellungen
    var wurfzahl : Int32?
    var playerAnzahl : Integer!
    var playerName1 : String?
    var playerName2 : String?
    var playerName3 : String?
    var playerName4 : String?
    var schonGewuerfelt = false
    var blockZuSetzen = false
    var someoneWon = false
    var player1 : Player!
    var player2 : Player!
    var player3 : Player!
    var player4 : Player!
    var yourTurn : Player?
    var propagierender : Feld!
    var allePlayer : List<Player> 
    var iter : IEnumerator<Player>

	public init(myFrm_M : MainForm, myFrm_E : frm_Einstellungen)	{
		frm_menue = myFrm_M
        frm_einstellungen = myFrm_E
        allePlayer = List<Player>()
		InitializeComponent()
        erstellePlayer()
        iter = allePlayer.GetEnumerator()
        setNeighbors()
        setAttributes()
        nextPlayer()
	}

    func erstellePlayer(){
        var CPU1 = false
        var CPU2 = false
        var CPU3 = false
        var CPU4 = false

        //Startfelder außerhalb des Designers ausgrauen
        for c in self.Controls {
            if let startfeld = c as? Startfeld{
                startfeld.BackColor = Color.DarkGray
            }
        }
        for c in frm_einstellungen.Controls{
            if let gb = c as? GroupBox {
                for item in gb.Controls{
                    if let rbtn = item as? RadioButton{
                        if rbtn.Checked{
                            playerAnzahl = Integer.Parse(rbtn.Text)
                        }
                    }
                    else if let tf = item as? TextBox{
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
                    else if let cb = item as? CheckBox{
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
                }
            }
        }
        if CPU1 {
            player1 = CPU (cpuName : playerName1, cpuInhalt : Feld.Content.RED , startfelder : sf_red_1, sf_red_2, sf_red_3, sf_red_4, sf_red_5)
        }
        else{
            player1 = Spieler (spielerName : playerName1, spielerFarbe : Feld.Content.RED, startfelder : sf_red_1, sf_red_2, sf_red_3, sf_red_4, sf_red_5)
        }
        allePlayer.Add(player1)
        lbl_playerName1.Text = playerName1
        if CPU2 {
            player2 = CPU (cpuName : playerName2, cpuInhalt : Feld.Content.GREEN , startfelder : sf_green_1, sf_green_2, sf_green_3, sf_green_4, sf_green_5)
        }
        else{
            player2 = Spieler (spielerName : playerName2, spielerFarbe : Feld.Content.GREEN, startfelder : sf_green_1, sf_green_2, sf_green_3, sf_green_4, sf_green_5)
        }
        allePlayer.Add(player2)
        lbl_playerName2.Text = playerName2
        if playerAnzahl > 2{
            if CPU1 {
                player3 = CPU (cpuName : playerName3, cpuInhalt : Feld.Content.YELLOW , startfelder : sf_yellow_1, sf_yellow_2, sf_yellow_3, sf_yellow_4, sf_yellow_5)
            }
            else{
                player3 = Spieler (spielerName : playerName3, spielerFarbe : Feld.Content.YELLOW, startfelder : sf_yellow_1, sf_yellow_2, sf_yellow_3, sf_yellow_4, sf_yellow_5)
            }
            allePlayer.Add(player3)
            lbl_playerName3.Text = playerName3
            if(playerAnzahl > 3){
                if CPU1 {
                    player4 = CPU (cpuName : playerName4, cpuInhalt : Feld.Content.BLUE, startfelder : sf_blue_1, sf_blue_2, sf_blue_3, sf_blue_4, sf_blue_5)
                }
                else{
                    player4 = Spieler (spielerName : playerName4, spielerFarbe : Feld.Content.BLUE, startfelder : sf_blue_1, sf_blue_2, sf_blue_3, sf_blue_4, sf_blue_5)
                }
                allePlayer.Add(player4)
                lbl_playerName4.Text = playerName4
            }
        }
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
        for c in pnl_alleFelder.Controls{
            if let feld = c as? Feld{
                if let sf = feld as? Startfeld{
                    sf.schonGeruecktWorden = false
                }
                feld.BackColor = getColorFromContent(feld.inhalt)
            }
        }
        //Buttons disablen
        playerButtonsDisablen();
        //Actionbuttons zurücksetzen
        btn_wuerfeln.Enabled = true;
        btn_aussetzen.Enabled = false;
    }

    func getColorFromContent(c : Feld.Content?) -> Color{
        switch c{
            case .RED: 
                return Color.Red
            case .GREEN:
                return Color.Green
            case .YELLOW: 
                return Color.Yellow
            case .BLUE: 
                return Color.Blue
            case .BLACK: 
                return Color.Black
            case .GOAL: 
                return Color.Magenta
            case .BLOCK: 
                return Color.White
            default: 
                return Color.Pink
        }
    }

    func propagiereRueckOptionen(aktuellesFeld : Feld, spruenge : Int32, altesFeld : Feld, playerContent : Feld.Content?){
        if spruenge != 0 {
            if aktuellesFeld.inhalt != Feld.Content.BLOCK{
                for nachbar in aktuellesFeld.nachbarn{
                    if nachbar != altesFeld{
                        propagiereRueckOptionen(nachbar, spruenge: spruenge - 1 , altesFeld: aktuellesFeld , playerContent: playerContent )
                    }
                }
            }
        }
        else if aktuellesFeld.inhalt != playerContent{
            aktuellesFeld.BackColor = Color.LightGray
            if aktuellesFeld.inhalt == Feld.Content.BLOCK{
                aktuellesFeld.Text = Feld.Content.BLOCK.ToString()
            }
            if aktuellesFeld.inhalt!.rawValue <= playerAnzahl && aktuellesFeld.inhalt != playerContent{
                aktuellesFeld.Text = aktuellesFeld.inhalt!.ToString()
                aktuellesFeld.ForeColor = getColorFromContent(aktuellesFeld.inhalt)
            }else if aktuellesFeld.inhalt == Feld.Content.GOAL{
                aktuellesFeld.Text = Feld.Content.GOAL.ToString()
                aktuellesFeld.ForeColor = getColorFromContent(aktuellesFeld.inhalt)
            }
        }
    }

    func nextPlayer(){
        if !(iter.MoveNext()){
            iter.Reset()
            iter.MoveNext()
        }
        yourTurn = iter.Current
        lbl_Anleitungen.Text = "Spieler " + yourTurn!.playerName + 
        ": Bitte würfeln Sie."
        lbl_wurfzahl.Text = ""
        schonGewuerfelt = false
        btn_wuerfeln.Enabled = true
        btn_aussetzen.Enabled = false
        playerButtonsDisablen()
        rueckOptionenZuruecksetzen()
    }

    func playerButtonsDisablen(){
        for feld in pnl_alleFelder.Controls{
            if let sf = feld as? Startfeld{
                if sf.inhalt != yourTurn!.playerFarbe{
                    sf.Enabled = false
                    sf.BackColor = Color.DarkGray
                }
                else if !sf.schonGeruecktWorden{
                    sf.Enabled = true
                    sf.BackColor = getColorFromContent(sf.inhalt)
                }
            }
        }
    }

    func rueckOptionenZuruecksetzen(){
        for c in pnl_alleFelder.Controls{
            if let f = c as? Feld{
                if !(f is Startfeld){
                    f.BackColor = getColorFromContent(f.inhalt)
                    f.Text = ""
                    f.ForeColor = Color.Black
                }
            }
        }
    }

    func ruecken(propTer : Feld!, propDer : Feld!){
        let ursprungscontent = propTer.inhalt
        propTer.inhalt = propDer.inhalt
        propTer.BackColor = propDer.BackColor

        if let sf = propDer as? Startfeld {
            sf.Enabled = false
            sf.schonGeruecktWorden = true
        }
        else {
            propDer.inhalt = Feld.Content.BLACK
            propDer.BackColor = getColorFromContent(propDer.inhalt)
        }

        switch ursprungscontent! {                      //eigene Figuren können nicht geschlagen werden
            case .RED:
                fallthrough
            case .GREEN:
                fallthrough
            case .YELLOW:
                fallthrough
            case .BLUE:
                schlagen(ursprungscontent)
            case .BLOCK:
                blockZuSetzen = true
                lbl_Anleitungen.Text = "Spieler " + yourTurn!.playerName + 
                ": Bitte Block setzen. Hinweis: Unterste Reihe tabu."
                btn_aussetzen.Enabled = false
            case .GOAL:
                gewinnen()
            default:
                break;
        }
        rueckOptionenZuruecksetzen();
    }

    func schlagen(geschlagenerInhalt : Feld.Content?){
        for c in pnl_alleFelder.Controls{
            if let sf = c as? Startfeld{
                if sf.inhalt == geschlagenerInhalt{
                    if !sf.Enabled && sf.schonGeruecktWorden{
                        sf.Enabled = true
                        sf.schonGeruecktWorden = false
                        break
                    }
                }
            }
        }
    }

    func blockieren(wirdBlock : Feld){
        wirdBlock.inhalt = Feld.Content.BLOCK
        wirdBlock.BackColor = getColorFromContent(wirdBlock.inhalt)
        blockZuSetzen = false;
    }

    func gewinnen(){
        someoneWon = true
        btn_wuerfeln.Enabled = false
        btn_aussetzen.Enabled = false
        MessageBox.Show("Spieler " + yourTurn!.playerName + 
        " hat das Spiel gewonnen!")
        lbl_Anleitungen.Text = "Spieler " + yourTurn!.playerName + ": Sie haben gewonnen!"
    }

    func btn_beenden_Click(_ sender: System.Object!, _ e: System.EventArgs!) {
        frm_menue.Show()
        self.Dispose()
    }

    func btn_wuerfeln_Click(_ sender: System.Object!, _ e: System.EventArgs!) {
        var zahlenfee = Random()
        wurfzahl = zahlenfee.Next(1, 7)
        lbl_wurfzahl.Text = wurfzahl!.ToString()
        schonGewuerfelt = true
        btn_wuerfeln.Enabled = false
        btn_aussetzen.Enabled = true
        lbl_Anleitungen.Text = "Spieler " + yourTurn!.playerName + 
        ": Bitte rücken Sie. Eigene Figur anklicken, um Rückoptionen anzeigen zu lassen."
    }

    func btn_aussetzen_Click(_ sender: System.Object!, _ e: System.EventArgs!) {
        nextPlayer()
    }
    

    func btn_reset_Click(_ sender: System.Object!, _ e: System.EventArgs!) {
        resetSpielfeld()
    }

    func btn_Click(_ sender: System.Object!, _ e: System.EventArgs!){
        if let myField = sender as? Feld{
            if !someoneWon{
                if schonGewuerfelt{
                    if !blockZuSetzen{
                        if myField.BackColor != Color.LightGray{
                            rueckOptionenZuruecksetzen()
                        }
                        if myField.BackColor == Color.LightGray{
                            ruecken(myField, propDer : propagierender);
                            if !blockZuSetzen && !someoneWon{
                                nextPlayer()
                            }
                        } else if myField.inhalt == yourTurn!.playerFarbe{
                            propagierender = myField
                            propagiereRueckOptionen(myField, spruenge : wurfzahl!, altesFeld : myField, playerContent : myField.inhalt)
                        }     
                    } else  if myField.entfernungZumZiel <= 36 && myField.inhalt == Feld.Content.BLACK{                                                                   
                        blockieren(myField)
                        nextPlayer()
                    }
                }
            }
        }
    } 

    func frm_Spielfeld_FormClosing(_ sender: System.Object!, _ e: System.Windows.Forms.FormClosingEventArgs!) {
        frm_menue.Dispose()
        frm_einstellungen.Dispose()
        self.Dispose()
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
        btn_0_ziel.setNeighbors(btn_1)
        btn_1.setNeighbors(btn_0_ziel, btn_2_1, btn_2_2)
        btn_2_1.setNeighbors(btn_1, btn_3_1)
        btn_2_2.setNeighbors(btn_1, btn_3_2)
        btn_3_1.setNeighbors(btn_2_1, btn_4_1)
        btn_3_2.setNeighbors(btn_2_2, btn_4_2)
        btn_4_1.setNeighbors(btn_3_1, btn_5_1)
        btn_4_2.setNeighbors(btn_3_2, btn_5_2)
        btn_5_1.setNeighbors(btn_4_1, btn_6_1)
        btn_5_2.setNeighbors(btn_4_2, btn_6_2)
        btn_6_1.setNeighbors(btn_5_1, btn_7_1)
        btn_6_2.setNeighbors(btn_5_2, btn_7_2)
        btn_7_1.setNeighbors(btn_6_1, btn_8_1)
        btn_7_2.setNeighbors(btn_6_2, btn_8_2)
        btn_8_1.setNeighbors(btn_7_1, btn_9_1)
        btn_8_2.setNeighbors(btn_7_2, btn_9_2)
        btn_9_1.setNeighbors(btn_8_1, btn_10_1)
        btn_9_2.setNeighbors(btn_8_2, btn_10_2)
        btn_10_1.setNeighbors(btn_9_1, btn_11_1)
        btn_10_2.setNeighbors(btn_9_2, btn_11_2)
        btn_11_1.setNeighbors(btn_10_1, btn_12_1)
        btn_11_2.setNeighbors(btn_10_2, btn_12_2)
        btn_12_1.setNeighbors(btn_11_1, btn_13_1)
        btn_12_2.setNeighbors(btn_11_2, btn_13_2)
        btn_13_1.setNeighbors(btn_12_1, btn_14_1)
        btn_13_2.setNeighbors(btn_12_2, btn_14_2)
        btn_14_1.setNeighbors(btn_13_1, btn_15_1)
        btn_14_2.setNeighbors(btn_13_2, btn_15_2)
        btn_15_1.setNeighbors(btn_14_1, btn_16_1)
        btn_15_2.setNeighbors(btn_14_2, btn_16_2)
        btn_16_1.setNeighbors(btn_15_1, btn_17_1)
        btn_16_2.setNeighbors(btn_15_2, btn_17_2)
        btn_17_1.setNeighbors(btn_16_1, btn_18_1)
        btn_17_2.setNeighbors(btn_16_2, btn_18_2)
        btn_18_1.setNeighbors(btn_17_1, btn_19_1)
        btn_18_2.setNeighbors(btn_17_2, btn_19_1)
        btn_19_1.setNeighbors(btn_18_1, btn_18_2, btn_20_1)
        btn_20_1.setNeighbors(btn_19_1, btn_21_1)
        btn_21_1.setNeighbors(btn_20_1, btn_22_1, btn_22_2)
        btn_22_1.setNeighbors(btn_21_1, btn_23_1)
        btn_22_2.setNeighbors(btn_21_1, btn_23_2)
        btn_23_1.setNeighbors(btn_22_1, btn_24_1)
        btn_23_2.setNeighbors(btn_22_2, btn_24_2)
        btn_24_1.setNeighbors(btn_23_1, btn_25_1)
        btn_24_2.setNeighbors(btn_23_2, btn_25_2)
        btn_25_1.setNeighbors(btn_24_1, btn_26_1, btn_26_2)
        btn_25_2.setNeighbors(btn_24_2, btn_26_3, btn_26_4)
        btn_26_1.setNeighbors(btn_25_1, btn_27_1)
        btn_26_2.setNeighbors(btn_25_1, btn_27_2)
        btn_26_3.setNeighbors(btn_25_2, btn_27_2)
        btn_26_4.setNeighbors(btn_25_2, btn_27_3)
        btn_27_1.setNeighbors(btn_26_1, btn_28_1)
        btn_27_2.setNeighbors(btn_26_2, btn_26_3)
        btn_27_3.setNeighbors(btn_26_4, btn_28_2)
        btn_28_1.setNeighbors(btn_27_1, btn_29_1)
        btn_28_2.setNeighbors(btn_27_3, btn_29_2)
        btn_29_1.setNeighbors(btn_28_1, btn_30_1, btn_30_2)
        btn_29_2.setNeighbors(btn_28_2, btn_30_3, btn_30_4)
        btn_30_1.setNeighbors(btn_29_1, btn_31_1)
        btn_30_2.setNeighbors(btn_29_1, btn_31_2)
        btn_30_3.setNeighbors(btn_29_2, btn_31_3)
        btn_30_4.setNeighbors(btn_29_2, btn_31_4)
        btn_31_1.setNeighbors(btn_30_1, btn_32_1)
        btn_31_2.setNeighbors(btn_30_2, btn_32_2, btn_32_3)
        btn_31_3.setNeighbors(btn_30_3, btn_32_4, btn_32_5)
        btn_31_4.setNeighbors(btn_30_4, btn_32_6)
        btn_32_1.setNeighbors(btn_31_1, btn_33_1)
        btn_32_2.setNeighbors(btn_31_2, btn_33_2)
        btn_32_3.setNeighbors(btn_31_2, btn_33_3)
        btn_32_4.setNeighbors(btn_31_3, btn_33_3)
        btn_32_5.setNeighbors(btn_31_3, btn_33_4)
        btn_32_6.setNeighbors(btn_31_4, btn_33_5)
        btn_33_1.setNeighbors(btn_32_1, btn_34_1, btn_34_2)
        btn_33_2.setNeighbors(btn_32_2, btn_34_3, btn_34_4)
        btn_33_3.setNeighbors(btn_32_3, btn_32_4)
        btn_33_4.setNeighbors(btn_32_5, btn_34_5, btn_34_6)
        btn_33_5.setNeighbors(btn_32_6, btn_34_7, btn_34_8)
        btn_34_1.setNeighbors(btn_33_1, btn_35_1)
        btn_34_2.setNeighbors(btn_33_1, btn_35_2)
        btn_34_3.setNeighbors(btn_33_2, btn_35_2)
        btn_34_4.setNeighbors(btn_33_2, btn_35_3)
        btn_34_5.setNeighbors(btn_33_4, btn_35_3)
        btn_34_6.setNeighbors(btn_33_4, btn_35_4)
        btn_34_7.setNeighbors(btn_33_5, btn_35_4)
        btn_34_8.setNeighbors(btn_33_5, btn_35_5)
        btn_35_1.setNeighbors(btn_34_1, btn_36_1)
        btn_35_2.setNeighbors(btn_34_2, btn_34_3, btn_36_2)
        btn_35_3.setNeighbors(btn_34_4, btn_34_5, btn_36_3)
        btn_35_4.setNeighbors(btn_34_6, btn_34_7, btn_36_4)
        btn_35_5.setNeighbors(btn_34_8, btn_36_5)
        btn_36_1.setNeighbors(btn_35_1, btn_37_1)
        btn_36_2.setNeighbors(btn_35_2, btn_37_2)
        btn_36_3.setNeighbors(btn_35_3, btn_37_3)
        btn_36_4.setNeighbors(btn_35_4, btn_37_4)
        btn_36_5.setNeighbors(btn_35_5, btn_37_5)
        btn_37_1.setNeighbors(btn_36_1, btn_38_1)
        btn_37_2.setNeighbors(btn_36_2, btn_38_2, btn_38_3)
        btn_37_3.setNeighbors(btn_36_3, btn_38_4, btn_38_5)
        btn_37_4.setNeighbors(btn_36_4, btn_38_6, btn_38_7)
        btn_37_5.setNeighbors(btn_36_5, btn_38_8)
        btn_38_1.setNeighbors(btn_37_1, btn_39_1)
        btn_38_2.setNeighbors(btn_37_2, btn_39_1)
        btn_38_3.setNeighbors(btn_37_2, btn_39_2)
        btn_38_4.setNeighbors(btn_37_3, btn_39_2)
        btn_38_5.setNeighbors(btn_37_3, btn_39_3)
        btn_38_6.setNeighbors(btn_37_4, btn_39_3)
        btn_38_7.setNeighbors(btn_37_4, btn_39_4)
        btn_38_8.setNeighbors(btn_37_5, btn_39_4)
        btn_39_1.setNeighbors(btn_38_1, btn_38_2)   //, sf_red_1, sf_red_2, sf_red_3, sf_red_4, sf_red_5)                         //wollen nie in startfelder zurückrücken
        btn_39_2.setNeighbors(btn_38_3, btn_38_4) //, sf_green_1, sf_green_2, sf_green_3, sf_green_4, sf_green_5)
        btn_39_3.setNeighbors(btn_38_5, btn_38_6) //, sf_yellow_1, sf_yellow_2, sf_yellow_3, sf_yellow_4, sf_yellow_5)
        btn_39_4.setNeighbors(btn_38_7, btn_38_8) //, sf_blue_1, sf_blue_2, sf_blue_3, sf_blue_4, sf_blue_5)
        sf_red_1.setNeighbors(btn_39_1)
        sf_red_2.setNeighbors(btn_39_1)
        sf_red_3.setNeighbors(btn_39_1)
        sf_red_4.setNeighbors(btn_39_1)
        sf_red_5.setNeighbors(btn_39_1)
        sf_green_1.setNeighbors(btn_39_2)
        sf_green_2.setNeighbors(btn_39_2)
        sf_green_3.setNeighbors(btn_39_2)
        sf_green_4.setNeighbors(btn_39_2)
        sf_green_5.setNeighbors(btn_39_2)
        sf_yellow_1.setNeighbors(btn_39_3)
        sf_yellow_2.setNeighbors(btn_39_3)
        sf_yellow_3.setNeighbors(btn_39_3)
        sf_yellow_4.setNeighbors(btn_39_3)
        sf_yellow_5.setNeighbors(btn_39_3)
        sf_blue_1.setNeighbors(btn_39_4)
        sf_blue_2.setNeighbors(btn_39_4)
        sf_blue_3.setNeighbors(btn_39_4)
        sf_blue_4.setNeighbors(btn_39_4)
        sf_blue_5.setNeighbors(btn_39_4)
    }
}