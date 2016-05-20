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
    var playerAnzahl : Integer!
    var playerName1 : String?
    var playerName2 : String?
    var playerName3 : String?
    var playerName4 : String?
    var CPU1 = false
    var CPU2 = false
    var CPU3 = false
    var CPU4 = false
    var player_1 : Player!
    var player_2 : Player!
    var player_3 : Player!
    var player_4 : Player!
    var player : Player[4]
    //var an_der_Reihe : Player?
    var an_der_Reihe_Index = -1
    var schonGewuerfelt = false
    var someoneWon = false
    var blockZuSetzen = false
    var propagierender : Feld?


	public init(menue : MainForm, einstellungen : frm_Einstellungen)	{
		frm_menue = menue
        frm_einstellungen = einstellungen
		InitializeComponent()
        attribute()
        nachbarn()
        playerErstellen()
        nextPlayer()
	}


    func nextPlayer(){
        an_der_Reihe_Index++
        if(an_der_Reihe_Index < playerAnzahl){
            //label auktualisiert
            an_der_Reihe_Index = 0
        }
        lbl_wurfzahl.Text = ""
        schonGewuerfelt = false
        btn_wuerfeln.Enabled = true
        btn_aussetzen.Enabled = false
        propagiereZuruecksetzen()

    }

    func propagiereZuruecksetzen(){
        for c in self.Controls{
            if let feld = c as? Feld{
                switch(feld.inhalt){
                    case Feld.Content.RED:
                        feld.BackColor = Color.Red
                        break;
                    case Feld.Content.GREEN:
                        feld.BackColor = Color.Green
                        break;
                    case Feld.Content.YELLOW:
                        feld.BackColor = Color.Yellow
                        break;
                    case Feld.Content.BLUE:
                        feld.BackColor = Color.Blue
                        break;
                    case Feld.Content.BLACK:
                        feld.BackColor = Color.Black
                        break;
                    case Feld.Content.BLOCK:
                        feld.BackColor= Color.White
                        break;
                    case Feld.Content.GOAL:
                        feld.BackColor = Color.Fuchsia
                    default:
                        break;

                }
            }
        }
    }
    func playerErstellen(){

        for  c in frm_einstellungen.Controls{
            if let rbtn = c as? RadioButton{
                if rbtn.Checked{
                    playerAnzahl = Integer.Parse(rbtn.Text)
                }
            }
            else if let tf = c as? TextBox{
                if tf.Name == "tb_spieler1"{
                    playerName1 = tf.Name
                }
                else if tf.Name == "tb_spieler2"{
                    playerName2 = tf.Name
                }
                else if tf.Name == "tb_spieler3"{
                    playerName3 = tf.Name
                }
                else if tf.Name == "tb_spieler4"{
                    playerName4 = tf.Name
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
            player_1 = CPU (inhalt : Feld.Content.RED , name : playerName1)
        }
        else{
            player_1 = Spieler (inhalt : Feld.Content.RED , name : playerName1)
        }
        player[0] = player_1
        if CPU2 {
            player_2 = CPU (inhalt : Feld.Content.GREEN , name : playerName2)
        }
        else{
            player_2 = Spieler (inhalt : Feld.Content.GREEN , name : playerName2)
        }
        player[1] = player_2
        if playerAnzahl >= 3{
            if CPU1 {
                player_3 = CPU (inhalt : Feld.Content.YELLOW , name : playerName3)
            }
            else{
                player_3 = Spieler (inhalt : Feld.Content.YELLOW , name : playerName3)
            }
            player[2] = player_3
            if(playerAnzahl >= 4){
                if CPU1 {
                    player_4 = CPU (inhalt : Feld.Content.BLUE , name : playerName4)
                }
                else{
                    player_4 = Spieler (inhalt : Feld.Content.BLUE , name : playerName4)
                }
                player[3] = player_4
            }
        }
    }

    func attribute(){
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

    func nachbarn(){
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

    func propagiereRueckOptionen(aktuellesFeld : Feld, spruenge : Int32?, altesFeld : Feld, spielerContent : Feld.Content?){
        if spruenge != 0 {
            if aktuellesFeld.inhalt != Feld.Content.BLOCK{
                if let nachbarn = aktuellesFeld.nachbarn as? Feld[]{
                    for nachbar  in nachbarn{
                        if nachbar != altesFeld{
                            propagiereRueckOptionen(nachbar, spruenge: spruenge - 1 , altesFeld: aktuellesFeld , spielerContent: spielerContent )
                        }
                    }
                }
                
            }
        }
        else {
            if aktuellesFeld.inhalt != spielerContent{
                aktuellesFeld.BackColor = Color.Brown
            }
            if aktuellesFeld.inhalt == Feld.Content.BLOCK{
               aktuellesFeld.Text = "Block"
            }
            if aktuellesFeld.inhalt != spielerContent{
                                switch aktuellesFeld.inhalt.rawValue{
                                    case 1:
                                        aktuellesFeld.Text = "Red"
                                        break;
                                    case 2:
                                        aktuellesFeld.Text = "Green"
                                        break;
                                    case 3:
                                        aktuellesFeld.Text = "Yellow"
                                        break;
                                    case 4:
                                        aktuellesFeld.Text = "Blue"
                                        break;
                                    default:
                                        break;
                                }

            }
            if aktuellesFeld.inhalt == Feld.Content.GOAL{
                aktuellesFeld.Text = "Ziel!"
           }
        }

    }

    func propagiereRueckOptionenStartfelder(startfeld : Startfeld, spruenge : Int32?, spielerContent : Feld.Content?){
            
        if let nachbarn = startfeld.nachbarn as? Feld[]{
            for nachbar in nachbarn{
                if let feldnachbar = nachbar as Feld{
                    propagiereRueckOptionen(feldnachbar, spruenge: spruenge - 1, altesFeld : feldnachbar , spielerContent: spielerContent)

                }
            }
        }
                

    }
    
    func btn_Click(_ sender: System.Object!, _ e: System.EventArgs!) {
        
        if let feld = sender as? Feld{
            if let startfeld = sender as? Startfeld{
                if !someoneWon {
                    if !blockZuSetzen {
                        if schonGewuerfelt {
                            if startfeld.BackColor != Color.Brown {
                                propagiereZuruecksetzen()
                            }
                            if startfeld.BackColor == Color.Brown {
                                //ruecken(myfeld, propagierender);
                                if !blockZuSetzen && !someoneWon {
                                    nextPlayer()
                                }
                            } else if startfeld.inhalt == player[an_der_Reihe_Index].spielerFarbe{
                                //propagierender = feld
                                propagiereRueckOptionenStartfelder(startfeld, spruenge : wurfzahl, spielerContent : startfeld.inhalt)
                            }
                        
                            
                        }
                    } else {
                        // blockSetzen(myfeld)
                    }
                
                }
            }
            else{
                if !someoneWon {
                    if !blockZuSetzen {
                        if schonGewuerfelt {
                            if feld.BackColor != Color.Brown {
                                propagiereZuruecksetzen()
                            }
                            if feld.BackColor == Color.Brown {
                                //ruecken(myfeld, propagierender);
                                if !blockZuSetzen && !someoneWon {
                                    nextPlayer()
                                }
                            } else if feld.inhalt == player[an_der_Reihe_Index].spielerFarbe{
                                propagierender = feld
                                //propagiereRueckOptionen(feld, spruenge : wurfzahl, altesFeld : feld, spielerContent : feld.inhalt)
                            }
                        
                            
                        }
                    } else {
                        // blockSetzen(myfeld)
                    }
                
                }
            }
        }
        else if let startfeld = sender as? Startfeld{

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
        lbl_wurfzahl.Text = "" + wurfzahl
        schonGewuerfelt = true
        btn_aussetzen.Enabled = true
        btn_wuerfeln.Enabled = false
        //jlbl_anDerReihe.setText("Spieler " + an_der_Reihe.spielerName + ": Bitte rücken Sie. Eigene Figur anklicken, um Rückoptionen anzeigen zu lassen.");
    }
}