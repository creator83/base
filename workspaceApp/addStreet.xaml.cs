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
    /// Логика взаимодействия для addStreet.xaml
    /// </summary>
    public partial class addStreet : Window
    {
        public addStreet()
        {
            InitializeComponent();
            globalEl.connector.setQuery("SELECT name FROM region");
            globalEl.connector.openConnection();
            globalEl.connector.readBuffer(ref region);
            globalEl.connector.closeConnection();
            MainWindow window = this.Owner as MainWindow;
            //string str = window.region.SelectedValue.ToString();
            region.SelectedIndex = globalEl.sItems.region;

            state.Items.Clear();
            globalEl.connector.setQuery("SELECT name FROM stateReg WHERE region = '" + region.SelectedValue.ToString() + "'");
            globalEl.connector.openConnection();
            globalEl.connector.readBuffer(ref state);
            globalEl.connector.closeConnection();
            state.SelectedIndex = globalEl.sItems.state;

            //region.SelectedIndex = region.Items.IndexOf("Краснодарский край");
            prfx.Items.Add("ул.");
            prfx.Items.Add("проезд.");
            prfx.Items.Add("пр-т.");
            prfx.Items.Add("пер.");
            prfx.SelectedIndex = prfx.Items.IndexOf("ул.");
            addButton.ToolTip = "Добавить улицу";
                       
        }

        private void addButton_Click(object sender, RoutedEventArgs e)
        {
            if (street.Text == "")
            {
                MessageBox.Show("Не введено ни одногозначения", "Ошибка ввода", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                MainWindow window = this.Owner as MainWindow;
                globalEl.connector.setQuery("INSERT INTO street (name, stateReg, prfxStreet) VALUES ('" + street.Text + "', '" + state.SelectedValue.ToString() + "', '" + prfx.SelectedValue.ToString() + "')");
                globalEl.connector.openConnection();
                globalEl.connector.executeCommand();
                globalEl.connector.closeConnection();

                window.street.Items.Clear();
                globalEl.connector.setQuery("SELECT name FROM street WHERE stateReg = '" + window.stateReg.SelectedValue.ToString() + "'");
                globalEl.connector.openConnection();
                globalEl.connector.readBuffer(ref window.street);
                globalEl.connector.closeConnection();
                Close();
            }
        }

        private void region_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            state.Items.Clear();
            globalEl.connector.setQuery("SELECT name FROM stateReg WHERE region = '" + region.SelectedValue.ToString() + "'");
            globalEl.connector.openConnection();
            globalEl.connector.readBuffer(ref state);
            globalEl.connector.closeConnection();
        }
    }
}
