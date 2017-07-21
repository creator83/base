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
using MySql.Data.MySqlClient;

namespace workspaceApp
{
    /// <summary>
    /// Логика взаимодействия для addRegWindow.xaml
    /// </summary>
    public partial class addRegWindow : Window
    {
        public addRegWindow()
        {
            InitializeComponent();
            
        }


        private void Button_Click(object sender, RoutedEventArgs e)
        {
            MainWindow window = this.Owner as MainWindow;
            if (newRegion.Text == "")
            {
                MessageBox.Show("Не введено ни одногозначения", "Ошибка ввода", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                globalEl.connector.setQuery("INSERT INTO region (name) VALUES ('" + newRegion.Text.ToString() + "')");
                globalEl.connector.openConnection();
                globalEl.connector.executeCommand();
                globalEl.connector.closeConnection();

                window.region.Items.Clear();
                globalEl.connector.setQuery("SELECT name FROM region");
                globalEl.connector.openConnection();
                globalEl.connector.readBuffer(ref window.region);
                globalEl.connector.closeConnection();

                Close();
            }
        }
    }
}
