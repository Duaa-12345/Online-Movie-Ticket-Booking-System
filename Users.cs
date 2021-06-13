using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcApplication1.Models
{
	public class Users
	{
		public string userID;
		string userFname;
		string userLname;
		string age;
		string username;
		string password;
		string email;
		string gender;
		public Users(string userID, string userFname, string userLname, string age, string username, string password, string email, string gender)
		{
			this.userID = userID;
			this.userFname = userFname;
			this.userLname = userLname;
			this.age = age;
			this.username = username;
			this.password = password;
			this.email = email;
			this.gender = gender;
		}
		public string ToString()
		{
			return " " + userID+" "+userFname+" "+userLname+" "+age+" "+username + " " + password + " " + email + " " +gender;
		}
	}
}