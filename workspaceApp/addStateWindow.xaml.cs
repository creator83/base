using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace workspaceApp
{
    /// <summary>
    /// Логика взаимодействия для addStateWindow.xaml
    /// </summary>
    public partial class addStateWindow : Window
    {
        
        public addStateWindow()
        {
            InitializeComponent();
            //MainWindow window = this.Owner as MainWindow;
            globalEl.connector.setQuery("SELECT name FROM region");
            globalEl.connector.openConnection();
            globalEl.connector.readBuffer(ref regionSelect);
            globalEl.connector.closeConnection();
            regionSelect.SelectedIndex = globalEl.sItems.region;
            prfx.Items.Add("г.");
            prfx.Items.Add("с.");
            prfx.Items.Add("ст.");
            prfx.Items.Add("х.");
            prfx.Items.Add("п.");
            prfx.SelectedIndex = prfx.Items.IndexOf("г.");
            addButton.ToolTip = "Добавить новый населённый пункт";

        }

        private void addButton_Click(object sender, RoutedEventArgs e)
        {
            if (addState.Text == "")
            {
                MessageBox.Show("Не введено ни одногозначения","Ошибка ввода", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                MainWindow window = this.Owner as MainWindow;
                globalEl.connector.setQuery("INSERT INTO stateReg (name, region, prfx) VALUES ('" + addState.Text.ToString() + "', '" + regionSelect.SelectedItem.ToString() + "', '" + prfx.SelectedItem.ToString() + "')");
                globalEl.connector.openConnection();
                globalEl.connector.executeCommand();
                globalEl.connector.closeConnection();

                window.stateReg.Items.Clear();
                globalEl.connector.setQuery("SELECT name FROM stateReg WHERE region = '" + window.region.SelectedValue.ToString() + "'");
                globalEl.connector.openConnection();
                globalEl.connector.readBuffer(ref window.stateReg);
                globalEl.connector.closeConnection();
                Close();
            }
        }
    }
}
