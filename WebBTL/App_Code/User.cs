using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebBTL
{
    public class User
    {
        public string name { get; set; }
        public string pw { get; set; }
        public string pw_retype { get; set; }


        public User()
        {

        }
        public User(string name, string password, string repassword)
        {
            this.name = name;
            this.pw = password;
            this.pw_retype = repassword;
        }
    }

}