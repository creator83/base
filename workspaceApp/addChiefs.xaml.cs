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
            region.Items.Add("");
            region.Items.Add("Новороссийск");
            region.Items.Add("Краснодар");
            region.SelectedIndex = region.Items.IndexOf("");

        }

        private void addP_Click(object sender, RoutedEventArgs e)
        {
            globalEl.connector.setQuery("INSERT INTO chiefs (sureName, firstName, midleName, position, novoross) VALUES ('" + sureName.Text + "', '" + firstName.Text + "', '"+ middleName.Text + "', '" +  descpription.Text + "', " + region.SelectedIndex.ToString() + ")");
            globalEl.connector.openConnection();
            globalEl.connector.executeCommand();
            globalEl.connector.closeConnection();
            Close();
        }

        private void admCheck_Checked(object sender, RoutedEventArgs e)
        {
            region.Visibility = Visibility.Visible;
            regioLabel.Visibility = Visibility.Visible;
        }

        private void admCheck_Unchecked(object sender, RoutedEventArgs e)
        {
            region.Visibility = Visibility.Hidden;
            regioLabel.Visibility = Visibility.Hidden;
        }
    }
}
