using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcApplication1.Models
{
	public class Seats
	{
		int seatNo;
		int bookedStatus;
		int cid;
		public Seats(int seatNo, int bookedStatus, int cid)
		{
			this.seatNo = seatNo;
			this.bookedStatus = bookedStatus;
			this.cid = cid;
		}
	}
}