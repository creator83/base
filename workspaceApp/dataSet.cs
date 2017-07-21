using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace workspaceApp
{
    class dataSet
    {
        List<string> data;
        List<string> index;

        public dataSet()
        {
            data = new List<string>();
            index = new List<string>();
        }
        public void addElement(string ind, string val)
        {
            data.Add(val);
            index.Add(ind);
        }
        public string searchElement(string s)
        {
            int n = 0;
            foreach (var i in index)
            {
                if (!i.Contains(s)) ++n;
                else break;
            }
            return data[n];
        }
        public string getElement(int n)
        {
            return data[n];
        }

    }
}
