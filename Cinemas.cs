using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcApplication1.Models
{
	public class Cinemas
	{
		public string cinemaID;
		public string cinemaName;
		string location;
		string contactNum;
		string email;
		string price;
		public Cinemas(string cinemaID, string cinemaName, string location, string contactNum, string email, string price)
		{
			this.cinemaID = cinemaID;
			this.cinemaName = cinemaName;
			this.location = location;
			this.contactNum = contactNum;
			this.email = email;
			this.price = price;

		}
		public string ToString()
		{
			return " "+ cinemaID +" "+cinemaName+" " +location + " " + " " +  contactNum+ " " + email + " " + price;
		}
	}
}