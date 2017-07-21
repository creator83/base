using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using System.Windows.Controls;

namespace workspaceApp
{
    
        public class sqlConnector
    {
        MySqlConnection conn;
        MySqlCommand sqlComm;
        MySqlDataReader buffer;
        string user;
        string password;
        public sqlConnector (string u = "root", string p = "pass")
        {
            user = u;
            password = p;
            conn = new MySqlConnection("server = localhost;user=" + user + ";database=workspace;port=3306;password=" + password + ";");
            sqlComm = new MySqlCommand();
            sqlComm.Connection = conn;
        }
        public void setQuery (string s)
        {
            sqlComm.CommandText = s;
        }
        public void executeCommandToBuffer ()
        {
            buffer = sqlComm.ExecuteReader();
        }

        public void executeCommand ()
        {
            sqlComm.ExecuteReader();
        }
        public void readBuffer (ref string s)
        {
            buffer = sqlComm.ExecuteReader();
            while (buffer.Read())
            {
                s = buffer.GetString(0);
            }
            buffer.Close();
        }

        public void readBuffer (ref List<string> s, int n)
        {
            buffer = sqlComm.ExecuteReader();
            
            for (int i =0; i<n; ++i)
            {
                buffer.Read();
                s.Add (buffer.GetString(i));
                
            }
            buffer.Close();
        }
        public void readBuffer (ref ComboBox c)
        {
            buffer = sqlComm.ExecuteReader();
            while (buffer.Read())
            {
                c.Items.Add (buffer.GetString(0));
            }
            buffer.Close();
        }

        public string executeString ()
        {
            return (string)sqlComm.ExecuteScalar();
        }
        public Int64 executeInt ()
        {
            buffer = sqlComm.ExecuteReader();
            buffer.Read();
            return buffer.GetInt64(0);
        }
        public void openConnection ()
        {
            conn.Open();
        }
        public void closeConnection ()
        {
            conn.Close();
        }
    }
}
