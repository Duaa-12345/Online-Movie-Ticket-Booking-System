using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcApplication1.Models
{
	public class Ticket
	{
		int ticketID;
		int userId;
		int cmid;
		int discount;
		int seatNo;
		public Ticket(int ticketID, int userId, int cmid, int discount, int seatNo)
		{
			this.ticketID = ticketID;
			this.userId = userId;
			this.cmid = cmid;
			this.discount = discount;
			this.seatNo = seatNo;

		}
	}
}