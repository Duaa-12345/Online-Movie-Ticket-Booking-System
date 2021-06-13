using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcApplication1.Models
{
	public class Discount
	{
		int discountID;
		string day;
		string description;
		int DisountPercent;
		public Discount(int discountID, string day, string description, int DisountPercent)
		{
			this.discountID = discountID;
			this.day = day;
			this.description = description;
			this.DisountPercent = DisountPercent;

		}
	}
}