using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Threading;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using MySql.Data.MySqlClient;
using Word = Microsoft.Office.Interop.Word;
using System.IO;


namespace workspaceApp
{
    static class globalEl
    {
        public static StringBuilder region = new StringBuilder();
        public static StringBuilder state = new StringBuilder();
        public static List<UIElement>[] all = new List<UIElement>[5];
        public static sqlConnector connector = new sqlConnector();
        public static int nDoc;
        public static List<string> templateLetters = new List<string>();
        public static List<string> templateTu = new List<string>();
        public struct selectedItem
        {
            public int region;
            public int state;
        }
        public static globalEl.selectedItem sItems = new globalEl.selectedItem();
    }
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    
    public partial class MainWindow : Window
    {
        List<UIElement> elements = new List<UIElement>();
        List<TextBox> allTBox = new List<TextBox>();

        
        /*void LoopVisualTree(DependencyObject obj)//обнуление текст боксов
        {
            for (int i = 0; i < VisualTreeHelper.GetChildrenCount(obj); i++)
            {

                if (obj is TextBox)
                {
                    ((TextBox)obj).Text = null;
                }
                // РЕКУРСИЯ
                LoopVisualTree(VisualTreeHelper.GetChild(obj, i));
            }
            
        }*/
        public enum tuFields
        {
            firstName,
            sureName,
            midleName,
            landReg,
            region,
            street
        }
        public enum letterFields
        {
            sureName,
            firstName,
            midleName,
            state,
            street,
            nHouse,
            nApp
        }
        
        string[] executor = new string[2] {"Кошелев В.С.", "Оганесян И.Л."};
        Popup msg = new Popup();
        TextBlock textMsg = new TextBlock();
        DispatcherTimer timer1 = new DispatcherTimer();
        
        public MainWindow()
        {
            InitializeComponent();
            //шаблоны писем
            globalEl.templateLetters.Add ("D:\\Обращения, поручения\\обращение.dotx");
            globalEl.templateLetters.Add ("D:\\Обращения, поручения\\служебная_записка.dotx");
            globalEl.templateLetters.Add ("");
            globalEl.templateLetters.Add ("");
            globalEl.templateLetters.Add ("");

            //шаблоны технических условий
            globalEl.templateTu.Add("D:\\Технические условия\\wProj.dotx");
            globalEl.templateTu.Add("D:\\Технические условия\\woProj.dotx");

            typeTu.Items.Add("c проектом");
            typeTu.Items.Add("без проекта");
            typeTu.SelectedIndex = 1;

            //fill letter type
            letterType.Items.Add("обращение");
            letterType.Items.Add("служебная записка");
            letterType.Items.Add("инициативное письмо");
            letterType.Items.Add("для сводного ответа");
            letterType.Items.Add("поручения");

            

            
            globalEl.connector.setQuery("SELECT name FROM district");
            globalEl.connector.openConnection();
            globalEl.connector.readBuffer(ref reg);
            globalEl.connector.closeConnection();

            globalEl.connector.setQuery("SELECT name FROM region");
            globalEl.connector.openConnection();
            globalEl.connector.readBuffer(ref region);
            globalEl.connector.closeConnection();
            region.SelectedIndex = region.Items.IndexOf("Краснодарский край");
            
            
            timer1.Tick += new EventHandler(dispatcherTimer_Tick);
            timer1.Interval = new TimeSpan(0, 0, 1);
            
            textMsg.Text = "Какой-то текст";
            textMsg.Background = Brushes.LightSkyBlue;
            textMsg.Foreground = Brushes.Black;
            textMsg.Width = 150;
            textMsg.Height = 100;
            textMsg.TextWrapping = TextWrapping.Wrap;
            msg.Child = textMsg;
            msg.AllowsTransparency = true;
            msg.PopupAnimation = PopupAnimation.Slide;
            msg.IsOpen = true;
            timer1.Start();
            dataSet inputData = new dataSet();
            
            allTBox.Add(sureName);
            allTBox.Add(firstName);
            allTBox.Add(midleName);
            allTBox.Add(numPhone1);
            allTBox.Add(numPhone2);
//            allTBox.Add(street);
            allTBox.Add(numHouse);
            allTBox.Add(numApp);
            allTBox.Add(numKad1);
            allTBox.Add(numKad2);
            allTBox.Add(addressText);
        }

        private void DataGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            MessageBox.Show("Hello");
        }

        private void TextBox_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

        private void newNote_Click(object sender, RoutedEventArgs e)
        {
            var oWord = new Word.Application();
            var oDoc = new Word.Document();
            oDoc = oWord.Documents.Add(globalEl.templateTu[typeTu.SelectedIndex]);
            oWord.Visible = true;
            List<string> inputData = new List<string>();
            //dataSet inputData = new dataSet();
            inputData.Add(firstName.Text.ToString());
            inputData.Add(sureName.Text.ToString());
            inputData.Add(midleName.Text.ToString());
            inputData.Add(reg.Text.ToString());
            inputData.Add(region.Text.ToString());
            inputData.Add(street.Text.ToString());

            //путь для хранения в базе
            string filePathBase = "d:\\\\Технические условия\\\\" + inputData[(int)tuFields.landReg] + 
                "\\\\" + inputData[(int)tuFields.sureName] + "_" + System.DateTime.Now.Day.ToString() +
                "_" + System.DateTime.Now.Month.ToString() + "_" + System.DateTime.Now.Year.ToString() + ".docx";
            //путь для сохранения документа
            string filePath = "d:\\Технические условия\\" + inputData[(int)tuFields.landReg] + 
                "\\" + inputData[(int)tuFields.sureName] + "_" + System.DateTime.Now.Day.ToString() + 
                "_" + System.DateTime.Now.Month.ToString() + "_" + System.DateTime.Now.Year.ToString() + ".docx";

            globalEl.connector.setQuery("SELECT id from street where stateReg = '" + stateReg.SelectedValue.ToString()
            + "' AND name='" + street.SelectedValue.ToString() + "'");
            globalEl.connector.openConnection();
            Int64 idStreet = globalEl.connector.executeInt();
            globalEl.connector.closeConnection();

            string sql = "INSERT INTO tu (nDate, firstName, midleName, sureName, " +
                "numHouse, numAp, numPhone, reg, address, numKadastr, filePlace, typeTu, street) "
                + "VALUES(CURDATE(), '" + inputData[(int)tuFields.firstName] + "', '" +
                inputData[(int)tuFields.midleName] + "', '" + inputData[(int)tuFields.sureName] + 
                "', '" + numHouse.Text + "', '" + numApp.Text + "', '" + numPhone1.Text + numPhone2.Text + 
                "', '" + inputData[(int)tuFields.landReg] + "', '" + addressText.Text + "', '" 
                + numKad1.Text + numKad2.Text + "', '" + filePathBase + "', " + "typeTu+" + 
                typeTu.SelectedIndex.ToString() + ", " + idStreet + ")";
            //addressText.Text = sql;
            globalEl.connector.setQuery(sql);
            globalEl.connector.openConnection();
            globalEl.connector.executeCommand();
            globalEl.connector.closeConnection();

            //возврат значения префикса улицы

            globalEl.connector.setQuery("SELECT prfxStreet FROM street WHERE name = " + "'"
            + street.SelectedValue.ToString() + "'");

            globalEl.connector.openConnection();
            string prfxStreet1 = globalEl.connector.executeString();
            globalEl.connector.closeConnection();
            //возврат значения префикса населённого пункта

            globalEl.connector.setQuery("SELECT prfx FROM district WHERE name = " + "'" 
                + stateReg.SelectedValue.ToString() + "'");
            globalEl.connector.openConnection();
            string prfx1 = globalEl.connector.executeString();
            globalEl.connector.closeConnection();

            globalEl.connector.setQuery("SELECT prfx FROM district WHERE name = " + "'" 
                + inputData[(int)tuFields.landReg] + "'");
            globalEl.connector.openConnection();
            string prfx2 = globalEl.connector.executeString();
            globalEl.connector.closeConnection();

            
            globalEl.connector.setQuery("SELECT EXISTS (SELECT name FROM district WHERE name = " 
                + "'" + stateReg.SelectedValue.ToString() + "')");
            globalEl.connector.openConnection();
            Int64 count  = globalEl.connector.executeInt();
            globalEl.connector.closeConnection();
            
            string fullName = inputData [(int)tuFields.sureName] + " " + 
                inputData[(int)tuFields.firstName].FirstOrDefault() + "." 
                + inputData[(int)tuFields.midleName].FirstOrDefault() + ".";
            oDoc.Bookmarks["name1"].Range.Text = fullName;
            oDoc.Bookmarks["name2"].Range.Text = fullName;
            
            if (count == 1)
            {
                oDoc.Bookmarks["state"].Range.Text = "г. Новороссийск,";
               
                if (stateReg.SelectedValue.ToString() == "Новороссийск")
                {
                    if (numApp.Text == "")
                    {
                        oDoc.Bookmarks["address"].Range.Text = inputData[(int)tuFields.region] 
                        + ", г. Новороссийск, " + prfxStreet1 + " " + street.SelectedValue.ToString() + ", д. " + numHouse.Text;
                        oDoc.Bookmarks["selo"].Range.Text = prfxStreet1 + " " + street.SelectedValue.ToString() + ", д. " + numHouse.Text;
                    }
                    else
                    {
                        oDoc.Bookmarks["address"].Range.Text = inputData[(int)tuFields.region] 
                        + ", г. Новороссийск, " + prfxStreet1 + " " + street.SelectedValue.ToString() 
                        + ", д. " + numHouse.Text + ", кв. " + numApp.Text;
                        oDoc.Bookmarks["selo"].Range.Text = prfxStreet1 + " " + street.SelectedValue.ToString() 
                        + ", д. " + numHouse.Text + ", кв. " + numApp.Text;
                    }
                }
                else
                {
                    oDoc.Bookmarks["selo"].Range.Text = prfx2 + " " + inputData[(int)tuFields.landReg] + ",";
                    if (numApp.Text == "")
                    {
                        oDoc.Bookmarks["street"].Range.Text = prfxStreet1 + " " + street.SelectedValue.ToString() + ", д. " + numHouse.Text;
                        oDoc.Bookmarks["address"].Range.Text = inputData[(int)tuFields.region] 
                        + ", г. Новороссийск, " + prfx2 + " " + inputData[(int)tuFields.landReg] + ", " 
                        + prfxStreet1 + " " + street.SelectedValue.ToString() + ", д. " + numHouse.Text;
                    }
                    else
                    {
                        oDoc.Bookmarks["street"].Range.Text = prfxStreet1 + " " + street.SelectedValue.ToString() + ", д. " 
                        + numHouse.Text + ", кв. " + numApp.Text;
                        oDoc.Bookmarks["address"].Range.Text = inputData[(int)tuFields.region] 
                        + ", г. Новороссийск, " + inputData[(int)tuFields.landReg] + ", " + prfxStreet1 
                        + " " + street.SelectedValue.ToString() + ", д. " + numHouse.Text + ", кв. " + numApp.Text;
                    }
                }
            }
            else
            {
                oDoc.Bookmarks["state"].Range.Text = prfx1 + " " + stateReg.SelectedValue.ToString() + ",";
                oDoc.Bookmarks["address"].Range.Text = inputData[(int)tuFields.region] + ", г. Новороссийск, " 
                + prfxStreet1 + " " + street.SelectedValue.ToString() + ", д. " + numHouse.Text + ", кв. " + numApp.Text;
                oDoc.Bookmarks["selo"].Range.Text = prfxStreet1 + " " + street.SelectedValue.ToString() 
                + ", д. " + numHouse.Text + ", кв. " + numApp.Text;

                if (numApp.Text == "")
                {
                    oDoc.Bookmarks["street"].Range.Text = prfxStreet1 + " " + street.SelectedValue.ToString() 
                    + ", д. " + numHouse.Text;
                }
                else
                {
                    oDoc.Bookmarks["street"].Range.Text = prfxStreet1 + " " + street.SelectedValue.ToString() 
                    + ", д. " + numHouse.Text + ", кв. " + numApp.Text;
                }
            }

            //string descaddress = 
            if (addressText.Text=="")
            {
                oDoc.Bookmarks["address1"].Range.Text = prfx2 + " " + inputData[(int)tuFields.landReg];
            }
            else
            {
                oDoc.Bookmarks["address1"].Range.Text = prfx2 + " " + inputData[(int)tuFields.landReg] + ", " + addressText.Text;
            }
            
            oDoc.Bookmarks["nKad"].Range.Text = numKad1.Text + ":" + numKad2.Text;
            oDoc.Activate();
            oDoc.SaveAs(filePath);
            foreach (var i in allTBox)
            {
                i.Text = null;
            }
            //LoopVisualTree(this);
        }

        private void addRegion_Click(object sender, RoutedEventArgs e)
        {
            addRegWindow w1 = new addRegWindow();
            w1.Owner = this;
            w1.ShowDialog();
           

        }

        private void region_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            globalEl.sItems.region = region.SelectedIndex;
            /*globalEl.region.Remove(0, globalEl.region.Length);
            globalEl.region.Append(region.SelectedValue.ToString());*/
            stateReg.Items.Clear();
            globalEl.connector.setQuery("SELECT name FROM stateReg WHERE region = '" + region.SelectedValue.ToString() + "'");
            globalEl.connector.openConnection();
            globalEl.connector.readBuffer(ref stateReg);
            globalEl.connector.closeConnection();
           }

        private void addState_Click(object sender, RoutedEventArgs e)
        {
            addStateWindow w1 = new addStateWindow();
            w1.Owner = this;
            w1.ShowDialog();
        }
        private void dispatcherTimer_Tick(object sender, EventArgs e)
        {
            timer1.Stop();
            msg.IsOpen = false;
        }

        private void letterType_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            
            sureNameSubChief.Items.Clear();
            globalEl.connector.setQuery("SELECT sureName FROM chiefs where workDistrict = (SELECT id from distPos WHERE name = 'Администрация муниципального образования город Новороссийск')");
            globalEl.connector.openConnection();
            globalEl.connector.readBuffer(ref sureNameSubChief);
            globalEl.connector.closeConnection();

            sureNameP.Items.Clear();
            globalEl.connector.setQuery("SELECT sureName FROM person");
            globalEl.connector.openConnection();
            globalEl.connector.readBuffer(ref sureNameP);
            globalEl.connector.closeConnection();

            List<UIElement> allEl = new List<UIElement>();
            List<UIElement> recourse = new List<UIElement>();
            List<UIElement> serviceLetter = new List<UIElement>();
            List<UIElement> initLetter = new List<UIElement>();
            List<UIElement> groupAnswer = new List<UIElement>();
            List<UIElement> errand = new List<UIElement>();
            //List<UIElement>[] all = new List<UIElement>[5]{recourse, serviceLetter,initLetter, groupAnswer, errand};
            globalEl.all[0] = recourse;
            globalEl.all[1] = serviceLetter;
            globalEl.all[2] = initLetter;
            globalEl.all[3] = groupAnswer;
            globalEl.all[4] = errand;
            allEl.Add(sureNameCLabel);
            allEl.Add(sureNameChief);
            allEl.Add(sureNamePLabel);
            allEl.Add(sureNameP);
            allEl.Add(addP);
            allEl.Add(addChief);
            allEl.Add(checkToChief);
            sureNameSubCLabel.Visibility = Visibility.Visible;
            sureNameSubChief.Visibility = Visibility.Visible;
            addSubChief.Visibility = Visibility.Visible;




            recourse.Add(sureNameP);
            recourse.Add(sureNamePLabel);
            recourse.Add(checkToChief);
            recourse.Add(addP);
            recourse.Add(sureNameSubChief);
            recourse.Add(sureNameSubCLabel);

            serviceLetter.Add(addSubChief);
            serviceLetter.Add(sureNameCLabel);
            serviceLetter.Add(sureNameChief);
            serviceLetter.Add(sureNameSubCLabel);
            serviceLetter.Add(sureNameSubChief);

            initLetter.Add(sureNameCLabel);
            initLetter.Add(sureNameChief);
            initLetter.Add(sureNameSubCLabel);
            initLetter.Add(sureNameSubChief);

            groupAnswer.Add(sureNameCLabel);
            groupAnswer.Add(sureNameChief);
            groupAnswer.Add(sureNameP);
            groupAnswer.Add(sureNamePLabel);
            groupAnswer.Add(addChief);

            errand.Add(sureNameCLabel);
            errand.Add(sureNameChief);
           
            foreach (var i in allEl)
            {
                i.Visibility = Visibility.Hidden;
            }
            globalEl.nDoc = letterType.SelectedIndex;
            foreach (var i in globalEl.all[globalEl.nDoc])
            {
                i.Visibility = Visibility.Visible;
            }
            sureNameChief.Items.Clear();

            if (globalEl.nDoc == 1 || globalEl.nDoc == 4 || globalEl.nDoc == 3)
            {
                globalEl.connector.setQuery("SELECT sureName FROM chiefs where workDistrict = (SELECT id from distPos WHERE name = 'Администрация муниципального образования город Новороссийск')");
                globalEl.connector.openConnection();
                globalEl.connector.readBuffer(ref sureNameChief);
                globalEl.connector.closeConnection();
            }
            else
            {
                globalEl.connector.setQuery("SELECT sureName FROM chiefs where workDistrict = (SELECT id from distPos WHERE name <> 'Администрация муниципального образования город Новороссийск')");
                globalEl.connector.openConnection();
                globalEl.connector.readBuffer(ref sureNameChief);
                globalEl.connector.closeConnection();
            }
            
        }

        private void checkToChief_Checked(object sender, RoutedEventArgs e)
        {
            sureNameCLabel.Visibility = Visibility.Visible;
            sureNameChief.Visibility = Visibility.Visible;
            addChief.Visibility = Visibility.Visible;
            globalEl.connector.setQuery("SELECT sureName FROM chiefs");
            globalEl.connector.openConnection();
            globalEl.connector.readBuffer(ref sureNameChief);
            globalEl.connector.closeConnection();
        }

        private void addP_Click(object sender, RoutedEventArgs e)
        {
            addPerson w1 = new addPerson();
            w1.Owner = this;
            w1.ShowDialog();
        }

        private void checkToChief_Unchecked(object sender, RoutedEventArgs e)
        {
            sureNameCLabel.Visibility = Visibility.Hidden;
            sureNameChief.Visibility = Visibility.Hidden;
            addChief.Visibility = Visibility.Hidden;
            sureNameChief.Items.Clear();
        }

        private void addSubChief_Click(object sender, RoutedEventArgs e)
        {
            addChiefs w1 = new addChiefs();
            w1.Owner = this;
            w1.ShowDialog();
        }

        private void addChief_Click(object sender, RoutedEventArgs e)
        {
            addChiefs w1 = new addChiefs();
            w1.Owner = this;
            w1.ShowDialog();
        }

        private void addStreet_Click(object sender, RoutedEventArgs e)
        {
            addStreet w1 = new addStreet();
            w1.Owner = this;
            w1.ShowDialog();
        }

        private void stateReg_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            globalEl.sItems.state = stateReg.SelectedIndex;
            street.Items.Clear();
            if (stateReg.SelectedValue == null)
            {
                globalEl.region.Remove(0, globalEl.state.Length);
            }
            else
            {
                globalEl.connector.setQuery("SELECT name FROM street WHERE stateReg = '" + stateReg.SelectedValue.ToString() + "'");
                globalEl.connector.openConnection();
                globalEl.connector.readBuffer(ref street);
                globalEl.connector.closeConnection();
            }
            /*globalEl.region.Remove(0, globalEl.state.Length);
            globalEl.region.Append(stateReg.SelectedValue.ToString());*/

        }

        private void newDoc_Click(object sender, RoutedEventArgs e)
        {
            
           /* var oWord = new Word.Application();
            var oDoc = new Word.Document();
            oDoc = oWord.Documents.Add(globalEl.templateLetters[globalEl.nDoc]);
            oWord.Visible = true;
            */
            

            
            //===Данные заявителя===//
            //Фамилия
            List<string> nameP = new List<string>();
            List<string> nameC = new List<string>();
            List<string> nameSC = new List<string>();
            List<string> nameSSC = new List<string>();
            nameP.Add (sureNameP.SelectedValue.ToString());

            
            //Имя+Отчество
            globalEl.connector.setQuery("SELECT p.firstName, p.midleName, s.stateReg, " +
                "s.name, p.nHouse, p.nApp FROM person p " +
                "INNER JOIN street s " +
                "ON p.street = s.id AND p.sureName = " + "'" + nameP[0] + "'");
            globalEl.connector.openConnection();
            globalEl.connector.readBuffer(ref nameP, 6);
            globalEl.connector.closeConnection();

            //===Данные начальника===//
            //Фамилия
            nameC.Add (sureNameChief.SelectedValue.ToString());

            //Имя+Отчество
            globalEl.connector.setQuery("SELECT firstName, midleName FROM chiefs WHERE sureName = " + "'" + nameC[0] + "'");
            globalEl.connector.openConnection();
            globalEl.connector.readBuffer(ref nameC, 2);
            globalEl.connector.closeConnection();
            //===Данные начальника===//
            //Фамилия
            nameSC.Add (sureNameSubChief.SelectedValue.ToString());

            //Имя+Отчество
            globalEl.connector.setQuery("SELECT firstName, midleName FROM chiefs WHERE sureName = " + "'" + nameSC[0] + "'");
            globalEl.connector.openConnection();
            globalEl.connector.readBuffer(ref nameSC, 2);
            globalEl.connector.closeConnection();

            //===Данные исполнителя===//
            //Фамилия
            if (nameSC[(int)letterFields.sureName] == "Оганесян")
            {
                nameSSC.Add ("В.С. Кошелев");
            }
            else
            {
                nameSSC.Add ("И.Л. Оганесян");
            }

            string filePath1 = "d:\\\\Обращения, поручения\\\\" + nameP[(int)letterFields.state] 
                + "\\\\" + nameP[(int)letterFields.sureName] + "_" + System.DateTime.Now.Day.ToString() +
                "_" + System.DateTime.Now.Month.ToString() + "_" + System.DateTime.Now.Year.ToString() + ".docx";
            string filePath2 = "d:\\Обращения, поручения\\" + nameP[(int)letterFields.state] 
                + "\\" + nameP[(int)letterFields.sureName] + "_" + System.DateTime.Now.Day.ToString() +
                "_" + System.DateTime.Now.Month.ToString() + "_" + System.DateTime.Now.Year.ToString() + ".docx";
            
            string sql = "INSERT INTO answers (nDate, sureName, executor, subexecutor, " +
                "description, filePlace) "
                + "VALUES(CURDATE(), '" + nameP[(int)letterFields.sureName] + "', '" 
                + nameSC[(int)letterFields.sureName] + "', '" + nameSSC[(int)letterFields.sureName] 
                + "', '" + descpription.Text + "', '" + filePath1 + "')";
            globalEl.connector.setQuery(sql);
            globalEl.connector.openConnection();
            globalEl.connector.executeCommand();
            globalEl.connector.closeConnection();

            //возврат значения префикса улицы
            /*
            globalEl.connector.setQuery("SELECT prfxStreet FROM street WHERE name = " + "'" + stateReg.SelectedValue.ToString() + "'");

            globalEl.connector.openConnection();
            string prfxStreet1 = globalEl.connector.executeString();
            globalEl.connector.closeConnection();
            //возврат значения префикса населённого пункта

            globalEl.connector.setQuery("SELECT prfx FROM district WHERE name = " + "'" + stateReg.SelectedValue.ToString() + "'");

            globalEl.connector.openConnection();
            string prfx1 = globalEl.connector.executeString();
            globalEl.connector.closeConnection();
            globalEl.connector.setQuery("SELECT prfx FROM district WHERE name = " + "'" + inputData.searchElement(fields.landReg.ToString()) + "'");
            globalEl.connector.openConnection();
            string prfx2 = globalEl.connector.executeString();
            globalEl.connector.closeConnection();


            globalEl.connector.setQuery("SELECT EXISTS (SELECT name FROM district WHERE name = " + "'" + stateReg.SelectedValue.ToString() + "')");

            globalEl.connector.openConnection();
            Int64 count = globalEl.connector.executeInt();
            globalEl.connector.closeConnection();

            string fullName = inputData.searchElement(fields.sureName.ToString()) + " " + inputData.searchElement(fields.firstName.ToString()).FirstOrDefault() + "." + inputData.searchElement(fields.midleName.ToString()).FirstOrDefault() + ".";
            oDoc.Bookmarks["name1"].Range.Text = fullName;
            oDoc.Bookmarks["name2"].Range.Text = fullName;

            if (count == 1)
            {
                oDoc.Bookmarks["state"].Range.Text = "г. Новороссийск,";

                if (inputData.searchElement(stateReg.SelectedValue.ToString()) == "Новороссийск")
                {
                    if (numApp.Text == "")
                    {
                        oDoc.Bookmarks["address"].Range.Text = inputData.searchElement(fields.region.ToString()) + ", г. Новороссийск, " + prfxStreet1 + " " + street.Text + ", д. " + numHouse.Text;
                        oDoc.Bookmarks["selo"].Range.Text = prfxStreet1 + " " + street.Text + ", д. " + numHouse.Text;
                    }
                    else
                    {
                        oDoc.Bookmarks["address"].Range.Text = inputData.searchElement(fields.region.ToString()) + ", г. Новороссийск, " + prfxStreet1 + " " + street.Text + ", д. " + numHouse.Text + ", кв. " + numApp.Text;
                        oDoc.Bookmarks["selo"].Range.Text = prfxStreet1 + " " + street.Text + ", д. " + numHouse.Text + ", кв. " + numApp.Text;
                    }
                }
                else
                {
                    oDoc.Bookmarks["selo"].Range.Text = prfx2 + " " + inputData.searchElement(fields.landReg.ToString()) + ",";
                    if (numApp.Text == "")
                    {
                        oDoc.Bookmarks["street"].Range.Text = prfxStreet1 + " " + street.Text + ", д. " + numHouse.Text;
                        oDoc.Bookmarks["address"].Range.Text = inputData.searchElement(fields.region.ToString()) + ", г. Новороссийск, " + prfx2 + " " + inputData.searchElement(fields.landReg.ToString()) + ", " + prfxStreet1 + " " + street.Text + ", д. " + numHouse.Text;
                    }
                    else
                    {
                        oDoc.Bookmarks["street"].Range.Text = prfxStreet1 + " " + street.Text + ", д. " + numHouse.Text + ", кв. " + numApp.Text;
                        oDoc.Bookmarks["address"].Range.Text = inputData.searchElement(fields.region.ToString()) + ", г. Новороссийск, " + inputData.searchElement(fields.landReg.ToString()) + ", " + prfxStreet1 + " " + street.Text + ", д. " + numHouse.Text + ", кв. " + numApp.Text;
                    }
                }
            }
            else
            {
                oDoc.Bookmarks["state"].Range.Text = prfx1 + " " + stateReg.SelectedValue.ToString() + ",";
                oDoc.Bookmarks["address"].Range.Text = inputData.searchElement(fields.region.ToString()) + ", г. Новороссийск, " + prfxStreet1 + " " + street.Text + ", д. " + numHouse.Text + ", кв. " + numApp.Text;
                oDoc.Bookmarks["selo"].Range.Text = prfxStreet1 + " " + street.Text + ", д. " + numHouse.Text + ", кв. " + numApp.Text;
                if (numApp.Text == "")
                {
                    oDoc.Bookmarks["street"].Range.Text = prfxStreet1 + " " + street.Text + ", д. " + numHouse.Text;
                }
                else
                {
                    oDoc.Bookmarks["street"].Range.Text = prfxStreet1 + " " + street.Text + ", д. " + numHouse.Text + ", кв. " + numApp.Text;
                }
            }
            oDoc.Bookmarks["address1"].Range.Text = prfx2 + " " + inputData.searchElement(fields.landReg.ToString()) + ", " + addressText.Text;
            oDoc.Bookmarks["nKad"].Range.Text = numKad1.Text + ":" + numKad2.Text;
            oDoc.Activate();
            oDoc.SaveAs(filePath2);
            foreach (var i in allTBox)
            {
                i.Text = null;
            }*/
        }
    }

}
