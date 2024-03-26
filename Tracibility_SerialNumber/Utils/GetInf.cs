using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TracibilitySN.Utils
{
    public class GetInf
    {
        Password_hash Decrypt_Password;
        public string key = "b14ca5898a4e4133bbce2ea2315a1916";
        public List<string> InfUser(String URL)
        {
            Decrypt_Password = new Password_hash();
            string ID = "", Hovaten = "", AD = "";

            string[] arrListStr;
            var Inf = new List<String>()
                {
                    ID,Hovaten,AD
                };
            try
            {
                //String Str = HttpContext.Current.Request.Url.AbsoluteUri;
                String Str1 = URL.ToString().Replace("%2f", "/");
                arrListStr = Str1.Split('?');
                string[] arrListStr1 = Decrypt_Password.Decrypt(key, arrListStr[1].Trim()).ToString().Split('&');
                ID = arrListStr1[0].ToString().Replace("ID=", "");
                Hovaten = arrListStr1[2].ToString().Replace("HT=", "");
                Hovaten = Hovaten.Replace("%20", " ");
                Hovaten = Hovaten.Replace("+", " ");
                AD = arrListStr1[4].ToString().Replace("AD=", "");
                AD = AD.Replace("x", "");
                Inf = new List<string>
                {
                    ID,Hovaten,AD
                };
                return Inf;
            }
            catch { return Inf; }
        }
    }
}