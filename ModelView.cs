using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcApplication1.Models
{
	public class ModelView
	{
		public Users user;
		public Cinemas cinemas;
		public Movies movie;
		int noOfSeats;
		int balance;
		
		public ModelView()
		{
			movie = null;
			cinemas = null;
			user = null;
			noOfSeats = 0;
		}

		public void setMovies(Movies m)
		{
			movie = m;
		}
		public void setCinemas(Cinemas c)
		{
			cinemas = c;
		}
		public void setUser(Users u)
		{
			user = u;
		}
		public void setNoOfSeats(int seats)
		{
			noOfSeats = seats;
		}
		public int getSeats()
		{
			return noOfSeats;
		}
		public int getBalance()
		{
			return 300 * noOfSeats;
		}
	}
}