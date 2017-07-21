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
    /// Логика взаимодействия для addPerson.xaml
    /// </summary>
    public partial class addPerson : Window
    {
        public addPerson()
        {
            InitializeComponent();

            globalEl.connector.setQuery("SELECT name FROM region");
            globalEl.connector.openConnection();
            globalEl.connector.readBuffer(ref region);
            globalEl.connector.closeConnection();
            region.SelectedIndex = region.Items.IndexOf("Краснодарский край");

            state.Items.Clear();
            globalEl.connector.setQuery("SELECT name FROM stateReg WHERE region = '" + region.SelectedValue.ToString() + "'");
            globalEl.connector.openConnection();
            globalEl.connector.readBuffer(ref state);
            globalEl.connector.closeConnection();
        }
        
            

        private void addRegion_Click(object sender, RoutedEventArgs e)
        {
            addRegWindow w1 = new addRegWindow();
            w1.Owner = this;
            w1.ShowDialog();
        }

        private void addState_Click(object sender, RoutedEventArgs e)
        {
            addStateWindow w1 = new addStateWindow();
            w1.Owner = this;
            w1.ShowDialog();
        }

        private void addP_Click(object sender, RoutedEventArgs e)
        {
            MainWindow window = this.Owner as MainWindow;
            if (app.Text == "")
            {
                string sql = "INSERT INTO person (sureName, firstName, " +
                    "midleName, street, nHouse, numPhone) " +
                    "VALUES ('" + sureName.Text + "', '" + firstName.Text + "', '" +
                    middleName.Text + "', (SELECT id FROM street WHERE stateReg='" +
                    state.SelectedValue.ToString() + "' AND name = '" +
                    street.SelectedValue.ToString() + "'), '" + house.Text + "', '" +
                    phone1.Text + phone2.Text + "')";
                globalEl.connector.setQuery(sql);
            }
            else
            {
                string sql = "INSERT INTO person (sureName, firstName, " +
                    "midleName, street, nHouse, numPhone) " +
                    "VALUES ('" + sureName.Text + "', '" + firstName.Text + "', '" +
                    middleName.Text + "', (SELECT id FROM street WHERE stateReg='" +
                    state.SelectedValue.ToString() + "' AND name = '" +
                    street.SelectedValue.ToString() + "'), '" + house.Text + "', '" + 
                    phone1.Text + phone2.Text + "')";
                globalEl.connector.setQuery(sql);
            }
            globalEl.connector.openConnection();
            globalEl.connector.executeCommand();
            globalEl.connector.closeConnection();
            window.sureNameP.Items.Clear();
            globalEl.connector.setQuery("SELECT sureName FROM person");
            globalEl.connector.openConnection();
            globalEl.connector.readBuffer(ref window.sureNameP);
            globalEl.connector.closeConnection();
            Close();
        }

        private void region_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {            
            state.Items.Clear();
            globalEl.connector.setQuery("SELECT name FROM stateReg WHERE region = '" + region.SelectedValue.ToString() + "'");
            globalEl.connector.openConnection();
            globalEl.connector.readBuffer(ref state);
            globalEl.connector.closeConnection();
        }

        private void addStreet_Click(object sender, RoutedEventArgs e)
        {
            addStreet w1 = new addStreet();
            w1.Owner = this;
            w1.ShowDialog();
        }

        private void state_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            street.Items.Clear();
            globalEl.connector.setQuery("SELECT name FROM street WHERE stateReg = '" + state.SelectedValue.ToString() + "'");
            globalEl.connector.openConnection();
            globalEl.connector.readBuffer(ref street);
            globalEl.connector.closeConnection();
        }
    }
}
