using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcApplication1.Models
{
	public class cinemaToMovieMapping
	{
		int ID;
		int cID;
		int mID;
		int slots;
		string date;
		public cinemaToMovieMapping(int ID, int cID, int mID, int slots, string date)
		{
			this.ID = ID;
			this.cID = cID;
			this.mID = mID;
			this.slots = slots;
			this.date = date;

		}
	}
}