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
    /// Логика взаимодействия для addChiefs.xaml
    /// </summary>
    public partial class addChiefs : Window
    {
        public addChiefs()
        {
            InitializeComponent();
            globalEl.connector.setQuery("SELECT name FROM distpos");
            globalEl.connector.openConnection();
            globalEl.connector.readBuffer(ref position);
            globalEl.connector.closeConnection();

        }

        private void addP_Click(object sender, RoutedEventArgs e)
        {
            string sql = "INSERT INTO chiefs (sureName, " +
            "firstName, midleName, workDistrict, position) VALUES ('" +
            sureName.Text + "', '" + firstName.Text + "', '" + middleName.Text
            + "', (SELECT id from distPos WHERE name ='" + position.SelectedValue.ToString() + "'), '" + descpription.Text + "')";
            //descpription.Text = sql;
            
            globalEl.connector.setQuery(sql);
            globalEl.connector.openConnection();
            globalEl.connector.executeCommand();
            globalEl.connector.closeConnection();
            MainWindow window = this.Owner as MainWindow;
            window.sureNameChief.Items.Clear();
            globalEl.connector.setQuery("SELECT sureName FROM chiefs where workDistrict = (SELECT id from distPos WHERE name <> 'Администрация муниципального образования город Новороссийск')");
            globalEl.connector.openConnection();
            globalEl.connector.readBuffer(ref window.sureNameChief);
            globalEl.connector.closeConnection();
            Close();
        }

    }
}
