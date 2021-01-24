using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Albertomoll.BI
{
    public class User
    {
        public string _id { get; set; }
        public int Id { get; set; }
        public string Name { get; set; }
        public float Longitude { get; set; }
        public float Latitude { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public string Cell { get; set; }
        public string About { get; set; }
        public string MoreInfo { get; set; }
        public string ProfileImage { get; set; }
        public string BankName { get; set; }
        public string AccountNumber { get; set; }
        public int Coins { get; set; }
    }

    
}